import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
          initialCenter: LatLng(1, 103),
          initialZoom: 7,
          interactionOptions: InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom)),
      children: [
        mapTileLayer,
        const MarkerLayer(markers: [
          Marker(
              point: LatLng(1, 103),
              width: 60,
              height: 60,
              alignment: Alignment.centerLeft,
              child: Row(children: [
                Icon(Icons.location_pin, size: 60, color: Colors.red),
                SizedBox(
                  width: 8,
                ),
                Column(children: [
                  Text(
                    'House for sale',
                    style: TextStyle(fontFamily: 'Itim', fontSize: 14),
                  ),
                  Text('Location : Islamabad',
                      style: TextStyle(fontFamily: 'Itim', fontSize: 14)),
                ])
              ]))
        ])
      ],
    );
  }
}

TileLayer get mapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
