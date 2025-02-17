// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Hành vi cuộn tùy chỉnh để cho phép kéo bằng chuột.
/// Cần thiết để cho phép kéo bằng chuột trên băng chuyền Châu lục.
class AppCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  // Đặt các thiết bị con trỏ được phép kéo
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch, // Cho phép kéo bằng cảm ứng
    // Cho phép kéo bằng chuột trên băng chuyền Khu vực
    PointerDeviceKind.mouse, // Cho phép kéo bằng chuột
  };
}
