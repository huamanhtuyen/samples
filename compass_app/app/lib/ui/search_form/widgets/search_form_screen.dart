// Bản quyền 2024 Đội Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/search_bar.dart';
import '../../results/widgets/results_screen.dart';
import '../view_models/search_form_viewmodel.dart';
import 'search_form_continent.dart';
import 'search_form_date.dart';
import 'search_form_guests.dart';
import 'search_form_submit.dart';

/// Màn hình biểu mẫu tìm kiếm
///
/// Hiển thị một biểu mẫu tìm kiếm với lựa chọn châu lục, ngày và khách.
/// Nhấn vào nút gửi sẽ mở màn hình [ResultsScreen]
/// truyền các tùy chọn tìm kiếm dưới dạng tham số truy vấn.
class SearchFormScreen extends StatelessWidget {
  const SearchFormScreen({super.key, required this.viewModel});

  final SearchFormViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Không cho phép quay lại
      canPop: false,
      // Khi cố gắng quay lại, nếu không thành công sẽ chuyển hướng về trang chủ
      onPopInvokedWithResult: (didPop, r) {
        if (!didPop) context.go(Routes.home);
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              top: true,
              bottom: false,
              child: Padding(
                padding: EdgeInsets.only(
                  top: Dimens.of(context).paddingScreenVertical,
                  left: Dimens.of(context).paddingScreenHorizontal,
                  right: Dimens.of(context).paddingScreenHorizontal,
                  bottom: Dimens.paddingVertical,
                ),
                // Thanh tìm kiếm của ứng dụng
                child: const AppSearchBar(),
              ),
            ),
            // Biểu mẫu lựa chọn châu lục
            SearchFormContinent(viewModel: viewModel),
            // Biểu mẫu lựa chọn ngày
            SearchFormDate(viewModel: viewModel),
            // Biểu mẫu lựa chọn số lượng khách
            SearchFormGuests(viewModel: viewModel),
            const Spacer(),
            // Nút gửi biểu mẫu
            SearchFormSubmit(viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
