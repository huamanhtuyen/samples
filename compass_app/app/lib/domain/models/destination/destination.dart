// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có trong tệp LICENSE.

// Nhập gói freezed_annotation để hỗ trợ tạo các lớp bất biến.
import 'package:freezed_annotation/freezed_annotation.dart';

// Phần này để tạo các tệp .freezed.dart và .g.dart tương ứng.
part 'destination.freezed.dart';
part 'destination.g.dart';

// Sử dụng annotation @freezed để tạo lớp bất biến Destination.
@freezed
class Destination with _$Destination {
  // Định nghĩa một factory constructor cho lớp Destination.
  const factory Destination({
    // Ví dụ: 'alaska'
    required String ref, // Tham chiếu đến điểm đến.
    // Ví dụ: 'Alaska'
    required String name, // Tên của điểm đến.
    // Ví dụ: 'United States'
    required String country, // Quốc gia của điểm đến.
    // Ví dụ: 'North America'
    required String continent, // Châu lục của điểm đến.
    // Ví dụ: 'Alaska is a haven for outdoor enthusiasts ...'
    required String knownFor, // Điểm đến nổi tiếng về điều gì.
    // Ví dụ: ['Mountain', 'Off-the-beaten-path', 'Wildlife watching']
    required List<String> tags, // Các thẻ mô tả điểm đến.
    // Ví dụ: 'https://storage.googleapis.com/tripedia-images/destinations/alaska.jpg'
    required String imageUrl, // URL hình ảnh của điểm đến.
  }) = _Destination;

  // Phương thức factory để tạo đối tượng Destination từ JSON.
  factory Destination.fromJson(Map<String, Object?> json) =>
      _$DestinationFromJson(json);
}
