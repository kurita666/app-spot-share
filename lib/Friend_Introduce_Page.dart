// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
//
// class FriendIntroducePage extends StatefulWidget {
//   @override
//   _FriendIntroducePageState createState() => _FriendIntroducePageState();
// }
//
// class _FriendIntroducePageState extends State<FriendIntroducePage> {
//   bool isToggleOn = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           builder: (BuildContext context) {
//             return Container(
//               height: MediaQuery.of(context).size.height * 0.9,
//               child: Stack(
//                 children: [
//                   SingleChildScrollView(
//                     child: Container(
//                       padding: EdgeInsets.only(
//                         top: MediaQuery.of(context).size.height * 0.08,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // ここにメニューコンテンツを配置する
//                         ],
//                       ),
//                     ),
//                   ),
//                   // メニューバーの定義
//                   Positioned(
//                     top: 0,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       color: Colors.orange, // メニューバーの背景色をオレンジに設定
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 15),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 'マップピンの表示設定',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
