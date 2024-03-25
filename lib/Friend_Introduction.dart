//Friend_Introduction.dart
//Top画面上部の「お友達を紹介してクーポンゲット」ボタンをタップすると紹介ページを表示するコード
//map_screen.dartファイルの206行目あたりで呼び出し
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FriendIntroducePage(),
    );
  }
}

class FriendIntroducePage extends StatefulWidget {
  @override
  _FriendIntroducePageState createState() => _FriendIntroducePageState();
}

class _FriendIntroducePageState extends State<FriendIntroducePage> {
  @override
  Widget build(BuildContext context) {//友達紹介ページを表示
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // デフォルトで存在していた「戻るアイコン」を削除
        // アクションを設定
        actions: [
          Container(//ヘッダー部に関するコード
            child: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () {//ヘッダー部のアイコンをタップするとTop画面に戻る
                // 前のページに戻る
                Navigator.pop(context);
              },
            ),
          ),
        ],
        backgroundColor: Colors.orange, // ヘッダー部の背景色をオレンジに設定
      ),
      body: SingleChildScrollView(//本ページのボディ部に関するコード
        child: Column(
          children: [
            Container(
              child: Image.asset(//画像を表示
                'assets/images/coupon.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20), // 余白を追加
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // テキストを左寄せに設定
                children: [
                  Text(
                    '①紹介コードを送る',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 8), // テキスト間の余白を追加
                  Text(
                    'まだHELLO CYCLINGを使っていない家族や友達\nに紹介コードを送りましょう',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // 余白を追加
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // テキストを左寄せに設定
                children: [
                  Text(
                    '②クーポンGET！',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 8), // テキスト間の余白を追加
                  Text(
                    '相手が紹介コードを入力して会員登録をすると、\nお互いに30分無料乗車クーポン（130円分）を必\nずプレゼント！',
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFF0E68C), // 背景色を設定
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 8), // テキスト間の余白を追加
                  Text(
                    'あなたの紹介コード',
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 54,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2), // 外枠の色と太さを設定
                    ),
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                height: 50,
                                width: 300,
                                color: Colors.white,
                                child: Center(
                                  child: Text('A B C D E F G', style: TextStyle(color: Colors.black, fontSize: 20)), // フォントサイズを20に設定
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 中央寄せに設定
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        size: 20,
                        color: Colors.grey,
                      ),
                      Text('タップしてコピーする', style: TextStyle(color: Colors.grey, fontSize: 9)),
                      //※タップした際にコピーする機能は付けていない
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity, // 横幅いっぱいに広げる
              color: Colors.orange, // 背景色をオレンジに設定
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 12), // テキストとボタンの間にスペースを追加
                  Text(
                    '\\ 必ず紹介人数分のクーポンがもらえる /',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold), // フォントサイズを15に設定
                  ),
                  SizedBox(height: 8), // テキストとボタンの間にスペースを追加
                  ElevatedButton(
                    onPressed: () {
                      //※ボタンが押されたときの処理は未記入
                      //※友達にシェアできるようにするコーディングが必要
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // ボタンの背景色を設定
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12), // ボタン内の余白を設定
                      // ボタン内のテキストのスタイルを設定
                      textStyle: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    child: Text(
                      '友達にシェア',
                      style: TextStyle(color: Colors.white),
                    ),
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

class SlideUpPageRoute<T> extends PageRouteBuilder<T> {
  //友達紹介ページの表示と閉じるアニメーションを下から上、上から下に変更するコード
  final Widget Function(BuildContext, Animation<double>, Animation<
      double>, Widget) builder;

  SlideUpPageRoute({required this.builder})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) =>
        builder(context, animation, secondaryAnimation, Container()),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation,
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