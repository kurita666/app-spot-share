//Help_Outline_Button.dartファイル
//Top画面の右端4つのボタンの1番下のアイコンボタンを表示しているコード
//map_screen.dartファイルの278行目あたりで呼び出し

import 'package:flutter/material.dart';

class HelpOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const HelpOutlineButton({
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.square(20), // ボタンのサイズを50x50に設定
        backgroundColor: Colors.white, // ボタンの背景色を設定
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3), // ボタンの形状を正方形に設定
        ),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), // ボタン内の余白を設定
      ),
      icon: Icon(icon),
      iconSize: 20, // アイコンのサイズを設定
      color: Colors.black, // アイコンの色を設定
    );
  }
}
