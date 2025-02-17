// Bản quyền 2024 Nhóm Flutter. Đã đăng ký bản quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart'; // Nhập gói Flutter Material

import '../themes/colors.dart'; // Nhập tệp màu sắc từ thư mục themes

// Định nghĩa một widget StatelessWidget tên là ErrorIndicator
class ErrorIndicator extends StatelessWidget {
  // Hàm khởi tạo với các tham số bắt buộc
  const ErrorIndicator({
    super.key,
    required this.title, // Tiêu đề lỗi
    required this.label, // Nhãn nút
    required this.onPressed, // Hàm callback khi nút được nhấn
  });

  final String title; // Biến lưu trữ tiêu đề lỗi
  final String label; // Biến lưu trữ nhãn nút
  final VoidCallback onPressed; // Biến lưu trữ hàm callback

  @override
  Widget build(BuildContext context) {
    // Hàm build để xây dựng giao diện
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo trục chính
      crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo trục chéo
      children: [
        IntrinsicWidth(
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Đệm xung quanh
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline, // Biểu tượng lỗi
                    color:
                        Theme.of(context).colorScheme.onError, // Màu biểu tượng
                  ),
                  const SizedBox(
                    width: 10,
                  ), // Khoảng cách giữa biểu tượng và tiêu đề
                  Text(
                    title, // Hiển thị tiêu đề lỗi
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onError, // Màu chữ
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10), // Khoảng cách giữa tiêu đề và nút
        FilledButton(
          onPressed: onPressed, // Gán hàm callback cho sự kiện nhấn nút
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              AppColors.red1,
            ), // Màu nền nút
            foregroundColor: WidgetStatePropertyAll(
              Colors.white,
            ), // Màu chữ nút
          ),
          child: Text(label), // Hiển thị nhãn nút
        ),
      ],
    );
  }
}
