//Help_Outline_Button_Detail.dartファイル
//Top画面の右端4つのボタンの1番下のアイコンボタンをタップした際に読まれるコード
//map_screen.dartファイルの281行目あたりで呼び出し

import 'package:flutter/material.dart';

class SlideUpPageRoute2<T> extends PageRouteBuilder<T> {
  //ヘルプページの「表示」と「閉じる」アニメーションを下から上、上から下に変更するコード
  final Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) builder;
  SlideUpPageRoute2({required this.builder})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
        builder(context, animation, secondaryAnimation, Container()),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,
        Widget child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

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
      appBar: AppBar(//ヘッダー部のコード
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
                    Navigator.pop(context);// 前のページに戻る
                  },
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.orange, // ヘッダー部の背景色をオレンジに設定
      ),
      body: SingleChildScrollView(//ボディ部のコード
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
              //※「ご利用ガイドへ」をタップした際のコードは未作成
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
            Divider(//横に線を入れる
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
              //※「エラーが表示される」をタップした際のコードは未作成
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
              //※「返却できない」をタップした際のコードは未作成
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
              //※「車両の不具合」をタップした際のコードは未作成
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
              //※「車両の不具合」をタップした際のコードは未作成
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
              //※「利用開始できない」をタップした際のコードは未作成
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
              //※「料金・決済について」をタップした際のコードは未作成
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
              //※「事故に遭った・起こした」をタップした際のコードは未作成
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
