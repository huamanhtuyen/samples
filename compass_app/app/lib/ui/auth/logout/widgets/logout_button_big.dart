// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';

import '../../../core/localization/applocalization.dart';
//import '../../../core/themes/colors.dart';
import '../view_models/logout_viewmodel.dart';

// Định nghĩa một widget có trạng thái tên là LogoutButton
class LogoutButtonBig extends StatefulWidget {
  const LogoutButtonBig({super.key, required this.viewModel});

  final LogoutViewModel viewModel;

  @override
  State<LogoutButtonBig> createState() => _LogoutButtonState();
}

// Định nghĩa trạng thái của widget LogoutButton
class _LogoutButtonState extends State<LogoutButtonBig> {
  @override
  void initState() {
    super.initState();
    // Thêm listener cho sự kiện logout của viewModel
    widget.viewModel.logout.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LogoutButtonBig oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Loại bỏ listener cũ và thêm listener mới khi widget được cập nhật
    oldWidget.viewModel.logout.removeListener(_onResult);
    widget.viewModel.logout.addListener(_onResult);
  }

  @override
  void dispose() {
    // Loại bỏ listener khi widget bị hủy
    widget.viewModel.logout.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          widget.viewModel.logout
              .execute(); // Thực hiện hành động logout khi nhấn nút
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          textStyle: Theme.of(context).textTheme.titleSmall,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // Bo góc nút
          ),
          elevation: 0, // Loại bỏ bóng đổ để phù hợp với Material Design 3
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.logout, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Text('Đăng xuất'),
          ],
        ),
      ),
    );
  }

  void _onResult() {
    // Không cần điều hướng đến `/login` khi logout,
    // điều này được thực hiện tự động bởi GoRouter.

    if (widget.viewModel.logout.error) {
      widget.viewModel.logout.clearResult(); // Xóa kết quả lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalization.of(context).errorWhileLogout,
          ), // Hiển thị thông báo lỗi
          action: SnackBarAction(
            label: AppLocalization.of(context).tryAgain, // Nút thử lại
            onPressed:
                widget
                    .viewModel
                    .logout
                    .execute, // Thực hiện lại hành động logout khi nhấn nút
          ),
        ),
      );
    }
  }
}
