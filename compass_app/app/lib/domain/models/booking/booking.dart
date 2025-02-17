// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có trong tệp LICENSE.

import 'package:freezed_annotation/freezed_annotation.dart'; // Nhập gói freezed_annotation

import '../activity/activity.dart'; // Nhập mô-đun activity
import '../destination/destination.dart'; // Nhập mô-đun destination

part 'booking.freezed.dart'; // Phần freezed của tệp booking
part 'booking.g.dart'; // Phần g.dart của tệp booking

@freezed // Sử dụng annotation freezed để tạo các lớp bất biến
class Booking with _$Booking {
  // Định nghĩa lớp Booking với mixin _$Booking
  const factory Booking({
    // Định nghĩa một factory constructor cho lớp Booking
    /// ID tùy chọn của booking.
    /// Có thể là null nếu booking chưa được lưu trữ.
    int? id, // ID của booking, có thể null
    /// Ngày bắt đầu của chuyến đi
    required DateTime startDate, // Ngày bắt đầu, bắt buộc
    /// Ngày kết thúc của chuyến đi
    required DateTime endDate, // Ngày kết thúc, bắt buộc
    /// Điểm đến của chuyến đi
    required Destination destination, // Điểm đến, bắt buộc
    /// Danh sách các hoạt động đã chọn
    required List<Activity> activity, // Danh sách hoạt động, bắt buộc
  }) = _Booking; // Gán giá trị cho lớp _Booking

  // Phương thức factory để tạo đối tượng Booking từ JSON
  factory Booking.fromJson(Map<String, Object?> json) =>
      _$BookingFromJson(json); // Tạo đối tượng Booking từ JSON
}
