import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MapPinAddInfo extends StatefulWidget {
  @override
  _MapPinAddInfoState createState() => _MapPinAddInfoState();
}

class _MapPinAddInfoState extends State<MapPinAddInfo> {
  bool isToggleOn = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (BuildContext context) {
            ScrollController _scrollController = ScrollController();

            _scrollController.addListener(() {
              if (_scrollController.position.pixels ==
                  _scrollController.position.minScrollExtent) {
                Navigator.of(context).pop();
              }
            });

            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08),
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
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 30),
                              Container(
                                width: 50, // 幅を50に設定
                                height: 50, // 高さを50に設定
                                child: Image.asset(
                                  'assets/images/BKatEad5Br4XsmR1710303223_1710303234.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 20), // アイコン画像とテキストの間隔を調整
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // テキストを左寄せに設定
                                children: [
                                  Text(
                                    'HELLO MOBILITY',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //SizedBox(height: 2), // テキスト間の間隔を設定
                                  Text(
                                    '小型EV・EVスクーター',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 50),
                              CupertinoSwitch(
                                value: isToggleOn,
                                activeColor: Colors.orange, // ON のときの色をオレンジ色に設定
                                onChanged: (value) {
                                  // サウンドON/OFFの状態を切り替える
                                  setState(() {
                                    isToggleOn = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 30),
                              Container(
                                width: 50, // 幅を50に設定
                                height: 50, // 高さを50に設定
                                child: Image.asset(
                                  'assets/images/h4CKTsTTUa9seYG1710303465_1710303477.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 20), // アイコン画像とテキストの間隔を調整
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // テキストを左寄せに設定
                                children: [
                                  Text(
                                    '中央線沿線',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //SizedBox(height: 2), // テキスト間の間隔を設定
                                  Text(
                                    '達人グルメ紹介店舗',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 70),
                              CupertinoSwitch(
                                value: isToggleOn,
                                activeColor: Colors.orange, // ON のときの色をオレンジ色に設定
                                onChanged: (value) {
                                  // サウンドON/OFFの状態を切り替える
                                  setState(() {
                                    isToggleOn = value;
                                  });
                                },
                              ),
                              SizedBox(height: 70),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.orange,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'マップピンの表示設定',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.grey[300], // グレーの色
              shape: BoxShape.circle, // 円形に設定
            ),
            child: Icon(
              Icons.add_location_alt_outlined, // add_location_alt_outlinedアイコンを設定
              size: 20, // アイコンのサイズを設定
              color: Colors.black, // アイコンの色を設定
            ),
          ),
        ],
      ),
    );
  }
}
