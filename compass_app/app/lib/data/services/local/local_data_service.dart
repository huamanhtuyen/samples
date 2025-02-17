// Bản quyền 2024 Đội Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'dart:convert'; // Thư viện để mã hóa và giải mã JSON

import 'package:flutter/services.dart'; // Thư viện để làm việc với các dịch vụ của Flutter

import '../../../config/assets.dart'; // Import các tài sản cấu hình
import '../../../domain/models/activity/activity.dart'; // Import mô hình hoạt động
import '../../../domain/models/continent/continent.dart'; // Import mô hình châu lục
import '../../../domain/models/destination/destination.dart'; // Import mô hình điểm đến
import '../../../domain/models/user/user.dart'; // Import mô hình người dùng

class LocalDataService {
  // Phương thức để lấy danh sách các châu lục
  List<Continent> getContinents() {
    return [
      const Continent(
        name: 'Europe', // Tên châu lục
        imageUrl:
            'https://rstr.in/google/tripedia/TmR12QdlVTT', // URL hình ảnh của châu lục
      ),
      const Continent(
        name: 'Asia',
        imageUrl: 'https://rstr.in/google/tripedia/VJ8BXlQg8O1',
      ),
      const Continent(
        name: 'South America',
        imageUrl: 'https://rstr.in/google/tripedia/flm_-o1aI8e',
      ),
      const Continent(
        name: 'Africa',
        imageUrl: 'https://rstr.in/google/tripedia/-nzi8yFOBpF',
      ),
      const Continent(
        name: 'North America',
        imageUrl: 'https://rstr.in/google/tripedia/jlbgFDrSUVE',
      ),
      const Continent(
        name: 'Oceania',
        imageUrl: 'https://rstr.in/google/tripedia/vxyrDE-fZVL',
      ),
      const Continent(
        name: 'Australia',
        imageUrl: 'https://rstr.in/google/tripedia/z6vy6HeRyvZ',
      ),
    ];
  }

  // Phương thức bất đồng bộ để lấy danh sách các hoạt động
  Future<List<Activity>> getActivities() async {
    final json = await _loadStringAsset(
      Assets.activities,
    ); // Tải dữ liệu từ tài sản
    return json
        .map<Activity>(Activity.fromJson)
        .toList(); // Chuyển đổi JSON thành danh sách các hoạt động
  }

  // Phương thức bất đồng bộ để lấy danh sách các điểm đến
  Future<List<Destination>> getDestinations() async {
    final json = await _loadStringAsset(
      Assets.destinations,
    ); // Tải dữ liệu từ tài sản
    return json
        .map<Destination>(Destination.fromJson)
        .toList(); // Chuyển đổi JSON thành danh sách các điểm đến
  }

  // Phương thức bất đồng bộ để tải dữ liệu từ tài sản
  Future<List<Map<String, dynamic>>> _loadStringAsset(String asset) async {
    final localData = await rootBundle.loadString(
      asset,
    ); // Tải chuỗi từ tài sản
    return (jsonDecode(localData) as List)
        .cast<
          Map<String, dynamic>
        >(); // Giải mã JSON và chuyển đổi thành danh sách các bản đồ
  }

  // Phương thức để lấy thông tin người dùng
  User getUser() {
    return const User(
      name: 'Sofie', // Tên người dùng
      // Vì mục đích demo, chúng tôi sử dụng một tài sản cục bộ
      picture: 'assets/user.jpg', // Đường dẫn đến hình ảnh của người dùng
    );
  }
}
