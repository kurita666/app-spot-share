import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)), // 角を尖らせる
      ),
      contentPadding: EdgeInsets.all(15), // ダイアログの周囲の余白を設定
      content: Container(
        width: 300, // ダイアログの横幅を固定値で設定
        height: 70, // ダイアログの高さを固定値で設定
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '利用規約に同意してください。',
              textAlign: TextAlign.center, // テキストを中央寄せに設定
            ),
            SizedBox(height: 1),
            Divider( // Adding horizontal divider
              color: Colors.grey,
              height: 1,
              thickness: 0.5,
              indent: 0,
              endIndent: 0,
            ),
            Center( // Centering the action button
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  textAlign: TextAlign.center, // ボタンのテキストを中央寄せに設定
                  style: TextStyle(color: Colors.blue, fontSize: 12), // フォントサイズを調整
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
