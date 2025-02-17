// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:freezed_annotation/freezed_annotation.dart'; // Nhập gói freezed_annotation

part 'booking_api_model.freezed.dart'; // Phần mã được tạo tự động bởi freezed
part 'booking_api_model.g.dart'; // Phần mã được tạo tự động bởi json_serializable

@freezed
class BookingApiModel with _$BookingApiModel {
  // Định nghĩa lớp BookingApiModel sử dụng freezed
  const factory BookingApiModel({
    /// ID đặt chỗ. Được tạo khi lưu trữ trên máy chủ.
    int? id,

    /// Ngày bắt đầu chuyến đi
    required DateTime startDate,

    /// Ngày kết thúc chuyến đi
    required DateTime endDate,

    /// Tên đặt chỗ
    /// Nên là "Điểm đến, Châu lục"
    required String name,

    /// Điểm đến của chuyến đi
    required String destinationRef,

    /// Danh sách các hoạt động đã chọn
    required List<String> activitiesRef,
  }) = _BookingApiModel;

  // Phương thức tạo đối tượng từ JSON
  factory BookingApiModel.fromJson(Map<String, Object?> json) =>
      _$BookingApiModelFromJson(json);
}
