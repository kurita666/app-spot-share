//GoogleMap_Display.dart
//GoogleMapを表示するコード
//map_screen.dartの役133行目で呼び出し

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDisplay extends StatelessWidget {
  final LatLng initialPosition;
  final BitmapDescriptor customMarkerIcon;
  final Function()? onIconTap;

  const MapDisplay({
    Key? key,
    required this.initialPosition,
    required this.customMarkerIcon,
    this.onIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        // マップが作成されたときの処理
      },
      initialCameraPosition: CameraPosition(
        target: initialPosition,
        zoom: 12.0,
      ),
      markers: {
        Marker(
          markerId: MarkerId('marker_1'),
          position: initialPosition,
          onTap: onIconTap,
          icon: customMarkerIcon,
        ),
      },
    );
  }
}
