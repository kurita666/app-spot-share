//TabBar.dart
//「すべて」「自転車」「電動サイクル」3つのタブを作成し表示するコード
//map_screen.dart340行目で呼び出される
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  CustomTabBar({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicator: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        border: Border(
          top: BorderSide(
            color: Colors.orange,
            width: 2.0,
          ),
        ),
      ),
      indicatorPadding: EdgeInsets.only(top: 8.0),
      tabs: [
        Expanded(
          child: Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_alarm, size: 16),
                SizedBox(width: 8),
                Text(
                  'すべて',
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.directions_bike, size: 16),
                SizedBox(width: 8),
                Text(
                  '自転車',
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.electric_bike, size: 16),
                SizedBox(width: 8),
                Text(
                  '電動サイクル',
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
          ),
        ),
      ],
      indicatorColor: Colors.transparent,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
    );
  }
}