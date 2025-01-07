import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  String latitude;
  String longitude;
  String propertyName;
  String purpose;
  String city;

  MapView(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.propertyName,
      required this.purpose,
      required this.city});

  @override
  Widget build(BuildContext context) {
    double dLatitude = double.tryParse(latitude) ?? 103;
    double dLongitude = double.tryParse(longitude) ?? 103;
    return Stack(
      children: [
        FlutterMap(
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
                  width: 68,
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: const Row(children: [
                    Icon(Icons.location_pin, size: 60, color: Colors.red),
                  ]))
            ])
          ],
        ),
        Positioned(
            top: 2,
            right: 2,
            child: Column(children: [
              Text(
                '$propertyName $purpose',
                style: const TextStyle(fontFamily: 'Itim', fontSize: 14),
              ),
              Text('City : $city',
                  style: TextStyle(fontFamily: 'Itim', fontSize: 14)),
            ])),
      ],
    );
  }
}

TileLayer get mapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
