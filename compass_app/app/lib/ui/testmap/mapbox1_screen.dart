import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapboxMapWidget1 extends StatelessWidget {
  const MapboxMapWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MapWidget(
          onMapCreated: (MapboxMap mapboxMap) {
            debugPrint("Mapbox Map Created!");
          },
        ),
      ),
    );
  }
}
