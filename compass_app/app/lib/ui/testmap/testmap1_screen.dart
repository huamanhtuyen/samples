import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OpenStreetMapScreen1 extends StatelessWidget {
  const OpenStreetMapScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Định vị')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(10.762622, 106.660172), // TP. HCM
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(10.762622, 106.660172),
                width: 80,
                height: 80,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
