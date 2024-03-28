//Search_Tab_Cycling.dart
//Top画面下部のメニューバー内に存在する、「すべて」「自転車」「電動サイクル」3つのタブを表示するコード
//Default_Menu_Bar.dartの103行目あたりで呼び出される
import 'package:flutter/material.dart';

class SearchTabCycling extends StatefulWidget {
  @override
  _SearchTabCyclingState createState() => _SearchTabCyclingState();
}

class _SearchTabCyclingState extends State<SearchTabCycling> {
  int _selectedIndex = 0; // デフォルトで「すべて」のタブを選択状態にする

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildTab(0, 'すべて', 10.0),
        ),
        Expanded(
          flex: 1,
          child: _buildTab(1, '自転車', 10.0),
        ),
        Expanded(
          flex: 1,
          child: _buildTab(2, '電動サイクル', 10.0),
        ),
      ],
    );
  }

  Widget _buildTab(int index, String text, double fontSize) {
    Color textColor = Colors.black; // デフォルトのテキスト色

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // タブがクリックされたら、選択されたインデックスを更新
        });
        // タブがクリックされた時の処理を追加
      },
      child: Container(
        height: 40.0, // タブの高さを60.0に固定
        color: _selectedIndex == index ? Color(0xFFF0E68C) : null, // ベージュのRGB値を指定
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // テキストを中央に配置
          children: [
            index != 0 // インデックスが0でない場合にテキストとアイコンを表示する
                ? Icon(index == 1 ? Icons.directions_bike : Icons.electric_bike)
                : SizedBox(), // インデックスが0の場合は空のウィジェットを表示
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0), // テキストの左右に余白を追加
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: textColor, // テキストの色を設定
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
