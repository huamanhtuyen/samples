// ignore_for_file: directives_ordering

import 'package:flutter/material.dart'; // Nhập gói Flutter Material
import 'package:logging/logging.dart'; // Nhập gói logging
import 'package:provider/provider.dart'; // Nhập gói provider
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/dependencies.dart'; // Nhập tệp dependencies
import 'main.dart'; // Nhập tệp main
import 'package:flutter/rendering.dart';
import 'ui/core/localization/locale_provider.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Điểm vào cấu hình staging.
/// Khởi chạy với `flutter run --target lib/main_staging.dart`.
/// Sử dụng dữ liệu từ xa từ máy chủ.
void main() async {
  //nếu xóa dòng nầy thì mapbox sẽ không chạy được nhé, lưu ý
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo Flutter binding được khởi tạo

  Logger.root.level = Level.ALL; // Đặt mức độ ghi log là ALL
  final log = Logger('MainApplication'); // Biến lưu trữ đối tượng Logger

  //cấu hình mapbox
  final accessToken = const String.fromEnvironment(
    "ACCESS_TOKEN",
    defaultValue: "",
  );
  if (accessToken.isEmpty) {
    throw Exception("THIẾU Mapbox Access Token RỒI!");
  }
  try {
    MapboxOptions.setAccessToken(accessToken);
  } catch (e, stackTrace) {
    debugPrint("🔥 Exception: $e");
    debugPrint("📌 StackTrace: $stackTrace");
  }

  //Khởi tạo kết nối đến supabase
  await Supabase.initialize(
    url: 'https://hxetbhwcaqjfmfpnaiiq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4ZXRiaHdjYXFqZm1mcG5haWlxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk2NjYzNDAsImV4cCI6MjA1NTI0MjM0MH0.I-a7DHYtOVNt5oB9EUrfBwqff0bj8AruMlVab37ZyZY',
  );

  //Supabase có cơ chế tự động cập nhật session nếu bạn bật auth.onAuthStateChange:
  final supabaseClient = Supabase.instance.client;
  supabaseClient.auth.onAuthStateChange.listen((data) {
    final event = data.event;
    final session = data.session;

    if (session != null) {
      log.info('Cập nhật trạng thái đăng nhập: ${session.user.email}');
      log.info('Token mới: ${session.accessToken}');
    }

    if (event == AuthChangeEvent.signedOut) {
      log.info('Người dùng đã đăng xuất');
    }
  });

  debugPaintSizeEnabled = false;

  runApp(
    MultiProvider(
      providers: [
        ...providersRemote,
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(),
        ), // Thêm LocaleProvider vào danh sách providers
      ],
      child: const MainApp(),
    ),
  );
  // Chạy ứng dụng với MultiProvider, sử dụng providersRemote và MainApp
}
