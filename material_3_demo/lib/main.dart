// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Import các package và file cần thiết
import 'package:flutter/material.dart';

import 'constants.dart';
import 'home.dart';

// Hàm main, điểm khởi đầu của ứng dụng
void main() async {
  runApp(const App()); // Khởi chạy ứng dụng với widget App
}

// Widget App chính, được định nghĩa là StatefulWidget để có thể thay đổi trạng thái
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState(); // Tạo state cho widget App
}

// Lớp quản lý trạng thái của App
class _AppState extends State<App> {
  bool useMaterial3 = true; // Biến điều khiển việc sử dụng Material 3
  ThemeMode themeMode =
      ThemeMode.system; // Chế độ giao diện mặc định theo hệ thống
  ColorSeed colorSelected = ColorSeed.baseColor; // Màu seed được chọn mặc định
  ColorImageProvider imageSelected =
      ColorImageProvider.leaves; // Hình ảnh được chọn mặc định
  ColorScheme? imageColorScheme =
      const ColorScheme.light(); // Bảng màu từ hình ảnh
  ColorSelectionMethod colorSelectionMethod =
      ColorSelectionMethod.colorSeed; // Phương thức chọn màu mặc định

  // Getter kiểm tra xem có đang sử dụng chế độ sáng hay không
  bool get useLightMode => switch (themeMode) {
    ThemeMode.system =>
      View.of(context).platformDispatcher.platformBrightness ==
          Brightness.light, // Nếu là hệ thống: kiểm tra độ sáng của nền tảng
    ThemeMode.light => true, // Nếu đã chọn chế độ sáng: trả về true
    ThemeMode.dark => false, // Nếu đã chọn chế độ tối: trả về false
  };

  // Xử lý sự kiện thay đổi độ sáng
  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode =
          useLightMode
              ? ThemeMode.light
              : ThemeMode.dark; // Cập nhật chế độ giao diện
    });
  }

  // Xử lý sự kiện thay đổi phiên bản Material
  void handleMaterialVersionChange() {
    setState(() {
      useMaterial3 = !useMaterial3; // Đảo ngược giá trị sử dụng Material 3
    });
  }

  // Xử lý sự kiện chọn màu
  void handleColorSelect(int value) {
    setState(() {
      colorSelectionMethod =
          ColorSelectionMethod.colorSeed; // Đặt phương thức chọn màu là seed
      colorSelected = ColorSeed.values[value]; // Cập nhật màu được chọn
    });
  }

  // Xử lý sự kiện chọn hình ảnh để tạo bảng màu
  void handleImageSelect(int value) {
    final String url =
        ColorImageProvider.values[value].url; // Lấy URL của hình ảnh được chọn
    ColorScheme.fromImageProvider(provider: NetworkImage(url)).then((
      newScheme,
    ) {
      setState(() {
        colorSelectionMethod =
            ColorSelectionMethod.image; // Đặt phương thức chọn màu là hình ảnh
        imageSelected =
            ColorImageProvider.values[value]; // Cập nhật hình ảnh được chọn
        imageColorScheme = newScheme; // Cập nhật bảng màu từ hình ảnh
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Ẩn biểu tượng debug ở góc
      title: 'Material 3', // Tiêu đề ứng dụng
      themeMode: themeMode, // Chế độ giao diện (sáng/tối/hệ thống)
      theme: ThemeData(
        colorSchemeSeed:
            colorSelectionMethod == ColorSelectionMethod.colorSeed
                ? colorSelected
                    .color // Sử dụng màu seed nếu phương thức là colorSeed
                : null,
        colorScheme:
            colorSelectionMethod == ColorSelectionMethod.image
                ? imageColorScheme // Sử dụng bảng màu từ hình ảnh nếu phương thức là image
                : null,
        useMaterial3: useMaterial3, // Sử dụng Material 3 hay không
        brightness: Brightness.light, // Độ sáng cho theme mặc định
      ),
      darkTheme: ThemeData(
        colorSchemeSeed:
            colorSelectionMethod == ColorSelectionMethod.colorSeed
                ? colorSelected
                    .color // Sử dụng màu seed nếu phương thức là colorSeed
                : imageColorScheme!
                    .primary, // Sử dụng màu chính từ bảng màu hình ảnh
        useMaterial3: useMaterial3, // Sử dụng Material 3 hay không
        brightness: Brightness.dark, // Độ sáng cho theme tối
      ),
      home: Home(
        // Widget chính của ứng dụng
        useLightMode: useLightMode, // Truyền thông tin về chế độ sáng/tối
        useMaterial3:
            useMaterial3, // Truyền thông tin về việc sử dụng Material 3
        colorSelected: colorSelected, // Truyền thông tin về màu được chọn
        imageSelected: imageSelected, // Truyền thông tin về hình ảnh được chọn
        handleBrightnessChange:
            handleBrightnessChange, // Hàm xử lý thay đổi độ sáng
        handleMaterialVersionChange:
            handleMaterialVersionChange, // Hàm xử lý thay đổi phiên bản Material
        handleColorSelect: handleColorSelect, // Hàm xử lý chọn màu
        handleImageSelect: handleImageSelect, // Hàm xử lý chọn hình ảnh
        colorSelectionMethod:
            colorSelectionMethod, // Phương thức chọn màu hiện tại
      ),
    );
  }
}
