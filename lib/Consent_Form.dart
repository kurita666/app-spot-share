import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'Dialog_Display_Fail.dart';
import 'Dialog_Display_Success.dart';

class ConsentForm extends StatefulWidget {
  final IconDataModel iconData;

  const ConsentForm({
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  _ConsentFormState createState() => _ConsentFormState();
}

class _ConsentFormState extends State<ConsentForm> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF333333),
            ),
            children: [
              TextSpan(
                text: '注意事項および',
              ),
              TextSpan(
                text: '利用規約',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: 'と',
              ),
              TextSpan(
                text: 'プライバシーポリシー',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: 'に\n同意の上、次にお進みください。',
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // 中央寄せに設定
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
              activeColor: Colors.orange, // チェックボックスの内部の色をオレンジ色に設定
            ),
            Text(
              '注意事項および利用規約とプライバシーポリシ\nーに同意する',
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              if (!_isChecked) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(); // 新しいカスタムダイアログを使用
                  },
                );
              }
              else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogS(); // 車両の予約のダイアログを使用
                  },
                );
              }
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(300, 30)), // ボタンの最小サイズを指定
              backgroundColor: _isChecked ? MaterialStateProperty.all(Colors.orange) : MaterialStateProperty.all(Colors.white), // ボタンの背景色を_isChecked の値に応じて変更// ボタンの背景色
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0), // 角を丸めるための値を設定
                  side: _isChecked ? BorderSide(color: Colors.brown, width: 1.5) : BorderSide(color: Colors.grey, width: 1.5) , // 枠の色と太さを設定
                ),
              ),
            ),
            child: Text(
              '登録中の決済方法で予約する', // ボタンのテキスト
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 7,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: Text(
            'または',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 13),
        Table(
          border: TableBorder.all(color: Colors.grey, width: 1.2),
          children: [
            TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle, // 垂直方向の中央揃え
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 15), // 画像を下に15ポイント下げる
                        child: Image.asset(
                          'assets/images/paypay.png',
                          width: MediaQuery.of(context).size.width * 0.5, // 画像の幅を画面幅の50%に設定
                          height: MediaQuery.of(context).size.height * 0.5, // 画像の高さを画面高さの50%に設定
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (!_isChecked) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(); // 新しいカスタムダイアログを使用
                              },
                            );
                          }
                          else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogS(); // 車両の予約のダイアログを使用
                              },
                            );
                          }
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(280, 30)), // ボタンの最小サイズを指定
                          backgroundColor:  _isChecked ? MaterialStateProperty.all(Colors.orange) : MaterialStateProperty.all(Colors.white), // ボタンの背景色
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0), // 角を丸めるための値を設定
                              side: _isChecked ? BorderSide(color: Colors.brown, width: 1.5) : BorderSide(color: Colors.grey, width: 1.5), // 枠の色と太さを設定
                            ),
                          ),
                        ),
                        child: Text(
                          'PayPay支払いで予約する', // ボタンのテキスト
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
