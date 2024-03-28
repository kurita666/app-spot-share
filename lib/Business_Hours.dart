//Business_Hours.dart
//営業時間を表示するファイル
//map_screen.dartファイルの334行目で呼び出される
import 'package:flutter/material.dart';
import 'map_screen.dart'; // map_screen.dartからIconDataModelをインポート

class BusinessHoursRow extends StatelessWidget {
  final IconDataModel iconData;

  BusinessHoursRow({required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.query_builder, size: 14, color: Colors.grey[800]),
        SizedBox(width: 4),
        Text(
          '営業時間：${iconData.OpenTime}',
          style: TextStyle(
            fontSize: 9.0,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}