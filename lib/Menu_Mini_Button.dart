//Menu_Mini_Button.dartファイル
//Top画面の右端4つのボタンの1番上をタップするとメニューページを表示するコード
//map_screen.dartファイルの247行目で呼び出し

import 'package:flutter/material.dart';

  class MenuMiniButton extends StatefulWidget {
    @override
    _MenuMiniButtonState createState() => _MenuMiniButtonState();
  }

  class _MenuMiniButtonState extends State<MenuMiniButton> {
    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,//スクロール可能に
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            builder: (BuildContext context) {
              return Container(
                alignment: Alignment.topCenter, // 画像を上部に配置する
                height: MediaQuery.of(context).size.height * 0.9,//画面全体の9割で表示を止める
                child: Column(
                  children: [
                    Container(
                      color: Colors.orange,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(//ヘッダー部の表示テキスト＆アイコン
                              child: Text(
                                'メニュー',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {//メニュー文字の右にあるアイコンをタップすると前のページに戻る
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
                    Expanded(//ボディ部のコード
                      child:Container(
                        color: Colors.grey[200], // ボディ部の背景色を薄いグレーに設定
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Image.asset(
                              'assets/images/rule.jpg',
                              fit: BoxFit.contain, // 画像を親のサイズに合わせて表示
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 340, // セルの幅
                              height: 100, // セルの高さ
                              color: Colors.white, // テキストの背景色を薄いグレーに設定
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // テキストを左揃えにする
                                children: [
                                  Text(
                                    '  会員ID：19950816',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '  古金 佑允(フルカネ ユウスケ)さま',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Divider(
                                    color: Colors.grey,
                                    height: 2,
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {//※「会員登録情報確認・変更/決済方法変更/月額プラン申込ページ」は作成していません
                                            // ボタンがタップされたときの処理をここに記述します
                                          },
                                          child: Text(
                                            '会員登録情報確認・変更/決済方法変更/月額プラン申込',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.grey, // テキストの色をグレーに設定
                                              fontSize: 9,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20), // テキストとアイコンの間隔を調整
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 340, // セルの幅
                              height: 40, // セルの高さ
                              color: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center, // セルの高さの中央に配置する
                                children: [
                                  Icon(
                                    Icons.attach_email_outlined,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(//この先のメッセージページに遷移するコードは未作成
                                  'メッセージ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 212), // テキストとアイコンの間隔を調整
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 340, // セルの幅
                              height: 310, // セルの高さ
                              color: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center, // セルの高さの中央に配置する
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center, // アイコンとテキストを中央に配置する
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(//この先の予約・利用履歴ページに遷移するコードは未作成
                                        '予約・利用履歴',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 187), // テキストとアイコンの間隔を調整
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Divider(
                                    color: Colors.grey,
                                    height: 2,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center, // アイコンとテキストを中央に配置する
                                    children: [
                                      Icon(
                                        Icons.edit_note,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(//この先の利用明細書発行ページに遷移するコードは未作成
                                        '利用明細書発行',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 187), // テキストとアイコンの間隔を調整
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Divider(
                                    color: Colors.grey,
                                    height: 2,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center, // アイコンとテキストを中央に配置する
                                    children: [
                                      Icon(
                                        Icons.discount,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'クーポン一覧',//この先のクーポン一覧ページに遷移するコードは未作成
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 199), // テキストとアイコンの間隔を調整
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Divider(
                                    color: Colors.grey,
                                    height: 2,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center, // アイコンとテキストを中央に配置する
                                    children: [
                                      Icon(
                                        Icons.sd_card,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(//この先のICカード・HELLOカードページに遷移するコードは未作成
                                        'ICカード・HELLOカード',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 138), // テキストとアイコンの間隔を調整
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Divider(
                                    color: Colors.grey,
                                    height: 2,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center, // アイコンとテキストを中央に配置する
                                    children: [
                                      Icon(
                                        Icons.control_camera,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(//この先のICカード・HELLOカードページに遷移するコードは未作成
                                        'HELLOマイル',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 198), // テキストとアイコンの間隔を調整
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Divider(
                                    color: Colors.grey,
                                    height: 2,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center, // アイコンとテキストを中央に配置する
                                    children: [
                                      Icon(
                                        Icons.electric_bike,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(//この先の電動サイクル利用準備ページに遷移するコードは未作成
                                        '電動サイクル利用準備',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 150), // テキストとアイコンの間隔を調整
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Divider(
                                    color: Colors.grey,
                                    height: 2,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center, // アイコンとテキストを中央に配置する
                                    children: [
                                      Icon(
                                        Icons.rule_outlined,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(//この先の交通ルールとマナーページに遷移するコードは未作成
                                        '交通ルールとマナー',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 162), // テキストとアイコンの間隔を調整
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Divider(
                                    color: Colors.grey,
                                    height: 2,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center, // アイコンとテキストを中央に配置する
                                    children: [
                                      Icon(
                                        Icons.question_mark,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(//この先のヘルプ・ご利用ガイドページに遷移するコードは未作成
                                        'ヘルプ・ご利用ガイド',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 150), // テキストとアイコンの間隔を調整
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 340, // セルの幅
                              height: 40, // セルの高さ
                              color: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center, // セルの高さの中央に配置する
                                children: [
                                  SizedBox(width: 10),
                                  Text(//※この先のこのアプリについてページに遷移するコードは未作成
                                    'このアプリについて',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 183), // テキストとアイコンの間隔を調整
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Image.asset(
                              'assets/images/free_coupon.jpg',
                              fit: BoxFit.contain, // 画像を親のサイズに合わせて表示
                            ),
                            SizedBox(height: 20),
                            Text(
                              '言語変更',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                              ),
                              textAlign: TextAlign.start, // テキストを左寄せに設定
                            ),
                            Container(
                              width: 340, // セルの幅
                              height: 40, // セルの高さ
                              color: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center, // セルの高さの中央に配置する
                                children: [
                                  SizedBox(width: 10),
                                  Text(//※この先の言語変更ページに遷移するコードは未作成
                                    '日本語',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 250), // テキストとアイコンの間隔を調整
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            // 他のウィジェットを追加する場合はここに追加します
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
        child: Container(
          constraints: BoxConstraints.tightFor(
            width: 30, // ボタンの幅を30に設定
            height: 30, // ボタンの高さを30に設定
          ),
          decoration: BoxDecoration(
            color: Colors.white, // 白色
            borderRadius: BorderRadius.circular(3), // ボタンの形状を設定
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), // ボタン内の余白を設定
          child: Icon(
            Icons.dehaze, // アイコンの種類を指定
            size: 20, // アイコンのサイズを設定
            color: Colors.black, // アイコンの色を設定
          ),
        ),
      );
    }
  }
