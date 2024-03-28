//PlaceName_Favorite.dart
//会社名の表示＆お気に入りボタンを表示しON/OFFできるコード
//map_screen.dartの313行目で呼び出されている
import 'package:flutter/material.dart';

class CompanyRow extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  // コンストラクタ名を修正し、クラス名に合わせます
  CompanyRow({
    required this.isFavorite,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '株式会社システム創造開発',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: isFavorite
              ? Icon(Icons.star, color: Colors.yellow)
              : Icon(Icons.star_border),
          onPressed: onPressed,
        ),
      ],
    );
  }
}