// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép BSD-style có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart'; // Thư viện Flutter Material
import 'package:logging/logging.dart'; // Thư viện logging
import 'package:share_plus/share_plus.dart'; // Thư viện share_plus để chia sẻ nội dung

import '../../../ui/core/ui/date_format_start_end.dart'; // Định dạng ngày bắt đầu và kết thúc
import '../../../utils/result.dart'; // Kết quả trả về
import '../../models/booking/booking.dart'; // Mô hình đặt chỗ

typedef ShareFunction =
    Future<void> Function(String text); // Định nghĩa kiểu hàm chia sẻ

/// UseCase để chia sẻ một đặt chỗ.
class BookingShareUseCase {
  BookingShareUseCase._(this._share); // Hàm khởi tạo riêng với hàm chia sẻ

  /// Tạo một [BookingShareUseCase] sử dụng gói `share_plus`.
  factory BookingShareUseCase.withSharePlus() =>
      BookingShareUseCase._(Share.share); // Hàm khởi tạo sử dụng share_plus

  /// Tạo một [BookingShareUseCase] với hàm chia sẻ tùy chỉnh.
  factory BookingShareUseCase.custom(ShareFunction share) =>
      BookingShareUseCase._(share); // Hàm khởi tạo với hàm chia sẻ tùy chỉnh

  final ShareFunction _share; // Biến lưu hàm chia sẻ
  final _log = Logger('BookingShareUseCase'); // Biến ghi log

  Future<Result<void>> shareBooking(Booking booking) async {
    // Tạo nội dung chia sẻ từ thông tin đặt chỗ
    final text =
        'Chuyến đi đến ${booking.destination.name}\n'
        'vào ${dateFormatStartEnd(DateTimeRange(start: booking.startDate, end: booking.endDate))}\n'
        'Hoạt động:\n'
        '${booking.activity.map((a) => ' - ${a.name}').join('\n')}.'; // Nội dung chia sẻ

    _log.info('Chia sẻ đặt chỗ: $text'); // Ghi log thông tin chia sẻ
    try {
      await _share(text); // Thực hiện chia sẻ
      _log.fine('Đã chia sẻ đặt chỗ'); // Ghi log khi chia sẻ thành công
      return const Result.ok(null); // Trả về kết quả thành công
    } on Exception catch (error) {
      _log.severe(
        'Không thể chia sẻ đặt chỗ',
        error,
      ); // Ghi log khi chia sẻ thất bại
      return Result.error(error); // Trả về kết quả lỗi
    }
  }
}
