import 'package:flutter/material.dart';
import 'map_screen.dart'; // map_screen.dartファイルをインポート
import 'Default_Menu_Bar.dart'; // Default_Menu_Bar.dartファイルをインポート

void main() {
  runApp(MyApp());
}

// MyAppクラスの定義はここから下に続く
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            MapScreen(), // MapScreenウィジェットを表示する
            SearchFavoBar(), // SearchBarウィジェットを表示する
          ],
        ),
      ),
    );
  }
}