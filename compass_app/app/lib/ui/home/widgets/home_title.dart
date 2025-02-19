import 'package:flutter/material.dart'; // Thư viện Flutter Material
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart'; // Thư viện Provider

import '../../../../routing/routes.dart';

import '../../auth/logout/view_models/logout_viewmodel.dart'; // Import ViewModel cho chức năng đăng xuất

import '../../auth/logout/widgets/logout_button.dart'; // Import nút đăng xuất

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
    return Column(
      // Trả về một cột chứa các widget con
      crossAxisAlignment:
          CrossAxisAlignment
              .stretch, // Căn chỉnh các widget con theo chiều ngang
      children: [
        Row(
          // Hàng chứa ảnh đại diện và nút đăng xuất
          //MainAxis là chiều dài của row
          mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween, // Căn chỉnh các widget con cách đều nhau
          //CrossAxis là chiều ngắn của row
          crossAxisAlignment:
              CrossAxisAlignment
                  .start, // Căn chỉnh các widget con theo chiều dọc của màn hình
          children: [
            //App logo
            SvgPicture.asset(
              'assets/logo.svg', // Đường dẫn ảnh logo SVG
              width: Dimens.of(context).profilePictureSize, // Chiều rộng logo
              height: 40, // Chiều cao logo
            ),
            //Nút menu
            IconButton(
              icon: Icon(
                Icons.menu,
                //size: Dimens.of(context).profilePictureSize,
                size: 40,
              ),
              padding:
                  EdgeInsets.zero, // Loại bỏ padding mặc định của IconButton
              onPressed: () {
                context.go(Routes.profile);
              },
            ),
            //Nút menu
            IconButton(
              icon: Icon(
                Icons.menu,
                size: Dimens.of(context).profilePictureSize,
                //size: 40,
              ),
              padding:
                  EdgeInsets.zero, // Loại bỏ padding mặc định của IconButton
              onPressed: () {
                context.go(Routes.profile);
              },
            ),
          ],
        ),
        //padding khoảng cách với header
        const SizedBox(
          height: Dimens.paddingVertical,
        ), // Khoảng cách giữa các widget
      ],
    );
  }
}
