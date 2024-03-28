//Address_Display.dart
//会社の住所を表示するコード
//map_screen.dartファイルの331行目で呼び出される
import 'package:flutter/material.dart';
import 'map_screen.dart'; // map_screen.dartからIconDataModelをインポート

class AddressRow extends StatelessWidget {
  final IconDataModel iconData;

  AddressRow({required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.apartment, size: 14, color: Colors.blue),
        SizedBox(width: 4),
        Text(
          iconData.Address,
          style: TextStyle(
            fontSize: 9.0,
            color: Colors.blue,
          ),
        ),
        Text(
          '・0.2km',
          style: TextStyle(
            fontSize: 9.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}