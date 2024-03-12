import 'package:flutter/material.dart';
import 'map_screen.dart'; // map_screen.dartからIconDataModelをインポート

class OperatingCompanyRow extends StatelessWidget {
  final IconDataModel iconData;

  OperatingCompanyRow({required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '運営会社：',
          style: TextStyle(
            fontSize: 9.0,
            color: Colors.grey[800],
          ),
        ),
        Text(
          iconData.OperatingCompany,
          style: TextStyle(
            fontSize: 9.0,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
