import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/common_components/widgets/common_drawer.dart';
import 'package:doc_connect/modules/Notifications/bloc/notification_bloc.dart';
import 'package:doc_connect/modules/Notifications/models/notification_model.dart';
import 'package:doc_connect/modules/Notifications/widgets/notificattion_tile.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late final ScrollController _scrollController;
  final NotificationBloc _dataBloc = NotificationBloc();
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print("called init");

    _scrollController = ScrollController();

    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollListener);
    _dataBloc.close();
    super.dispose();
  }

  void _onScrollListener() {
    print("yes scrolling");
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _dataBloc.add(LoadMoreNotificationsEvnet(page: ++page));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
        bloc: _dataBloc,
        builder: (context, state) {
          if (state is NotificationInitial) {
            _dataBloc.add(LoadDataNotificationsEvnet(page: page));
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NotificationSuccess) {
            return body(
                context, state, state.isRead, state.loadedData, state.page);
          } else if (state is NotificationFailureSttae) {
            return body(
                context, state, state.isRead, state.loadedData, state.page);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget body(BuildContext context, var state, bool isRead,
      List<NotificationModelData> loadedData, int page) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text("Notifications"),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(6),
                    color: Colors.white,
                  ),
                  child: Text(
                    '${loadedData.length}',
                    style: const TextStyle(
                      color: ColorKonstants.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            actions: [
              isRead
                  ? TextButton(
                      onPressed: () {
                        _dataBloc.add(MarkAsReadEvent(
                            isRead: false, loadedData: loadedData, page: page));
                      },
                      child: const Text(
                        "Mark all as read",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        _dataBloc.add(UndoNotificationEvent(
                            isRead: true, loadedData: loadedData, page: page));
                      },
                      child: const Text(
                        "Undo",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ]),
        drawer: const CommonDrawer(),
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification &&
                notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
              _dataBloc.add(LoadMoreNotificationsEvnet(page: state.page));
              return true;
            }
            return false;
          },
          child: ListView.builder(
              controller: _scrollController,
              itemCount: state.loadedData.length,
              itemBuilder: (context, index) {
                if (index >= state.loadedData.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  NotificationModelData data = state.loadedData[index];
                  return NotificationTile(
                    isBold: isRead,
                    title: data.title ?? "Text data",
                    subTitle: data.description ?? "4 days ago",
                    iconData: Icons.calendar_today_rounded,
                  );
                }
              }),
        ));
  }
}
