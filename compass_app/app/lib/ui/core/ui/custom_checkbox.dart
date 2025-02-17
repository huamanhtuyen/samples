// Copyright 2024 The Flutter team. All rights reserved.
// Sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart'; // Import thư viện Flutter Material

import '../themes/colors.dart'; // Import tệp màu sắc từ thư mục themes

class CustomCheckbox extends StatelessWidget {
  // Định nghĩa lớp CustomCheckbox kế thừa từ StatelessWidget
  const CustomCheckbox({
    super.key,
    required this.value, // Giá trị của checkbox (đã chọn hay chưa)
    required this.onChanged, // Hàm callback khi giá trị thay đổi
  });

  final bool value; // Biến lưu trữ giá trị của checkbox
  final ValueChanged<bool?>
  onChanged; // Biến lưu trữ hàm callback khi giá trị thay đổi

  @override
  Widget build(BuildContext context) {
    // Phương thức build để xây dựng giao diện
    return InkResponse(
      radius: 24, // Bán kính của hiệu ứng nhấn
      onTap:
          () => onChanged(
            !value,
          ), // Gọi hàm onChanged với giá trị ngược lại khi nhấn
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), // Bo góc cho hộp
          border: Border.all(color: AppColors.grey3), // Đường viền màu xám
        ),
        child: Material(
          borderRadius: BorderRadius.circular(24), // Bo góc cho Material
          color:
              value // Nếu checkbox được chọn
                  ? Theme.of(context)
                      .colorScheme
                      .primary // Màu nền là màu chính của theme
                  : Colors.transparent, // Nếu không thì màu nền trong suốt
          child: SizedBox(
            width: 24, // Chiều rộng của checkbox
            height: 24, // Chiều cao của checkbox
            child: Visibility(
              visible: value, // Hiển thị icon nếu checkbox được chọn
              child: Icon(
                Icons.check, // Icon dấu check
                size: 14, // Kích thước icon
                color: Theme.of(context).colorScheme.onPrimary, // Màu của icon
              ),
            ),
          ),
        ),
      ),
    );
  }
}
