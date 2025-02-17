// Copyright 2024 The Flutter team. All rights reserved.
// Sử dụng mã nguồn này được điều chỉnh bởi giấy phép BSD-style có thể
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';

// Lớp trừu tượng chứa các màu sắc sử dụng trong ứng dụng
abstract final class AppColors {
  // Định nghĩa màu đen với mã màu hex
  static const black1 = Color(0xFF101010);
  // Định nghĩa màu trắng với mã màu hex
  static const white1 = Color(0xFFFFF7FA);
  // Định nghĩa màu xám nhạt với mã màu hex
  static const grey1 = Color(0xFFF2F2F2);
  // Định nghĩa màu xám đậm với mã màu hex
  static const grey2 = Color(0xFF4D4D4D);
  // Định nghĩa màu xám trung bình với mã màu hex
  static const grey3 = Color(0xFFA4A4A4);
  // Định nghĩa màu trắng trong suốt với mã màu hex
  static const whiteTransparent = Color(
    0x4DFFFFFF,
  ); // Figma rgba(255, 255, 255, 0.3)
  // Định nghĩa màu đen trong suốt với mã màu hex
  static const blackTransparent = Color(0x4D000000);
  // Định nghĩa màu đỏ với mã màu hex
  static const red1 = Color(0xFFE74C3C);

  // Định nghĩa bảng màu cho giao diện sáng
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light, // Độ sáng của giao diện
    primary: AppColors.black1, // Màu chính
    onPrimary: AppColors.white1, // Màu chữ trên màu chính
    secondary: AppColors.black1, // Màu phụ
    onSecondary: AppColors.white1, // Màu chữ trên màu phụ
    surface: Colors.white, // Màu bề mặt
    onSurface: AppColors.black1, // Màu chữ trên bề mặt
    error: Colors.white, // Màu lỗi
    onError: Colors.red, // Màu chữ trên màu lỗi
  );

  // Định nghĩa bảng màu cho giao diện tối
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark, // Độ sáng của giao diện
    primary: AppColors.white1, // Màu chính
    onPrimary: AppColors.black1, // Màu chữ trên màu chính
    secondary: AppColors.white1, // Màu phụ
    onSecondary: AppColors.black1, // Màu chữ trên màu phụ
    surface: AppColors.black1, // Màu bề mặt
    onSurface: Colors.white, // Màu chữ trên bề mặt
    error: Colors.black, // Màu lỗi
    onError: AppColors.red1, // Màu chữ trên màu lỗi
  );
}
