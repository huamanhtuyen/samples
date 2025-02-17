// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';

import '../../../core/localization/applocalization.dart';
import '../../../core/themes/colors.dart';
import '../view_models/logout_viewmodel.dart';

// Định nghĩa một widget có trạng thái tên là LogoutButton
class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key, required this.viewModel});

  final LogoutViewModel viewModel;

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

// Định nghĩa trạng thái của widget LogoutButton
class _LogoutButtonState extends State<LogoutButton> {
  @override
  void initState() {
    super.initState();
    // Thêm listener cho sự kiện logout của viewModel
    widget.viewModel.logout.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LogoutButton oldWidget) {
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
      height: 40.0,
      width: 40.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey1), // Đặt viền cho nút
          borderRadius: BorderRadius.circular(8.0), // Bo tròn các góc
          color: Colors.transparent, // Màu nền trong suốt
        ),
        child: InkResponse(
          borderRadius: BorderRadius.circular(
            8.0,
          ), // Bo tròn các góc cho hiệu ứng nhấn
          onTap: () {
            widget.viewModel.logout
                .execute(); // Thực hiện hành động logout khi nhấn nút
          },
          child: Center(
            child: Icon(
              size: 24.0,
              Icons.logout, // Biểu tượng logout
              color:
                  Theme.of(context).colorScheme.onSurface, // Màu của biểu tượng
            ),
          ),
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
