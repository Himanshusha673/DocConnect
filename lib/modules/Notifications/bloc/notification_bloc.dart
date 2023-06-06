import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:doc_connect/modules/Notifications/models/notification_model.dart';
import 'package:doc_connect/modules/Notifications/models/undoResponse.dart';
import 'package:doc_connect/modules/Notifications/services/notification_services.dart';
import 'package:doc_connect/utils/SharePref.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final List<NotificationModelData> _dataList = mockData;
  final int limit = 12;

  NotificationBloc() : super(const NotificationInitial()) {
    on<LoadDataNotificationsEvnet>(_loadNotifications);

    on<LoadMoreNotificationsEvnet>(_loadMoreNotifications);

    on<MarkAsReadEvent>(_markAsReadEvent);
    on<UndoNotificationEvent>(_undoAsReadEvent);
  }
  FutureOr<void> _loadNotifications(
      LoadDataNotificationsEvnet event, Emitter<NotificationState> emit) async {
    emit(NotificationLoading());
    // print(sharedPrefs.authToken.toString());
    // print(sharedPrefs.id);
    List<NotificationModelData> loadedData;
    NotificationResponse? notificationResponse;
    try {
      if (sharedPrefs.id != null || sharedPrefs.authToken != null) {
        notificationResponse =
            await NotificationReporsitory.fetchAllNotifications(event.page,
                sharedPrefs.id ?? " ", sharedPrefs.authToken ?? " ");
      }
    } catch (e) {
      log(e.toString());
    }

    if (notificationResponse != null) {
      loadedData = notificationResponse.data!;
      emit(NotificationSuccess(
        isRead: true,
        loadedData: loadedData,
        page: event.page,
      ));
    } else {
      log("in Notificationfailure");
      final startIndex = event.page * limit;
      loadedData = _dataList.take(startIndex).toList();
      emit(NotificationFailureSttae(
        isRead: false,
        loadedData: loadedData,
        page: event.page,
      ));
    }
  }

  FutureOr<void> _loadMoreNotifications(
      LoadMoreNotificationsEvnet event, Emitter<NotificationState> emit) async {
    emit(NotificationLoading());
    NotificationResponse? notificationResponse;
    List<NotificationModelData> loadedData;
    //event.page++;
    // if (kDebugMode) {
    //   print("page is${event.page}");
    // }

    notificationResponse = await NotificationReporsitory.fetchAllNotifications(
        event.page, sharedPrefs.id!, sharedPrefs.authToken!);

    if (notificationResponse != null) {
      loadedData = notificationResponse.data!;
      emit(NotificationSuccess(
        isRead: true,
        loadedData: loadedData,
        page: event.page,
      ));
    } else {
      final startIndex = event.page * limit;
      loadedData = _dataList.take(startIndex).toList();
      emit(NotificationFailureSttae(
        isRead: false,
        loadedData: loadedData,
        page: event.page,
      ));
    }
  }

  FutureOr<void> _markAsReadEvent(
      MarkAsReadEvent event, Emitter<NotificationState> emit) {
    emit(NotificationLoading());
    print("in bloc ${event.isRead}");

    emit(NotificationSuccess(
        isRead: event.isRead, loadedData: event.loadedData, page: event.page));
  }

  FutureOr<void> _undoAsReadEvent(
      UndoNotificationEvent event, Emitter<NotificationState> emit) async {
    emit(NotificationLoading());
    UndoResponseData? undoResponseData;
    try {
      log("calling in undo in bloc");
      if (sharedPrefs.id != null || sharedPrefs.authToken != null) {
        undoResponseData = await NotificationReporsitory.undoAllNotifications(
            sharedPrefs.id ?? " ", sharedPrefs.authToken ?? " ");
      }
    } catch (e) {
      log(e.toString());
    }

    emit(NotificationSuccess(
        isRead: undoResponseData!.success ?? event.isRead,
        loadedData: event.loadedData,
        page: event.page));
  }
}
