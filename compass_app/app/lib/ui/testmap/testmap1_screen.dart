// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class OpenStreetMapScreen1 extends StatefulWidget {
  const OpenStreetMapScreen1({super.key});

  @override
  State<OpenStreetMapScreen1> createState() => _OpenStreetMapScreen1State();
}

class _OpenStreetMapScreen1State extends State<OpenStreetMapScreen1> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Kiểm tra xem GPS có bật không
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("GPS chưa được bật!");
      return;
    }

    // Kiểm tra quyền truy cập vị trí
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Quyền vị trí bị từ chối!");
        //fake vị trị cho ứng dụng window
        setState(() {
          _currentPosition = Position(
            latitude: 10.762622,
            longitude: 106.660172,
            timestamp: DateTime.now(),
            accuracy: 0.0,
            altitude: 0.0,
            altitudeAccuracy: 0.0,
            heading: 0.0,
            headingAccuracy: 0.0,
            speed: 0.0,
            speedAccuracy: 0.0,
          );
        });
        //thoát hàm
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Quyền vị trí bị từ chối vĩnh viễn!");
      return;
    }

    // Lấy vị trí hiện tại
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Định vị')),
      body:
          _currentPosition == null
              ? Text("Đang lấy tọa độ...")
              : FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(10.762622, 106.660172), // TP. HCM
                  initialZoom: 13,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(
                          _currentPosition!.latitude,
                          _currentPosition!.longitude,
                        ),
                        width: 80,
                        height: 80,
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
    );
  }
}
