// Bản quyền 2024 thuộc về nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:freezed_annotation/freezed_annotation.dart'; // Nhập gói freezed_annotation

part 'itinerary_config.freezed.dart'; // Phần freezed của tệp
part 'itinerary_config.g.dart'; // Phần g.dart của tệp

@freezed
class ItineraryConfig with _$ItineraryConfig {
  // Định nghĩa lớp ItineraryConfig sử dụng freezed
  const factory ItineraryConfig({
    /// Tên [Continent]
    String? continent, // Tên lục địa
    /// Ngày bắt đầu (check in) của hành trình
    DateTime? startDate, // Ngày bắt đầu của hành trình
    /// Ngày kết thúc (check out) của hành trình
    DateTime? endDate, // Ngày kết thúc của hành trình
    /// Số lượng khách
    int? guests, // Số lượng khách
    /// Tham chiếu [Destination] đã chọn
    String? destination, // Điểm đến đã chọn
    /// Tham chiếu [Activity] đã chọn
    @Default([])
    List<String>
    activities, // Danh sách hoạt động đã chọn, mặc định là danh sách rỗng
  }) = _ItineraryConfig; // Định nghĩa factory constructor

  factory ItineraryConfig.fromJson(Map<String, Object?> json) =>
      _$ItineraryConfigFromJson(json); // Phương thức tạo đối tượng từ JSON
}
