// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'routing/router.dart';
import 'ui/core/localization/applocalization.dart';
import 'ui/core/themes/theme.dart';
import 'ui/core/ui/scroll_behavior.dart';
import 'ui/core/localization/locale_provider.dart';
import 'config/dependencies.dart';
import 'error_app.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Phương thức main mặc định
void main() async {
  Logger.root.level = Level.ALL; // Đặt mức độ ghi log là ALL
  final log = Logger('MainApplication'); // Biến lưu trữ đối tượng Logger

  WidgetsFlutterBinding.ensureInitialized();

  // Kiểm tra kết nối internet
  try {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.isEmpty ||
        connectivity.contains(ConnectivityResult.none)) {
      log.severe("Không có kết nối internet");
      runApp(
        ErrorApp(
          errorMessage: "Vui lòng kết nối internet để sử dụng ứng dụng.",
          canRetry: true,
        ),
      );
      return; // Dừng việc khởi tạo ứng dụng nếu không có kết nối
    } else {
      log.info("Đã kết nối internet: ${connectivity.toString()}");
    }
  } catch (e) {
    log.warning("Không thể kiểm tra kết nối internet: $e");
    // Không thể kiểm tra kết nối internet, hiển thị thông báo lỗi
    runApp(
      ErrorApp(
        errorMessage: "Không thể kiểm tra kết nối internet: $e",
        canRetry: true,
      ),
    );
    return; // Dừng việc khởi tạo ứng dụng nếu không có kết nối
  }

  // Cấu hình firebase
  try {
    await Firebase.initializeApp();
    final messaging = FirebaseMessaging.instance; //FirebaseMessaging

    // Lấy token của thiết bị
    //Ghi nhớ: token này sẽ được dùng để gửi thông báo đến thiết bị.
    try {
      final token = await messaging.getToken();
      log.info("FCM Token: $token");
    } catch (e) {
      log.severe("Lỗi khi lấy token: $e");

      String errorMessage;
      if (e.toString().contains("MISSING_INSTANCEID_SERVICE")) {
        errorMessage =
            "Thiết bị của bạn thiếu Google Play Services. Bạn cần phải thoát ứng dụng và cài đặt Google Play Services để sử dụng ứng dụng.";
      } else {
        errorMessage = "Lỗi khi khởi tạo dịch vụ thông báo: $e";
      }

      // Hiển thị ErrorApp thay vì chỉ lưu lỗi
      runApp(ErrorApp(errorMessage: errorMessage, canRetry: false));
      return; // Dừng việc khởi tạo ứng dụng
    }

    // Xử lý khi nhận notification trong foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log.info("Nhận thông báo: ${message.notification?.title}");
    });
  } catch (e) {
    log.severe("Lỗi khi khởi tạo Firebase: $e");
    runApp(
      ErrorApp(
        errorMessage: "Không thể khởi tạo Firebase: $e",
        canRetry: false,
      ),
    );
    return;
  }
  //Hết cấu hình firebase

  //Khởi tạo kết nối đến supabase
  try {
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
  } catch (e) {
    log.severe("Lỗi khi khởi tạo Supabase: $e");
    runApp(
      ErrorApp(
        errorMessage: "Không thể kết nối đến cơ sở dữ liệu hệ thống: $e",
        canRetry: true,
      ),
    );
    return;
  }

  //Khởi tạo Mapbox
  try {
    //cấu hình mapbox
    final accessToken = const String.fromEnvironment(
      "ACCESS_TOKEN",
      defaultValue: "",
    );

    // Check for errors that would prevent app initialization
    if (accessToken.isEmpty) {
      runApp(
        ErrorApp(errorMessage: "THIẾU Mapbox Access Token!", canRetry: true),
      );
      return;
    }

    // Move MapboxOptions configuration to a try-catch and handle errors
    MapboxOptions.setAccessToken(accessToken);
  } catch (e) {
    log.severe("Lỗi khi khởi tạo Mapbox: $e");
    runApp(
      ErrorApp(errorMessage: "Lỗi khi khởi tạo Mapbox: $e", canRetry: true),
    );
    return;
  }

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
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
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
