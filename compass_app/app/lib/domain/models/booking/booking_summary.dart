// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:freezed_annotation/freezed_annotation.dart'; // Nhập gói freezed_annotation

part 'booking_summary.freezed.dart'; // Phần freezed của tệp booking_summary
part 'booking_summary.g.dart'; // Phần g.dart của tệp booking_summary

/// BookingSummary chứa dữ liệu cần thiết để hiển thị một đặt chỗ
/// trên màn hình chính của người dùng, nhưng thiếu các dữ liệu đặt chỗ khác
/// như các hoạt động hoặc điểm đến.
///
/// Sử dụng [BookingRepository] để lấy một [Booking] đầy đủ
/// bằng cách sử dụng [BookingSummary.id].
@freezed
class BookingSummary with _$BookingSummary {
  // Định nghĩa một factory constructor cho BookingSummary
  const factory BookingSummary({
    /// ID của đặt chỗ
    required int id,

    /// Tên sẽ được hiển thị
    required String name,

    /// Ngày bắt đầu của đặt chỗ
    required DateTime startDate,

    /// Ngày kết thúc của đặt chỗ
    required DateTime endDate,
  }) = _BookingSummary;

  // Phương thức để tạo một BookingSummary từ JSON
  factory BookingSummary.fromJson(Map<String, Object?> json) =>
      _$BookingSummaryFromJson(json);
}
