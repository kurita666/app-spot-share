import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'markers.dart'; // markers.dartをインポートする

class GoogleMapWidget extends StatefulWidget {
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    final customMarkerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue); // カスタムマーカーアイコンを取得

    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _mapController = controller;
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(35.699872, 139.775335),
        zoom: 12.0,
      ),
      // markers: {
      //   Markers(customMarkerIcon).buildMarker(), // Markersクラスのインスタンス化とbuildMarker()メソッドの呼び出し
      // },
    );
  }
}