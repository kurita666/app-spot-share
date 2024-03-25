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
import 'Current_Location_Button.dart';
import 'Qrcode_Display_Button.dart';
import 'Help_Outline_Button.dart';
import 'Help_Outline_Button_Detail.dart';
import 'Menu_Mini_Button.dart';
import 'GoogleMap_Display.dart';
// import 'Menu_Button.dart';
// import 'Menu_Button_Detail.dart';
// import 'Friend_Introduction.dart';
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
  bool _isFavorite = false;//お気に入りされたかどうかの判別変数
  late TabController _tabController;
  bool _isMenuExpanded = false;//アイコンがしたされたかどうかの判別変数
  late IconDataModel iconData;//クリックされたアイコンによって代入するデータが変わる箱
  //→IconDataModelの型は22行目から50行目までの変数
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
  void _onIconTap() {//※いずれかは、緯度と経度によって得られるデータを変更し、代入できるようにしたい
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
      QRNumber: 'SCD12345',
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

  void _loadCustomMarkerIcon() async {//借りられる自転車の場所を表すアイコン設定
    final ImageConfiguration imageConfiguration = ImageConfiguration();
    final BitmapDescriptor bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
      imageConfiguration,
      'assets/images/s.png', // 借りられる自転車の場所を表すアイコン画像パス
    );
    setState(() {
      _customMarkerIcon = bitmapDescriptor;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_customMarkerIcon == null) {
      return CircularProgressIndicator();
    } else {
      return Scaffold(
        body: Stack(
          children: [
            MapDisplay(
              initialPosition: LatLng(35.699872, 139.775335),
              customMarkerIcon: _customMarkerIcon!,
              onIconTap: () {
                setState(() {
                  _onIconTap();
                  _isMenuExpanded = true;
                });
              },
            ),
            if (_isMenuExpanded)
              //アイコンをタップし、自転車選択メニューが表示されている際に、
              //ユーザーが画面のどこかをタップしても何も起こらないようにするためのコード
              GestureDetector(
                onTap: () {
                  // メニューがタップされても何もしない
                },
                child: Container(//×の位置や色を設定
                  color: Colors.transparent,//透明
                  child: Stack(
                    children: [
                      _buildTabContentWidget(context),
                      Positioned(
                        top: 30.0,
                        right: 15.0,
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
            if (!_isMenuExpanded)//Top画面上部の「友達紹介ボタン」関連コード
              Positioned(
                top: 40, // 画面の上端に配置する
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {//友達紹介ページを開く
                      Navigator.push(context, SlideUpPageRoute(builder: (context, animation, secondaryAnimation, child) {
                        return FriendIntroducePage();//Friend_Introduction.dartから呼び出し
                      }));
                    },
                    style: ElevatedButton.styleFrom(//ボタンの色彩、文字サイズ設定
                      backgroundColor: Colors.white, // 背景色：白
                      textStyle: TextStyle(
                        fontSize: 13.0,//テキストサイズ
                        color: Colors.black, // 文字色：黒
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0), // ボタンの角を 1.0 の半径で設定
                      ),
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(//ボタン内のテキスト
                          'お友達を紹介してクーポンゲット！',
                          textAlign: TextAlign.left, // テキストを左寄せに設定
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // 太字に設定
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 35), // テキストとアイコン(＞)の間隔を調整
                        Icon(//ボタン内のアイコン(＞の形)
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
              Positioned(//メニュバー
                //Top画面の右端、正方形のボタンの4つのうちの1番上のボタンに関するコード
                bottom: 508,
                right: 29,
                child:MenuMiniButton(),//Menu_Mini_Button.dartファイルから呼び出し
              ),
            if (!_isMenuExpanded)
              Positioned(//現在地（まだ中身は作成していない）
                //Top画面の右端、正方形のボタンの4つのうちの上から2番目のボタンに関するコード
                bottom: 460,
                right: 20,
                child: CurrentLocationButton(//Current_Location_Button.dartファイルから呼び出し
                  onPressed: () {
                    // ボタンが押されたときの処理をここに記述します
                  },
                  icon: Icons.gps_fixed,
                ),
              ),
            if (!_isMenuExpanded)//QRコード(まだ中身は作成していない)
              //Top画面の右端、正方形のボタンの4つのうちの上から3番目のボタンに関するコード
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
              Positioned(//ヘルプページ
                //Top画面の右端、正方形のボタンの4つのうちの一番下のボタンに関するコード
                bottom: 380,
                right: 20,
                child: HelpOutlineButton(//Help_Outline_Button.dartファイルから呼び出し
                  onPressed: () {//ボタンがタップされたら、HelpOutlineButtonDetail()を呼び出す
                    Navigator.push(context, SlideUpPageRoute2(builder: (context, animation, secondaryAnimation, child) {
                      return HelpOutlineButtonDetail();//Help_Outline_Button_Detailから呼び出し
                    }));
                  },
                  icon: Icons.help_outline,
                ),
                //child:TestFile(),
              ),
            if (!_isMenuExpanded)
              Positioned(//Top画面、下端にあるメニューバーに関するコード
                bottom: 0,
                left: 0,
                right: 0,
                child: SearchFavoBar(),//Default_Menu_Bar.dartから呼び出し
              ),
          ],
        ),
      );
    }
  }

  // _buildTabContentWidget()メソッドは、_isMenuExpanded フラグに応じてウィジェットを表示するかどうかを制御
  Widget _buildTabContentWidget(BuildContext context) {
    return DefaultTabController(//Top画面中心に存在する自転車マークをタップすると読まれるコード
      length: 3,
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,//背景色：白
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: Image.asset(
                '${iconData.PlaceImage}',//選択されたアイコンの場所画像を画面上端に表示
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '${iconData.Number}',//選択されたアイコンのナンバーを表示
              style: TextStyle(
                fontSize: 8.0,
                height: 0.8,
              ),
            ),
            CompanyRow(//PlaceName_Favorite.dartファイルから呼び出し
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
            AddressRow(iconData: iconData),//Address_Display.dartファイルから呼び出し
            //選択されたアイコンの住所を表示
            SizedBox(height: 4.0),
            BusinessHoursRow(iconData: iconData),//Business_Hours.dartファイルから呼び出し
            //選択されたアイコンの営業時間を表示
            SizedBox(height: 15.0),
            OperatingCompanyRow(iconData: iconData),//Operating_Company.dartファイルから呼び出し
            //選択されたアイコンの運営会社を表示
            SizedBox(height: 20.0),
            CustomTabBar(tabController: _tabController),//TabBar.dartファイルから呼び出し
            //選択されたアイコン場所にある「貸し出せる自転車」を表示
            Container(//自転車のタイプをテキストで表示
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
            Expanded(//
              child: Stack(
                children: [
                  TabBarContent(//TabBarContentView.dartファイルから呼び出す
                    //アイコンをタップした際のデータを全て次のファイルに渡す
                    //「すべて」「自転車」「電動サイクル」のタブを表示させるコードを呼び出す
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
