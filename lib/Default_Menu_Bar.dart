//Default_Menu_Bar.dart
//Top画面の下端にメニュータブを表示させるコード
//map_screen.dartファイルの293行目あたりで呼び出し

import 'package:flutter/material.dart';
import 'Search_Tab_Cycling.dart';
import 'Search_Result_Screen.dart';
import 'Map_Pin_Add_Info.dart'; // Map_Pin_Add_Infoファイルをインポート
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchFavoBar extends StatefulWidget {
  @override
  _SearchFavoBarState createState() => _SearchFavoBarState();
}

class _SearchFavoBarState extends State<SearchFavoBar> {
  double _height = 150; // メニューバーの初期高さを150に設定
  TextEditingController _searchController = TextEditingController(); // 検索テキストを保持するコントローラー
  String _searchTerm = ''; // 検索された単語を保持する変数

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  _height -= details.primaryDelta!; // 上下にスライドした分だけ高さを変更
                  _height = _height.clamp(150.0, 600.0); // 高さの範囲を150から600に制限
                });
              },
              child: Container(
                color: Colors.white,
                height: _height, // 高さを変数に設定
                child: Column(
                  children: [
                    Icon(
                      Icons.horizontal_rule, // 横棒のアイコンを設定
                      size: 40, // アイコンのサイズを設定
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          Expanded(
                            flex: 8, // 検索窓の割合を8に設定
                            child: Container(
                              height: 30.0, // 高さを30.0に設定（適宜調整してください）
                              decoration: BoxDecoration(
                                color: Colors.grey[300], // フィールドの塗りつぶし色をグレーに設定
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0), // 水平方向の余白を設定
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: _searchController,
                                              onSubmitted: (value) {
                                                // 検索フィールドからフォーカスを外した後に検索を実行する
                                                _search(value);
                                              },
                                              decoration: InputDecoration(
                                                hintText: '地域名、ステーション名を検索', // ヒントテキストを設定
                                                border: InputBorder.none, // 枠線を非表示に設定
                                              ),
                                              style: TextStyle(fontSize: 12.0), // テキストのフォントサイズを小さくする
                                            ),
                                          ),
                                          SizedBox(width: 9), // アイコンとテキストの間にスペースを追加
                                          Icon(
                                            Icons.search,
                                            size: 20,
                                            color: Colors.grey[700],
                                          ),
                                          SizedBox(width: 8), // アイコンとアイコンの間にスペースを追加
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      SizedBox(width: 16), // アイコンとアイコンの間にスペースを追加
                      MapPinAddInfo(), // グレーの丸とアイコンを含むウィジェット
                          //Map_Pin_Add_Info.dartファイルから呼び出し
                      SizedBox(width: 8),
                    ],
                  ),
                ),
                SearchTabCycling(),//
                SizedBox(height: 15),
                Container(
                  color: Colors.grey[200], // コンテナの背景色を薄いグレーに設定
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 9), // アイコンとテキストの間にスペースを追加
                      Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.grey[700],
                      ),
                      SizedBox(width: 8), // アイコンとアイコンの間にスペースを追加
                      Text(
                        '検索履歴',
                        style: TextStyle(
                          color: Colors.black, // テキストの色を濃いグレーに設定
                          fontSize: 11.9,
                        ),
                      ),
                      SizedBox(width: 200),
                      Text(
                        'クリア',
                        style: TextStyle(
                          color: Colors.blue, // テキストの色を濃いグレーに設定
                          fontSize: 11.9,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  color: Colors.grey[200], // コンテナの背景色を薄いグレーに設定
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 9), // アイコンとテキストの間にスペースを追加
                      Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.grey[700],
                      ),
                      SizedBox(width: 8), // アイコンとアイコンの間にスペースを追加
                      Text(
                        '利用履歴',
                        style: TextStyle(
                          color: Colors.black, // テキストの色を濃いグレーに設定
                          fontSize: 11.9,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[200], // コンテナの背景色を薄いグレーに設定
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 9), // アイコンとテキストの間にスペースを追加
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.grey[700],
                      ),
                      SizedBox(width: 8), // アイコンとアイコンの間にスペースを追加
                      Text(
                        'お気に入り',
                        style: TextStyle(
                          color: Colors.black, // テキストの色を濃いグレーに設定
                          fontSize: 11.9,
                        ),
                      ),
                    ],
                  ),
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
  void _search(String searchTerm) async {
    // Google Geocoding API を使用して、検索語を緯度と経度に変換する
    final apiKey = 'AIzaSyCPU-Vwps2COfcZjhab7-__QhDbusriXAo'; // ここにあなたのGoogle Maps PlatformのAPIキーを入力してください
    final apiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address=$searchTerm&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];

      if (results.isNotEmpty) {
        final location = results[0]['geometry']['location'];
        final lat = location['lat'];
        final lng = location['lng'];

        // 緯度と経度を使用して検索結果を表示する画面に移動する
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SearchResultScreen(
              searchTerm: searchTerm,
              initialPosition: LatLng(lat, lng),
            ),
          ),
        );
      } else {
        // 検索結果が見つからない場合のエラーメッセージを表示する
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('検索結果が見つかりませんでした'),
        ));
      }
    } else {
      // ネットワークエラーなどの場合のエラーメッセージを表示する
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('検索中にエラーが発生しました'),
      ));
    }
  }
}
