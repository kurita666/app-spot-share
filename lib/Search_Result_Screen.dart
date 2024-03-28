import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchResultScreen extends StatelessWidget {
  final String searchTerm;
  final LatLng initialPosition; // 新しく追加されたパラメータ

  SearchResultScreen({required this.searchTerm, required this.initialPosition}); // コンストラクタに追加

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialPosition, // 初期位置を追加された位置に変更
          zoom: 15, // 初期ズームレベル
        ),
        markers: {
          Marker(
            markerId: MarkerId('searchLocation'),
            position: initialPosition, // マーカー位置を追加された位置に変更
          )
        },
      ),
    );
  }
}
