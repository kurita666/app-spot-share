import 'package:flutter/material.dart';
import 'package:new_share_app/Help_Outline_Button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelpOutlineButtonDetail(),
    );
  }
}

class HelpOutlineButtonDetail extends StatefulWidget {
  @override
  _HelpOutlineButtonDetailState createState() => _HelpOutlineButtonDetailState();
}

class _HelpOutlineButtonDetailState extends State<HelpOutlineButtonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 戻るアイコンを削除する
        // アクションを設定
        actions: [
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ヘルプ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 110), // テキストとアイコンの間隔を調整
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // 前のページに戻る
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.orange, // ヘッダー部の背景色を青に設定
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10), // テキストとアイコンの間隔を調整
            Container(
              child: Text(
                '利用方法についてはご利用ガイドをご覧ください。',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            SizedBox(height: 20), // 余白を追加
            Container(
              width: 300, // 任意の幅を指定してください
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理をここに記述します
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタンの背景色を設定
                  side: BorderSide(color: Colors.black), // ボタンの外枠の色を黒に設定
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1), // ボタンの内側の余白を調整
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.star_half,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      // VerticalDivider(
                      //   color: Colors.black,
                      //   width: 2,
                      // ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          'ご利用ガイドへ',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15), // 余白を追加
            Divider(
              color: Colors.grey,
              height: 2,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // テキストを左寄せに設定
                children: [
                  SizedBox(height: 10), // テキスト間の余白を追加
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // テキストを上寄せに設定
                    children: [
                      Icon(
                        Icons.question_answer,
                        size: 20,
                        color: Colors.orange,
                      ),
                      Text(
                        'トラブル対処・申告',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: 12), // テキスト間の余白を追加
                  Container(
                      color: Colors.grey[200], // テキストの背景色を薄いグレーに設定
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'ご利用中のお困りごとの対象方法や問い合わせ内容を素早く\n申告することができます。',
                        style: TextStyle(
                          color: Colors.black, // テキストの色を濃いグレーに設定
                          fontSize: 11.9,
                          //backgroundColor: Colors.grey,
                        ),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 7), // 余白を追加
            Container(
              width: 300, // 任意の幅を指定してください
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理をここに記述します
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタンの背景色を設定
                  side: BorderSide(color: Colors.black), // ボタンの外枠の色を黒に設定
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1), // ボタンの内側の余白を調整
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.dangerous,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          'エラーが表示される',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7), // 余白を追加
            Container(
              width: 300, // 任意の幅を指定してください
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理をここに記述します
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタンの背景色を設定
                  side: BorderSide(color: Colors.black), // ボタンの外枠の色を黒に設定
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1), // ボタンの内側の余白を調整
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.keyboard_return,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          '返却できない',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7), // 余白を追加
            Container(
              width: 300, // 任意の幅を指定してください
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理をここに記述します
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタンの背景色を設定
                  side: BorderSide(color: Colors.black), // ボタンの外枠の色を黒に設定
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1), // ボタンの内側の余白を調整
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.settings,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          '車両の不具合',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7), // 余白を追加
            Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 7), // 余白を追加
            Container(
              width: 300, // 任意の幅を指定してください
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理をここに記述します
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタンの背景色を設定
                  side: BorderSide(color: Colors.black), // ボタンの外枠の色を黒に設定
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1), // ボタンの内側の余白を調整
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.error,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          '車両の不具合',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7), // 余白を追加
            Container(
              width: 300, // 任意の幅を指定してください
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理をここに記述します
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタンの背景色を設定
                  side: BorderSide(color: Colors.black), // ボタンの外枠の色を黒に設定
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1), // ボタンの内側の余白を調整
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.directions_bike,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          '利用開始できない',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7), // 余白を追加
            Container(
              width: 300, // 任意の幅を指定してください
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理をここに記述します
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタンの背景色を設定
                  side: BorderSide(color: Colors.black), // ボタンの外枠の色を黒に設定
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1), // ボタンの内側の余白を調整
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.attach_money,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          '料金・決済について',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7), // 余白を追加
            Divider(
              color: Colors.grey,
              height: 2,
            ),
            SizedBox(height: 7), // 余白を追加
            Container(
              width: 300, // 任意の幅を指定してください
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理をここに記述します
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタンの背景色を設定
                  side: BorderSide(color: Colors.black), // ボタンの外枠の色を黒に設定
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1), // ボタンの内側の余白を調整
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.minor_crash,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          '事故に遭った・起こした',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7), // 余白を追加
            Container(
                color: Colors.grey[200], // テキストの背景色を薄いグレーに設定
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '※保険会社の窓口に繋がります。事故発生時のケガや賠償の問い合わせ以外対応できません。\n※返却や故障、料金い関するお問い合わせは、当ページ上部のメニューからご相談ください。',
                  style: TextStyle(
                    color: Colors.red, // テキストの色を濃いグレーに設定
                    fontSize: 11.9,
                    //backgroundColor: Colors.grey,
                  ),
                )
            ),
            SizedBox(height: 7), // 余白を追加
          ],
        ),
      ),
    );
  }
}
