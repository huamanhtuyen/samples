// Bản quyền 2024 thuộc về nhóm Flutter. Đã đăng ký bản quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart'; // Thư viện Flutter Material
import 'package:go_router/go_router.dart'; // Thư viện điều hướng GoRouter

import '../../../routing/routes.dart'; // Đường dẫn điều hướng
import '../../core/localization/applocalization.dart'; // Đa ngôn ngữ
import '../../core/themes/dimens.dart'; // Kích thước giao diện
import '../../core/ui/back_button.dart'; // Nút quay lại tùy chỉnh
import '../../core/ui/home_button.dart'; // Nút trang chủ tùy chỉnh

class ActivitiesHeader extends StatelessWidget {
  // Định nghĩa lớp ActivitiesHeader kế thừa StatelessWidget
  const ActivitiesHeader({super.key}); // Hàm khởi tạo

  @override
  Widget build(BuildContext context) {
    // Hàm xây dựng giao diện
    return SafeArea(
      // Đảm bảo giao diện không bị che khuất bởi các phần tử hệ thống
      top: true, // Bảo vệ phía trên
      bottom: false, // Không bảo vệ phía dưới
      child: Padding(
        // Thêm khoảng đệm xung quanh
        padding: EdgeInsets.only(
          // Chỉ định khoảng đệm
          left:
              Dimens.of(context).paddingScreenHorizontal, // Khoảng đệm bên trái
          right:
              Dimens.of(context).paddingScreenHorizontal, // Khoảng đệm bên phải
          top: Dimens.of(context).paddingScreenVertical, // Khoảng đệm phía trên
          bottom: Dimens.paddingVertical, // Khoảng đệm phía dưới
        ),
        child: Row(
          // Sử dụng Row để xếp các phần tử theo hàng ngang
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Căn đều các phần tử
          children: [
            CustomBackButton(
              // Nút quay lại tùy chỉnh
              onTap: () {
                // Hành động khi nhấn nút
                // Điều hướng đến màn hình kết quả và chỉnh sửa tìm kiếm
                context.go(Routes.results);
              },
            ),
            Text(
              // Hiển thị tiêu đề
              AppLocalization.of(
                context,
              ).activities, // Lấy chuỗi "activities" từ đa ngôn ngữ
              style:
                  Theme.of(
                    context,
                  ).textTheme.titleLarge, // Áp dụng kiểu chữ tiêu đề lớn
            ),
            const HomeButton(), // Nút trang chủ cố định
          ],
        ),
      ),
    );
  }
}
