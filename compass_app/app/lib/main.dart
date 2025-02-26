// ignore_for_file: directives_ordering

import 'package:flutter/material.dart'; // Thư viện Flutter Material
import 'package:flutter_localizations/flutter_localizations.dart'; // Thư viện hỗ trợ đa ngôn ngữ
import 'package:provider/provider.dart'; // Thư viện quản lý trạng thái

//import 'main_development.dart.bak' as development; // Import tệp main_development.dart với bí danh development
import 'main_staging.dart' as staging;
import 'routing/router.dart'; // Import tệp router.dart
import 'ui/core/localization/applocalization.dart'; // Import tệp applocalization.dart
import 'ui/core/themes/theme.dart'; // Import tệp theme.dart
import 'ui/core/ui/scroll_behavior.dart'; // Import tệp scroll_behavior.dart
import 'ui/core/localization/locale_provider.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Phương thức main mặc định
void main() {
  // Khởi chạy cấu hình phát triển theo mặc định
  staging.main();
}

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Lỗi'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Constructor của MainApp

  @override
  Widget build(BuildContext context) {
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
      showErrorDialog(context, "Đã xảy ra lỗi: $e"); // Hiển thị hộp thoại lỗi
    }

    //lấy ra instance localeProvider hiện tại
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp.router(
      locale: localeProvider.locale, // Định nghĩa locale mặc định
      localizationsDelegates: [
        GlobalWidgetsLocalizations
            .delegate, // Định nghĩa các delegate cho đa ngôn ngữ
        GlobalMaterialLocalizations
            .delegate, // Định nghĩa các delegate cho đa ngôn ngữ
        AppLocalizationDelegate(), // Định nghĩa delegate cho localization của ứng dụng
      ],
      // Định nghĩa các locales được hỗ trợ
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('vi', ''), // Vietnamese
        const Locale('zh', ''), // Tiếng Trung
        const Locale('th', ''), // Tiếng Thái
      ],
      scrollBehavior:
          AppCustomScrollBehavior(), // Định nghĩa hành vi cuộn tùy chỉnh
      theme: AppTheme.greenTheme, // Định nghĩa theme sáng
      darkTheme: AppTheme.darkTheme, // Định nghĩa theme tối
      themeMode: ThemeMode.light, // Định nghĩa chế độ theme theo hệ thống
      routerConfig: router(context.read()), // Định nghĩa cấu hình router
      debugShowCheckedModeBanner: false, // Ẩn banner debug
    );
  }
}
