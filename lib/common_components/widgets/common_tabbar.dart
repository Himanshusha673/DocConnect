// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:doc_connect/common_components/widgets/common_drawer.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

class CommonTabBar extends StatefulWidget {
  final String screenTitle;
  final List<Tab> tabItems;
  final List<Widget> tabViewItems;
  final List<Widget> bottomBarItems;
  const CommonTabBar({
    Key? key,
    required this.tabItems,
    required this.tabViewItems,
    required this.screenTitle,
    required this.bottomBarItems,
  }) : super(key: key);

  @override
  State<CommonTabBar> createState() => _CommonTabBarState();
}

class _CommonTabBarState extends State<CommonTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenTitle),
        elevation: 0,
      ),
      drawer: const CommonDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            controller: _tabController,
            tabs: widget.tabItems,
            unselectedLabelColor: Colors.black,
            labelColor: ColorKonstants.primaryColor,
            isScrollable: true,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.tabViewItems,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.bottomBarItems,
        ),
      ),
    );
  }
}
