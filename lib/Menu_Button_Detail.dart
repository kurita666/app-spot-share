import 'package:flutter/material.dart';

class MenuButtonDetail extends StatelessWidget {
  void openMenuBar() {
    // メニューバーを開く処理を行う
    // ここにメニューバーを表示するためのコードを追加します
    print('メニューバーが開かれました');
  }

  @override
  Widget build(BuildContext context) {
    // メニューバーの表示内容を追加
    return Container(
      width: 200,
      height: 200,
      color: Colors.grey,
      child: Center(
        child: Text(
          'メニューバー',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
