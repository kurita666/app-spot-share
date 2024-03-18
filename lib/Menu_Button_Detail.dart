import 'package:flutter/material.dart';

class MenuButtonDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300, // メニュータブの高さを設定
      color: Colors.white, // メニュータブの背景色を設定
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'メニュータブの内容',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          // ここにメニュータブの内容を追加
          // 例えば、リストやボタンなどのウィジェットを配置できます
        ],
      ),
    );
  }
}
