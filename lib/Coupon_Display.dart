//Coupon_Display.dart
//クーポン情報を表示するコード
//Reaservation_Display.dart137行目で呼び出し
import 'package:flutter/material.dart';
import 'map_screen.dart';

class CouponDisplay extends StatelessWidget {
  final IconDataModel iconData;

  const CouponDisplay({
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
              'クーポン',
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
        Text(
          'マイページで選択したクーポンが表示されます。「クーポンを利用しない」を選択すると表示されません。',
          style: TextStyle(
            fontSize: 10,
            color: Colors.black,
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
            SizedBox(width: 4),
            Text(
              'クーポンの利用について',
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Adjusting vertical spacing
        Table(
          border: TableBorder.all(color: Colors.grey, width: 0.7), // 全ての枠の色をグレーに設定
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(9),
          },
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    height: 30, // セルの高さを設定
                    color: Colors.white, // セルの背景色
                    child: Center(
                      child: Icon(
                        Icons.adjust,
                        size: 25,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    height: 30, // セルの高さを設定
                    color: Colors.white, // セルの背景色
                    child: Center(
                      child: Text(
                        'クーポンなし', // セルのテキスト
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
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
