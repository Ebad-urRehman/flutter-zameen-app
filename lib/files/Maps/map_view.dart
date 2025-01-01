import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  String latitude;
  String longitude;
  MapView({super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    double dLatitude = double.tryParse(latitude) ?? 103;
    double dLongitude = double.tryParse(longitude) ?? 103;
    return FlutterMap(
      options: MapOptions(
          initialCenter: LatLng(dLatitude, dLongitude),
          initialZoom: 13,
          interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom)),
      children: [
        mapTileLayer,
        MarkerLayer(markers: [
          Marker(
              point: LatLng(dLatitude, dLongitude),
              width: 60,
              height: 60,
              alignment: Alignment.centerLeft,
              child: const Row(children: [
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
