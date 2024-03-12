import 'package:flutter/material.dart';
import 'map_screen.dart';

class MyTableWidget extends StatelessWidget {
  final IconDataModel iconData;

  const MyTableWidget({
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey, width: 0.7), // すべての枠の色をグレーに設定
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                height: 25,
                color: Colors.orange,
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.directions_bike,
                      size: 15,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${iconData.QRNumber}',
                      style: TextStyle(color: Colors.black, fontSize: 9),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(width: 220),
                    Transform.rotate(
                      angle: 90 * 3.14 / 180, // 90度回転させる
                      child: Icon(
                        Icons.battery_full,
                        size: 25,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                height: 200,
                color: Colors.white,
                child: Image.asset(
                  '${iconData.BicycleTypeImage}',
                  width: 180,
                  height: 180,
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                height: 120,
                color: Colors.blue,
                child: Table(
                  border: TableBorder.all(color: Colors.grey, width: 0.7), // 全ての枠の色をグレーに設定
                  columnWidths: {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(7),
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            height: 120,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                '利用料金',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 120,
                            color: Colors.white,
                            child: Table(
                              border: TableBorder.all(color: Colors.grey, width: 0.7), // 全ての枠の色をグレーに設定
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Container(
                                        height: 40,
                                        color: Colors.white,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '￥${iconData.HalfHourMoney}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                '(税込み)/30分まで',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xFF333333),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Container(
                                        height: 40,
                                        color: Colors.white,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '延長',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xFF333333),
                                                ),
                                              ),
                                              Text(
                                                '￥${iconData.QuarterHourMoney}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                '(税込み)/15分あたり',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xFF333333),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Container(
                                        height: 40,
                                        color: Colors.white,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '￥${iconData.HalfDayMoney}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                '(税込み)/12時間あたり',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xFF333333),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
