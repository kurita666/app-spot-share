//map_screen.dart
// import 'GoogleMapWidget.dart';
// import 'MenuWidget.dart';
//import 'dart:async'; // 追加
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';
import 'PlaceName_Favorite.dart';
import 'Table_Display.dart';
import 'Address_Display.dart';
import 'Business_Hours.dart';
import 'Operating_Company.dart';
import 'TabBar.dart';
import 'TabBarContentView.dart';
// import 'location_display.dart'; // LocationDisplayをインポート

class IconDataModel {
  final String Number;
  final String CompanyName;
  final String Address;
  final String OpenTime;
  final String OperatingCompany;
  final String PlaceImage;
  final String BicycleTypeImage;
  final String ElectricBicycleTypeImage;
  final String HalfHourMoney;
  final String QuarterHourMoney;
  final String HalfDayMoney;
  final String QRNumber;

  IconDataModel({
    required this.Number,
    required this.CompanyName,
    required this.Address,
    required this.OpenTime,
    required this.OperatingCompany,
    required this.PlaceImage,
    required this.BicycleTypeImage,
    required this.ElectricBicycleTypeImage,
    required this.HalfHourMoney,
    required this.QuarterHourMoney,
    required this.HalfDayMoney,
    required this.QRNumber,
  });
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with SingleTickerProviderStateMixin {
  late GoogleMapController _mapController;
  bool _isFavorite = false;
  late TabController _tabController;
  bool _isMenuExpanded = false;
  late IconDataModel iconData;
  BitmapDescriptor? _customMarkerIcon; // null で初期化

  _MapScreenState() {
    // 初期化時に iconData を初期化
    iconData = IconDataModel(
      Number: '',
      CompanyName: '',
      Address: '',
      OpenTime: '',
      OperatingCompany: '',
      PlaceImage: '',
      BicycleTypeImage: '',
      ElectricBicycleTypeImage: '',
      HalfHourMoney: '',
      QuarterHourMoney: '',
      HalfDayMoney: '',
      QRNumber: '',
    );
  }

// アイコンがタップされたときの処理
  void _onIconTap() {
    // アイコンに関連するデータを作成
    iconData = IconDataModel(
      Number: 'st No.1234567',
      CompanyName: '株式会社システム創造開発',
      Address: '東京都千代田区丸の内１丁目９－２',
      OpenTime: '24h',
      OperatingCompany: '株式会社システム創造開発',
      PlaceImage: 'assets/images/system_company.png',
      BicycleTypeImage: 'assets/images/tni12202021018481.png',
      ElectricBicycleTypeImage: 'assets/images/o0400030014858478245.jpg',
      HalfHourMoney: '130円',
      QuarterHourMoney: '100円',
      HalfDayMoney: '1,800円',
      QRNumber: 'SCD1234',
    );
    setState(() {//代入する
      _isMenuExpanded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadCustomMarkerIcon(); // カスタムマーカーアイコンを読み込む
  }

  void _loadCustomMarkerIcon() async {
    final ImageConfiguration imageConfiguration = ImageConfiguration();
    final BitmapDescriptor bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
      imageConfiguration,
      'assets/images/s.png', // カスタムマーカー画像のパス
    );
    setState(() {
      _customMarkerIcon = bitmapDescriptor;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_customMarkerIcon == null) {
      // _customMarkerIcon がまだ初期化されていない場合はローディングなどを表示する
      return CircularProgressIndicator();
    } else {
      // _customMarkerIcon が初期化された場合は GoogleMap ウィジェットを表示する
      return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(35.699872, 139.775335),
                zoom: 12.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('marker_1'),
                  position: LatLng(35.699872, 139.775335),
                  onTap: () {
                    setState(() {
                      _onIconTap(); // アイコンがタップされたらデータを設定する
                      _isMenuExpanded = true;
                    });
                  },
                  // カスタムのマーカーアイコンを使用します
                  icon: _customMarkerIcon!,
                ),
              },
            ),
            if (_isMenuExpanded)
              GestureDetector(
                onTap: () {
                  // メニューがタップされても何もしない
                },
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      _buildTabContentWidget(context),
                      Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isMenuExpanded = false;
                            });
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Center(
                              child: Icon(Icons.close, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    }
  }
  Widget _buildTabContentWidget(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(0), // 外側の余白を0に設定
              padding: EdgeInsets.all(0), // 内側の余白を0に設定
              child: Image.asset(
                '${iconData.PlaceImage}', // 画像のパスを指定
                fit: BoxFit.fill, // 画像を横一杯に広げる
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '${iconData.Number}',
              style: TextStyle(
                fontSize: 8.0,
                height: 0.8, // 行間を狭める
              ),
            ),
            CompanyRow(//PlaceName_Favorite.dartファイル呼び出し
              isFavorite: _isFavorite,
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
            SizedBox(height: 20.0),
            TableContainer(//Table_Display.dartファイルから呼び出し
              isFavorite: _isFavorite,
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
            SizedBox(height: 8.0),
            AddressRow(iconData: iconData), //Address_Display.dartファイル呼び出し
            SizedBox(height: 4.0),
            BusinessHoursRow(iconData: iconData),//Business_Hours.dartファイル呼び出し
            SizedBox(height: 15.0),
            OperatingCompanyRow(iconData: iconData),//Operating_Company.dartファイル呼び出し
            SizedBox(height: 20.0),
            CustomTabBar(tabController: _tabController),//TabBar.dartファイル呼び出し
            Container(
              color: Colors.grey.withOpacity(0.5),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  Icon(
                    Icons.trending_flat,
                    size: 20, // アイコンのサイズを指定
                    color: Colors.orange, // アイコンの色を黒に設定
                  ),
                  SizedBox(width: 8), // アイコンとテキストの間にスペースを追加
                  //SizedBox(height: 10),
                  Text(
                    '自転車（シティサイクルタイプ）',
                    style: TextStyle(
                      fontSize: 10.0, // テキストのフォントサイズを設定
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 10),
            Expanded(
              child: Stack(
                children: [
                  TabBarContent(//TabBarContentView.dartファイルから呼び出し
                    iconData: iconData,
                    tabBarController: _tabController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}