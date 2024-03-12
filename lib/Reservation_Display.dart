import 'package:flutter/material.dart';
//import 'ReservationBicycleInfo.dart'; // Importing ReservationBicycleInfo.dart
import 'map_screen.dart';
import 'ReservationDetail.dart';
import 'CautionaryNote.dart';
import 'Coupon_Display.dart';
import 'Payment_Method_Display.dart';
import 'Consent_Form.dart';

class ReservationDisplay extends StatelessWidget {
  final IconDataModel iconData2;

  ReservationDisplay({required this.iconData2});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // 全画面に表示
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (BuildContext context) {
            ScrollController _scrollController = ScrollController(); // スクロールコントローラーを作成

            // スクロール位置を監視して一番上に戻ったらメニューを閉じる
            _scrollController.addListener(() {
              if (_scrollController.position.pixels ==
                  _scrollController.position.minScrollExtent) {
                Navigator.of(context).pop();
              }
            });

            return Container(
              height: MediaQuery.of(context).size.height * 0.9, // 画面の高さの90%を設定
              child: Stack(
                children: [
                  SingleChildScrollView(
                    // SingleChildScrollViewでウィジェットをラップ
                    controller: _scrollController, // スクロールコントローラーを指定
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08),
                      // 上部のPaddingを調整
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                '${iconData2.PlaceImage}',
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 8), // Adding space between image and text
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${iconData2.CompanyName}\n',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${iconData2.Address}',
                                      style: TextStyle(
                                        fontSize: 10, // Changing Address font size to 10
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                                '予約車両',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            // Adding horizontal divider
                            color: Colors.grey,
                            height: 15,
                            thickness: 0.5,
                            indent: 0,
                            endIndent: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // Aligning text to the left
                            children: [
                              Text(
                                '\n予約する車両をご確認ください',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          MyTableWidget(
                              iconData: iconData2), //ReservationDetail.dartファイル呼び出し
                          SizedBox(height: 8),
                          CautionText(
                              iconData: iconData2), //CautionText.dartファイル呼び出し
                          SizedBox(height: 8),
                          CouponDisplay(iconData: iconData2),
                          SizedBox(height: 8),
                          PaymentMethod(iconData: iconData2),
                          SizedBox(height: 10),
                          ConsentForm(iconData: iconData2),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // 上部に固定される部分
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.orange, // Setting background color to orange
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        // Adding vertical padding
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '　　　　　　ご利用プラン/決裁方法　　',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                // Iconをクリックしてメニューを閉じる
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Text(
        '　　　　車両予約に進む（１）　　　　',
        style: TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.orange),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
