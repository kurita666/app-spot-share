//Dialog_Display_Success.dart
//チェックボックスがON/OFFそれぞれの対応を記載しているコード
//Consent_Form.dartファイルの90、98行目で呼び出し
import 'package:flutter/material.dart';

class CustomDialogS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)), // 角を尖らせる
      ),
      contentPadding: EdgeInsets.all(15), // ダイアログの周囲の余白を設定
      content: Container(
        width: 300, // ダイアログの横幅を固定値で設定
        height: 100, // ダイアログの高さを調整
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '車両の予約をして\nよろしいですか？',
              textAlign: TextAlign.center, // テキストを中央寄せに設定
            ),
            SizedBox(height: 10),
            Divider( // Adding horizontal divider
              color: Colors.grey,
              height: 1,
              thickness: 0.5,
              indent: 0,
              endIndent: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // spaceEvenly から center に変更
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // キャンセルボタンが押されたらダイアログを閉じる
                  },
                  child: Text(
                    'キャンセル',
                    style: TextStyle(color: Colors.blue), // キャンセルボタンのテキストカラーを赤に設定
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop('OK'); // OKボタンが押されたらダイアログを閉じる
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.blue), // OKボタンのテキストカラーを青に設定
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
