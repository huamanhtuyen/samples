// Bản quyền 2024 của nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart'; // Nhập gói Material của Flutter

import '../ui/tag_chip.dart'; // Nhập tệp tag_chip.dart từ thư mục ui
import 'colors.dart'; // Nhập tệp colors.dart

// Lớp trừu tượng không thể kế thừa AppTheme
abstract final class AppTheme {
  // Định nghĩa một TextTheme tĩnh
  static const _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ), // Kiểu chữ lớn cho tiêu đề
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ), // Kiểu chữ nhỏ cho tiêu đề
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ), // Kiểu chữ trung bình cho tiêu đề
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ), // Kiểu chữ lớn cho nội dung
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ), // Kiểu chữ trung bình cho nội dung
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3, // Màu xám cho kiểu chữ nhỏ
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.grey3, // Màu xám cho nhãn nhỏ
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3, // Màu xám cho nhãn lớn
    ),
  );

  // Định nghĩa một InputDecorationTheme tĩnh
  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      // Màu xám phù hợp cho cả chủ đề sáng và tối
      color: AppColors.grey3,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
  );

  // Định nghĩa một ThemeData cho chủ đề sáng
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light, // Độ sáng của chủ đề
    colorScheme: AppColors.lightColorScheme, // Bảng màu cho chủ đề sáng
    textTheme: _textTheme, // Áp dụng TextTheme đã định nghĩa
    inputDecorationTheme:
        _inputDecorationTheme, // Áp dụng InputDecorationTheme đã định nghĩa
    extensions: [
      TagChipTheme(
        chipColor: AppColors.whiteTransparent, // Màu nền cho chip
        onChipColor: Colors.white, // Màu chữ trên chip
      ),
    ],
  );

  // Định nghĩa một ThemeData cho chủ đề tối
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, // Độ tối của chủ đề
    colorScheme: AppColors.darkColorScheme, // Bảng màu cho chủ đề tối
    textTheme: _textTheme, // Áp dụng TextTheme đã định nghĩa
    inputDecorationTheme:
        _inputDecorationTheme, // Áp dụng InputDecorationTheme đã định nghĩa
    extensions: [
      TagChipTheme(
        chipColor: AppColors.blackTransparent, // Màu nền cho chip
        onChipColor: Colors.white, // Màu chữ trên chip
      ),
    ],
  );
}
