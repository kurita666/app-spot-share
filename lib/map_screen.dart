import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_share_app/Friend_Introduction.dart';
import 'PlaceName_Favorite.dart';
import 'Table_Display.dart';
import 'Address_Display.dart';
import 'Business_Hours.dart';
import 'Operating_Company.dart';
import 'TabBar.dart';
import 'TabBarContentView.dart';
import 'Default_Menu_Bar.dart';
import 'Menu_Button.dart';
import 'Menu_Button_Detail.dart';
import 'Current_Location_Button.dart';
import 'Qrcode_Display_Button.dart';
import 'Help_Outline_Button.dart';
import 'Help_Outline_Button_Detail.dart';
import 'Friend_Introduction.dart';
import 'Menu_Mini_Button.dart';
//import 'Akihabara_Aria1.dart';

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
            if (!_isMenuExpanded)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SearchFavoBar(),
              ),
            if (!_isMenuExpanded)
              Positioned(
                top: 25, // 画面の上端に配置する
                left: 0,
                right: 0,
                child: Container(
                  // width: 300, // 幅を 250 に指定する
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FriendIntroducePage()), // FriendIntroducePageへの遷移
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // ボタンの背景色を白に設定
                      textStyle: TextStyle(
                        fontSize: 13.0,
                        color: Colors.black, // 文字色を黒に設定
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0), // ボタンの角を 8.0 の半径で設定
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'お友達を紹介してクーポンゲット！',
                          textAlign: TextAlign.left, // テキストを左寄せに設定
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 30), // テキストとアイコンの間隔を調整
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (!_isMenuExpanded)
              Positioned(
                bottom: 508,
                right: 29,
                // child: MenuButton(//MenuButton.dartファイルから呼び出し
                //   onPressed: () {
                //     setState(() {
                //       _isMenuExpanded = !_isMenuExpanded;
                //     });
                //     // メニュータブを表示する
                //     showModalBottomSheet(
                //       context: context,
                //       builder: (context) => MenuButtonDetail(), // メニュータブを表示
                //     );
                //   },
                //   icon: Icons.dehaze,
                // ),
                child:MenuMiniButton(),
              ),
            if (!_isMenuExpanded)
              Positioned(
                bottom: 460,
                right: 20,
                child: CurrentLocationButton(//Current_Location_Button.dartファイルから呼び出し
                  onPressed: () {
                    // ボタンが押されたときの処理をここに記述します
                  },
                  icon: Icons.gps_fixed,
                ),
              ),
            if (!_isMenuExpanded)
              Positioned(
                bottom: 420,
                right: 20,
                child: QrcodeDisplayButton(//Qrcode_Display_Button.dartファイルから呼び出し
                  onPressed: () {
                    // ボタンが押されたときの処理をここに記述します
                  },
                  icon: Icons.qr_code_2,
                ),
              ),
            if (!_isMenuExpanded)
              Positioned(
                bottom: 380,
                right: 20,
                child: HelpOutlineButton(//Help_Outline_Button.dartファイルから呼び出し
                  onPressed: () {
                    // ボタンが押されたときの処理をここに記述します
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpOutlineButtonDetail()), // FriendIntroducePageへの遷移
                    );
                  },
                  icon: Icons.help_outline,
                ),
                //child:TestFile(),
              ),
          ],
        ),
      );
    }
  }

  // _buildTabContentWidget()メソッドは、_isMenuExpanded フラグに応じてウィジェットを表示するかどうかを制御します

  Widget _buildTabContentWidget(BuildContext context) {
    // if (_isMenuExpanded) {
    //   return ; // メニュータブが表示されている場合は空のコンテナを返す
    // }

    return DefaultTabController(
      length: 3,
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: Image.asset(
                '${iconData.PlaceImage}',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '${iconData.Number}',
              style: TextStyle(
                fontSize: 8.0,
                height: 0.8,
              ),
            ),
            CompanyRow(
              isFavorite: _isFavorite,
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
            SizedBox(height: 20.0),
            TableContainer(
              isFavorite: _isFavorite,
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
            SizedBox(height: 8.0),
            AddressRow(iconData: iconData),
            SizedBox(height: 4.0),
            BusinessHoursRow(iconData: iconData),
            SizedBox(height: 15.0),
            OperatingCompanyRow(iconData: iconData),
            SizedBox(height: 20.0),
            CustomTabBar(tabController: _tabController),
            Container(
              color: Colors.grey.withOpacity(0.5),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  Icon(
                    Icons.trending_flat,
                    size: 20,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '自転車（シティサイクルタイプ）',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  TabBarContent(
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
