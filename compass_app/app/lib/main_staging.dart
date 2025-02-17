// Bản quyền 2024 của nhóm Flutter. Tất cả các quyền được bảo lưu.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể
// được tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart'; // Nhập gói Flutter Material
import 'package:logging/logging.dart'; // Nhập gói logging
import 'package:provider/provider.dart'; // Nhập gói provider
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/dependencies.dart'; // Nhập tệp dependencies
import 'main.dart'; // Nhập tệp main

/// Điểm vào cấu hình staging.
/// Khởi chạy với `flutter run --target lib/main_staging.dart`.
/// Sử dụng dữ liệu từ xa từ máy chủ.
void main() async {
  Logger.root.level = Level.ALL; // Đặt mức độ ghi log là ALL

  //Khởi tạo kết nối đến supabase
  await Supabase.initialize(
    url: 'https://hxetbhwcaqjfmfpnaiiq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4ZXRiaHdjYXFqZm1mcG5haWlxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk2NjYzNDAsImV4cCI6MjA1NTI0MjM0MH0.I-a7DHYtOVNt5oB9EUrfBwqff0bj8AruMlVab37ZyZY',
  );

  runApp(MultiProvider(providers: providersRemote, child: const MainApp()));
  // Chạy ứng dụng với MultiProvider, sử dụng providersRemote và MainApp
}
