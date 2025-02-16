// Bản quyền 2024 của nhóm Flutter. Tất cả các quyền được bảo lưu.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể
// được tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart'; // Nhập gói Flutter Material
import 'package:logging/logging.dart'; // Nhập gói logging
import 'package:provider/provider.dart'; // Nhập gói provider

import 'config/dependencies.dart'; // Nhập tệp dependencies
import 'main.dart'; // Nhập tệp main

/// Điểm vào cấu hình staging.
/// Khởi chạy với `flutter run --target lib/main_staging.dart`.
/// Sử dụng dữ liệu từ xa từ máy chủ.
void main() {
  Logger.root.level = Level.ALL; // Đặt mức độ ghi log là ALL

  runApp(MultiProvider(providers: providersRemote, child: const MainApp())); 
  // Chạy ứng dụng với MultiProvider, sử dụng providersRemote và MainApp
}
