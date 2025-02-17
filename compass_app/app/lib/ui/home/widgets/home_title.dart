// Bản quyền 2024 của nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart'; // Thư viện Flutter Material
import 'package:google_fonts/google_fonts.dart'; // Thư viện Google Fonts
import 'package:provider/provider.dart'; // Thư viện Provider

import '../../auth/logout/view_models/logout_viewmodel.dart'; // Import ViewModel cho chức năng đăng xuất
import '../../auth/logout/widgets/logout_button.dart'; // Import nút đăng xuất
import '../../core/localization/applocalization.dart'; // Import localization
import '../../core/themes/dimens.dart'; // Import các kích thước giao diện
import '../view_models/home_viewmodel.dart'; // Import ViewModel cho màn hình chính

class HomeHeader extends StatelessWidget {
  // Định nghĩa một StatelessWidget tên là HomeHeader
  const HomeHeader({
    super.key,
    required this.viewModel,
  }); // Constructor với tham số viewModel

  final HomeViewModel viewModel; // Khai báo biến viewModel kiểu HomeViewModel

  @override
  Widget build(BuildContext context) {
    // Phương thức build để xây dựng giao diện
    final user = viewModel.user; // Lấy thông tin người dùng từ viewModel
    if (user == null) {
      // Nếu người dùng không tồn tại
      return const SizedBox(); // Trả về một SizedBox rỗng
    }
    return Column(
      // Trả về một cột chứa các widget con
      crossAxisAlignment:
          CrossAxisAlignment
              .stretch, // Căn chỉnh các widget con theo chiều ngang
      children: [
        Row(
          // Hàng chứa ảnh đại diện và nút đăng xuất
          mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween, // Căn chỉnh các widget con cách đều nhau
          crossAxisAlignment:
              CrossAxisAlignment
                  .start, // Căn chỉnh các widget con theo chiều dọc
          children: [
            ClipOval(
              // Widget để cắt ảnh thành hình oval
              child: Image.asset(
                // Hiển thị ảnh đại diện người dùng
                user.picture, // Đường dẫn ảnh
                width: Dimens.of(context).profilePictureSize, // Chiều rộng ảnh
                height: Dimens.of(context).profilePictureSize, // Chiều cao ảnh
              ),
            ),
            LogoutButton(
              // Nút đăng xuất
              viewModel: LogoutViewModel(
                // Khởi tạo LogoutViewModel
                authRepository: context.read(), // Lấy authRepository từ context
                itineraryConfigRepository:
                    context.read(), // Lấy itineraryConfigRepository từ context
              ),
            ),
          ],
        ),
        const SizedBox(
          height: Dimens.paddingVertical,
        ), // Khoảng cách giữa các widget
        _Title(
          text: AppLocalization.of(context).nameTrips(user.name),
        ), // Tiêu đề chứa tên người dùng
      ],
    );
  }
}

class _Title extends StatelessWidget {
  // Định nghĩa một StatelessWidget tên là _Title
  const _Title({required this.text}); // Constructor với tham số text

  final String text; // Khai báo biến text kiểu String

  @override
  Widget build(BuildContext context) {
    // Phương thức build để xây dựng giao diện
    return ShaderMask(
      // Widget để áp dụng hiệu ứng shader
      blendMode: BlendMode.srcIn, // Chế độ hòa trộn
      shaderCallback:
          (bounds) => RadialGradient(
            // Tạo hiệu ứng gradient
            center: Alignment.bottomLeft, // Tâm của gradient
            radius: 2, // Bán kính của gradient
            colors: [
              Colors.purple.shade700,
              Colors.purple.shade400,
            ], // Màu sắc của gradient
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ), // Tạo shader từ gradient
      child: Text(
        // Hiển thị văn bản
        text,
        style: GoogleFonts.rubik(
          // Áp dụng font Rubik từ Google Fonts
          textStyle:
              Theme.of(
                context,
              ).textTheme.headlineLarge, // Áp dụng kiểu chữ từ theme
        ),
      ),
    );
  }
}
