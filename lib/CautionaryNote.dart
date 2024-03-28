//CautionaryNote.dart
//注意事項を表示するコード
//Reaservation_Display.dart135行目で呼び出し
import 'package:flutter/material.dart';
import 'map_screen.dart';

class CautionText extends StatelessWidget {
  final IconDataModel iconData;

  const CautionText({
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '【注意事項：ご利用前に必ずご確認ください】',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8), // テキスト間の余白を設定
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 12.5,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '予約は30分間有効で料金は発生しません。',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '車両のロックを解錠すると利用開始となり、返却完了までの利用時間に応じた金額が返却時に自動で請求されます。',
                style: TextStyle(
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 12.5,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '貸出予約のキャンセルは連続で5回までです。',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '(自動キャンセル含む)詳しくはご利用ガイドの予約のキャンセルについてをご覧ください。',
                style: TextStyle(
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 12.5,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '満車や営業時間外のステーション、ご利用の車種に非対応のステーションには返却できません。',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 0, 0, 0.8),
                ),
              ),
              TextSpan(
                text: '※適切に車両を返却いただけなかった場合、利用料金とは別に車両移動費を請求させていただく場合がございますことあらかじめご了承ください。',
                style: TextStyle(
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.security,
              size: 15,
              color: Colors.blue,
            ),
            SizedBox(width: 4),
            Text(
              '利用金額について',
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}