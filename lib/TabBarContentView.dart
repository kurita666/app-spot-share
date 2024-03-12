import 'package:flutter/material.dart';
import 'AllGenres_Tab.dart';
import 'CyclingGenre_Tab.dart';
import 'ElectricBicycleGenre_Tab.dart';
import 'Reservation_Display.dart';
import 'map_screen.dart'; // map_screen.dartからIconDataModelをインポート

class TabBarContent extends StatefulWidget {
  final TabController tabBarController;
  final IconDataModel iconData; // IconDataModelを追加

  TabBarContent({required this.tabBarController, required this.iconData});

  @override
  _TabBarContentState createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: Stack(
        children: [
          TabBarView(
            controller: widget.tabBarController,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 300,
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AllGenres(
                        iconData: widget.iconData, // widgetの中のiconDataを参照する
                        isButtonPressed: isButtonPressed,
                        onPressed: () {
                          setState(() {
                            isButtonPressed = !isButtonPressed;
                          });
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.security,
                            size: 15,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '車種のご紹介',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 300,
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CyclingGenre(
                        iconData: widget.iconData, // ここでiconDataを渡す
                        isButtonPressed: isButtonPressed,
                        onPressed: () {
                          setState(() {
                            isButtonPressed = !isButtonPressed;
                          });
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.security,
                            size: 15,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '車種のご紹介',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElectricBicycleGenre(),
            ],
          ),
          if (isButtonPressed)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReservationDisplay(iconData2: widget.iconData), // iconDataを渡す
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
