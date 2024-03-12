import 'package:flutter/material.dart';
import 'map_screen.dart';

class PaymentMethod extends StatelessWidget {
  final IconDataModel iconData;

  const PaymentMethod({
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider( // Adding horizontal divider
          color: Colors.grey,
          height: 15,
          thickness: 0.5,
          indent: 0,
          endIndent: 0,
        ),
        Row(
          children: [
            Icon(
              Icons.trending_flat,
              size: 20,
              color: Colors.orange,
            ),
            SizedBox(width: 4), // Adding space between icon and text
            Text(
              '登録中の決済方法',
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Divider( // Adding horizontal divider
          color: Colors.grey,
          height: 15,
          thickness: 0.5,
          indent: 0,
          endIndent: 0,
        ),
        SizedBox(height: 10), // Adjusting vertical spacing
        Table(
          border: TableBorder.all(color: Colors.grey, width: 1.2),
          children: [
            TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle, // 垂直方向の中央揃え
                  child: Container(
                    height: 50,
                    color: Colors.white, // セルの背景色
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0), // 左側のパディング
                          child: Text(
                            'なし', // セルのテキスト
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0), // 右側のパディング
                              child: ElevatedButton(
                                onPressed: () {
                                  // ボタンが押されたときの処理を記述
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(Size(50, 30)), // ボタンの最小サイズを指定
                                  backgroundColor: MaterialStateProperty.all(Colors.orange), // ボタンの背景色
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0), // 角を丸めるための値を設定
                                      side: BorderSide(color: Colors.brown, width: 2), // 枠の色と太さを設定
                                    ),
                                  ),
                                ),
                                child: Text(
                                  '変更する', // ボタンのテキスト
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 10
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10), // Adjusting vertical spacing
        Text(
          '預かり金は1台につきクレジットカードは1円、\nPayPay・ソフトバンクまとめて支払い・auかんたん\n決済・Yahoo!ウォレットは2,000円になります。',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 10), // Adjusting vertical spacing
        Row(
          children: [
            Icon(
              Icons.security,
              size: 15,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              '預かり金について',
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
              ),
            ),
            //SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
