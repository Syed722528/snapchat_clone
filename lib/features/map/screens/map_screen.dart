import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(31.5204, 74.3587),
            initialZoom: 8,
            initialRotation: BorderSide.strokeAlignInside,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/syed729/cm5fa0zce00ql01saezosf66c/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic3llZDcyOSIsImEiOiJjbTVmOXNqb3gzYmQyMmxzZ3llYmhrdm0xIn0.xmJRUPc0miZBttzL_Sj51w',
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1Ijoic3llZDcyOSIsImEiOiJjbTVmOXNqb3gzYmQyMmxzZ3llYmhrdm0xIn0.xmJRUPc0miZBttzL_Sj51w',
                'id': 'mapbox.mapbox-terrain-v2',
              },
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(31.6001, 74.3397),
                  child: Icon(Icons.location_on_sharp, color: Colors.red),
                ),
              ],
            ),
            buildTopBar(),
          ],
        ),
      ],
    );
  }
}

Positioned buildTopBar() {
  return Positioned(
    top: 30,
    right: 0,
    left: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(icon: Icon(Icons.cameraswitch), onPressed: () {}),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(icon: Icon(Icons.person_add), onPressed: () {}),
            Column(
              children: [
                IconButton(icon: Icon(Icons.switch_camera), onPressed: () {}),
                IconButton(icon: Icon(Icons.settings), onPressed: () {}),

                IconButton(onPressed: () {}, icon: Icon(Icons.music_note)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
