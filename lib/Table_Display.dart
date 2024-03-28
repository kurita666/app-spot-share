//Table_Display.dart
//レンタル可能な自転車数や返却可能な自転車数を表示するファイル
//map_screen.dartファイルの322行目で呼び出し
import 'package:flutter/material.dart';

class TableContainer extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  TableContainer({
    required this.isFavorite,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Row(
                  children: [
                    Text(
                      ' 利用可能       ',
                      style: TextStyle(
                        fontSize: 7.0,
                      ),
                    ),
                    Icon(Icons.directions_bike, size: 16),
                    Text(
                      '         2',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      '台  ',
                      style: TextStyle(
                        fontSize: 7.0,
                      ),
                      textAlign: TextAlign.right,
                      strutStyle: StrutStyle(
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.electric_bike, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '　　　　　　非対応',
                        style: TextStyle(
                          fontSize: 7.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Row(
                  children: [
                    Text(
                      '  返却可能       ',
                      style: TextStyle(
                        fontSize: 7.0,
                      ),
                    ),
                    Text(
                      '            0',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      '台  ',
                      style: TextStyle(
                        fontSize: 7.0,
                      ),
                      textAlign: TextAlign.right,
                      strutStyle: StrutStyle(
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
