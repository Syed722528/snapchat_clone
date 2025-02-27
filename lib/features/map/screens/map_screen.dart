import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:snapchat_clone/core/common_widgets/app_bar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
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
              MarkerLayer(markers: [Marker()]),
            ],
          ),
          buildAppBar(
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            'Maps',
            Colors.black,
          ),
        ],
      ),
    );
  }
}
