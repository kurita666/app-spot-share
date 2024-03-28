//GoogleMap_Display.dart
//GoogleMapを表示するコード
//map_screen.dartファイルの133行目あたりで呼び出される
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDisplay extends StatefulWidget {
  final LatLng initialPosition;// 初期位置を示す
  final BitmapDescriptor customMarkerIcon;//マーカーアイコンを指定する BitmapDescriptor オブジェクト。

  final Function()? onIconTap;// マーカーアイコンがタップされたときのコールバック関数

  const MapDisplay({
    Key? key,
    required this.initialPosition,
    required this.customMarkerIcon,
    this.onIconTap,
  }) : super(key: key);

  @override
  _MapDisplayState createState() => _MapDisplayState();
}

class _MapDisplayState extends State<MapDisplay> {
  late LatLng _currentPosition;

  @override
  void initState() {
    super.initState();
    _currentPosition = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        // マップが作成されたときの処理
      },
      initialCameraPosition: CameraPosition(
        target: _currentPosition,
        zoom: 12.0,
      ),
      markers: {
        Marker(
          markerId: MarkerId('marker_1'),
          position: _currentPosition,
          onTap: widget.onIconTap,
          icon: widget.customMarkerIcon,
        ),
      },
    );
  }

  void updatePosition(LatLng newPosition) {
    setState(() {
      _currentPosition = newPosition;
    });
  }
}
