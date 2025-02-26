// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:latlong2/latlong.dart';
//import 'package:geolocator/geolocator.dart';

class MapboxMapWidget1 extends StatefulWidget {
  const MapboxMapWidget1({super.key});

  @override
  State<MapboxMapWidget1> createState() => _MapboxMapWidget1State();
}

class _MapboxMapWidget1State extends State<MapboxMapWidget1> {
  late MapboxMap _mapboxMap;
  PointAnnotationManager? _annotationManager;

  // Tọa độ Cầu Giấy, Hà Nội
  static const LatLng cauGiayLocation = LatLng(21.028511, 105.782965);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MapWidget(
          onMapCreated: (MapboxMap mapboxMap) async {
            debugPrint("Mapbox Map Created!");
            _mapboxMap = mapboxMap;

            // Lấy annotation manager
            _annotationManager =
                await _mapboxMap.annotations.createPointAnnotationManager();

            // Di chuyển camera đến tọa độ
            _moveToLocation();

            // Thêm marker tại tọa độ đó
            _addMarker();
          },
        ),
      ),
    );
  }

  /// Di chuyển camera đến tọa độ Cầu Giấy
  void _moveToLocation() {
    _mapboxMap.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            cauGiayLocation.longitude,
            cauGiayLocation.latitude,
          ),
        ),
        zoom: 15.0, // Độ zoom gần
        bearing: 0.0,
        pitch: 0.0,
      ),
      MapAnimationOptions(duration: 2000, startDelay: 0),
    );
  }

  /// Thêm marker vào bản đồ
  Future<void> _addMarker() async {
    if (_annotationManager == null) return;

    await _annotationManager!.create(
      PointAnnotationOptions(
        geometry: Point(
          coordinates: Position(
            cauGiayLocation.longitude,
            cauGiayLocation.latitude,
          ),
        ),
        iconImage: "marker-15", // Sử dụng icon marker mặc định của Mapbox
        iconSize: 1.5, // Điều chỉnh kích thước icon
      ),
    );
  }
}
