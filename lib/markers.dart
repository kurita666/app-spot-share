import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async'; // 追加する

class Markers {
  Future<BitmapDescriptor> _createCustomMarker() async {
    // ここで画像をAssetから読み込んでBitmapに変換する
    ByteData imageData = await rootBundle.load("assets/custom_marker.png");
    Uint8List bytes = imageData.buffer.asUint8List();
    BitmapDescriptor bitmapDescriptor = BitmapDescriptor.fromBytes(bytes);
    return bitmapDescriptor;
  }

  Future<Marker> buildMarker() async {
    // BitmapDescriptorの生成が非同期で行われるため、Futureでラップする
    BitmapDescriptor customMarkerIcon = await _createCustomMarker();
    return Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(35.699872, 139.775335),
      icon: customMarkerIcon,
    );
  }
}
