// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../view_models/search_form_viewmodel.dart';

const String removeGuestsKey =
    'remove-guests'; // Khóa cho nút giảm số lượng khách
const String addGuestsKey = 'add-guests'; // Khóa cho nút tăng số lượng khách

/// Biểu mẫu chọn số lượng khách
///
/// Người dùng có thể nhấn vào các biểu tượng Plus và Minus để tăng hoặc giảm
/// số lượng khách.
class SearchFormGuests extends StatelessWidget {
  const SearchFormGuests({
    super.key,
    required this.viewModel,
  }); // Hàm khởi tạo với viewModel bắt buộc

  final SearchFormViewModel viewModel; // Biến viewModel để quản lý trạng thái

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimens.paddingVertical, // Khoảng cách trên
        left: Dimens.of(context).paddingScreenHorizontal, // Khoảng cách trái
        right: Dimens.of(context).paddingScreenHorizontal, // Khoảng cách phải
      ),
      child: Container(
        height: 64, // Chiều cao của container
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey1), // Viền màu xám
          borderRadius: BorderRadius.circular(16.0), // Bo góc
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.paddingHorizontal, // Khoảng cách ngang
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween, // Căn giữa và chia đều khoảng cách
            children: [
              Text(
                'Who',
                style: Theme.of(context).textTheme.titleMedium,
              ), // Tiêu đề "Who"
              _QuantitySelector(viewModel), // Bộ chọn số lượng khách
            ],
          ),
        ),
      ),
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  const _QuantitySelector(
    this.viewModel,
  ); // Hàm khởi tạo với viewModel bắt buộc

  final SearchFormViewModel viewModel; // Biến viewModel để quản lý trạng thái

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90, // Chiều rộng của SizedBox
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Căn giữa và chia đều khoảng cách
        children: [
          InkWell(
            key: const ValueKey(
              removeGuestsKey,
            ), // Khóa cho nút giảm số lượng khách
            onTap: () {
              viewModel.guests--; // Giảm số lượng khách
            },
            child: const Icon(
              Icons.remove_circle_outline, // Biểu tượng giảm
              color: AppColors.grey3, // Màu xám
            ),
          ),
          ListenableBuilder(
            listenable: viewModel, // Lắng nghe thay đổi từ viewModel
            builder:
                (context, _) => Text(
                  viewModel.guests.toString(), // Hiển thị số lượng khách
                  style:
                      viewModel.guests == 0
                          ? Theme.of(context)
                              .inputDecorationTheme
                              .hintStyle // Kiểu chữ khi số lượng khách là 0
                          : Theme.of(context)
                              .textTheme
                              .bodyMedium, // Kiểu chữ khi số lượng khách lớn hơn 0
                ),
          ),
          InkWell(
            key: const ValueKey(
              addGuestsKey,
            ), // Khóa cho nút tăng số lượng khách
            onTap: () {
              viewModel.guests++; // Tăng số lượng khách
            },
            child: const Icon(
              Icons.add_circle_outline,
              color: AppColors.grey3,
            ), // Biểu tượng tăng
          ),
        ],
      ),
    );
  }
}
