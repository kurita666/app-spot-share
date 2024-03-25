import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // flutter_localizationsパッケージをインポート
import 'map_screen.dart'; // map_screen.dartファイルをインポート

void main() {
  runApp(MyApp());
}

// MyAppクラスの定義はここから下に続く
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // 追加のロケールデリゲートをここに追加する
      ],
      supportedLocales: [
        const Locale('ja', ''), // 日本語
        // サポートする他のロケールをここに追加する
      ],
      home: Scaffold(
        body: Stack(
          children: [
            MapScreen(), // MapScreenウィジェットを表示する
          ],
        ),
      ),
    );
  }
}
