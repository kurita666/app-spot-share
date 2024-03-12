import 'package:flutter/material.dart';

class ElectricBicycleGenre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // 背景色を白に設定
          borderRadius: BorderRadius.circular(8), // 丸みを付ける
        ),
        child: Text(
          '\nこちらのステーションでは\n'
              '電動サイクルの貸出・ご返却はできません。\n'
              '恐れ入りますが、近隣の対応しているステーションでご\n'
              '利用またはご返却ください。\n\n'
              '　※こちらのステーションに放置された場合、回収費を別途ご負担いた　\n'
              'だく場合がございます。\n',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 9), // 文字サイズを小さくする
        ),
      ),
    );
  }
}
