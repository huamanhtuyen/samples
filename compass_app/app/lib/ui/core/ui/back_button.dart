// Bản quyền 2024 Đội Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../themes/colors.dart';
import 'blur_filter.dart';

/// Nút quay lại tùy chỉnh để quay lại điều hướng.
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onTap, this.blur = false});

  final bool blur; // Biến để xác định có làm mờ nền hay không.
  final GestureTapCallback? onTap; // Hàm callback khi nhấn nút.

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0, // Chiều cao của nút.
      width: 40.0, // Chiều rộng của nút.
      child: Stack(
        children: [
          if (blur) // Nếu blur là true thì làm mờ nền.
            ClipRect(
              child: BackdropFilter(
                filter: kBlurFilter, // Áp dụng bộ lọc làm mờ.
                child: const SizedBox(height: 40.0, width: 40.0),
              ),
            ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey1), // Viền màu xám.
              borderRadius: BorderRadius.circular(8.0), // Bo góc viền.
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(
                8.0,
              ), // Bo góc cho hiệu ứng nhấn.
              onTap: () {
                if (onTap != null) {
                  onTap!(); // Gọi hàm callback nếu có.
                } else {
                  context.pop(); // Quay lại trang trước đó.
                }
              },
              child: Center(
                child: Icon(
                  size: 24.0, // Kích thước icon.
                  Icons.arrow_back, // Icon mũi tên quay lại.
                  color:
                      Theme.of(context).colorScheme.onSurface, // Màu của icon.
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
