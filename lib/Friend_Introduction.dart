import 'package:flutter/material.dart';

class FriendIntroduction extends StatelessWidget {
  final VoidCallback onPressed;

  FriendIntroduction({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('新しいボタン'),
    );
  }
}
