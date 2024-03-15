import 'package:flutter/material.dart';
import 'Search_Tab_Cycling.dart';
import 'Map_Pin_Add_Info.dart'; // Map_Pin_Add_Infoファイルをインポート

class SearchFavoBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0, // 下端に配置
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        height: 150, // メニューバーの高さを設定
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
                  SizedBox(width: 8),
                ],
              ),
            ),
            SearchTabCycling(),
          ],
        ),
      ),
    );
  }
}
