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
import 'error_app.dart';
//

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

// ErrorApp has been moved to main_staging.dart

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    //cấu hình mapbox
    final accessToken = const String.fromEnvironment(
      "ACCESS_TOKEN",
      defaultValue: "",
    );

    // Check for errors that would prevent app initialization
    if (accessToken.isEmpty) {
      return const ErrorApp(errorMessage: "THIẾU Mapbox Access Token!");
    }

    // Move MapboxOptions configuration to a try-catch and handle errors
    try {
      MapboxOptions.setAccessToken(accessToken);
    } catch (e, stackTrace) {
      debugPrint("🔥 Exception: $e");
      debugPrint("📌 StackTrace: $stackTrace");
      // Return the ErrorApp instead of showing dialog
      return ErrorApp(errorMessage: "Lỗi cấu hình Mapbox: $e");
    }

    //lấy ra instance localeProvider hiện tại
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp.router(
      locale: localeProvider.locale,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        AppLocalizationDelegate(),
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('vi', ''), // Vietnamese
        const Locale('zh', ''), // Tiếng Trung
        const Locale('th', ''), // Tiếng Thái
      ],
      scrollBehavior: AppCustomScrollBehavior(),
      theme: AppTheme.greenTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: router(context.read()),
      debugShowCheckedModeBanner: false,
    );
  }
}
