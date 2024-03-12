// import 'package:flutter/material.dart';
// import 'map_screen.dart';
//
// class MyTableWidget {
//   final IconData? iconData; // IconData? に変更
//   final ReservationBicycleInfo reservationInfo; // ReservationBicycleInfoを追加
//
//   const MyTableWidget({
//     required this.iconData,
//     required this.reservationInfo, // ReservationBicycleInfoを受け取る
//     Key? key, // key パラメータを追加
//   }) : super(key: key);
//
//   Widget build(BuildContext context) {
//     return Table(
//       border: TableBorder.all(),
//       children: [
//         TableRow(
//           children: [
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 50,
//                 child: Center(child: Icon(iconData)), // Iconウィジェットを表示
//               ),
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 50,
//                 child: Center(child: Text(reservationInfo.someText)), // ReservationBicycleInfoのプロパティを表示
//               ),
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 100,
//                 child: Center(child: Text('1-3\n2-1', textAlign: TextAlign.center)),
//               ),
//               verticalAlignment: TableCellVerticalAlignment.middle,
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 50,
//                 child: Center(child: Text('1-4')),
//               ),
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 50,
//                 child: Center(child: Text('1-5')),
//               ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             TableCell(
//               child: Container(),
//             ),
//             TableCell(
//               child: Container(),
//             ),
//             TableCell(
//               child: Container(),
//             ),
//             TableCell(
//               child: Container(),
//             ),
//             TableCell(
//               child: Container(),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 50,
//                 child: Center(child: Text('3-1')),
//               ),
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 50,
//                 child: Center(child: Text('3-2')),
//               ),
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 50,
//                 child: Center(child: Text('3-3')),
//               ),
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 50,
//                 child: Center(child: Text('3-4')),
//               ),
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.blue,
//                 height: 50,
//                 child: Center(child: Text('3-5')),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
