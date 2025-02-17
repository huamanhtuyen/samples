// Bản quyền 2024 Nhóm Flutter. Đã đăng ký bản quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';

import '../../core/localization/applocalization.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/date_format_start_end.dart';
import '../view_models/search_form_viewmodel.dart';

/// Trường chọn ngày.
///
/// Mở hộp thoại chọn phạm vi ngày khi được nhấn.
class SearchFormDate extends StatelessWidget {
  const SearchFormDate({super.key, required this.viewModel});

  final SearchFormViewModel
  viewModel; // ViewModel để quản lý trạng thái của form

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimens.paddingVertical, // Khoảng cách trên
        left: Dimens.of(context).paddingScreenHorizontal, // Khoảng cách trái
        right: Dimens.of(context).paddingScreenHorizontal, // Khoảng cách phải
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0), // Bo góc cho InkWell
        onTap: () {
          showDateRangePicker(
            context: context,
            firstDate: DateTime.now(), // Ngày bắt đầu
            lastDate: DateTime.now().add(
              const Duration(days: 365),
            ), // Ngày kết thúc
          ).then(
            (dateRange) => viewModel.dateRange = dateRange,
          ); // Cập nhật phạm vi ngày trong ViewModel
        },
        child: Container(
          height: 64, // Chiều cao của Container
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey1), // Viền màu xám
            borderRadius: BorderRadius.circular(16.0), // Bo góc cho Container
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingHorizontal, // Khoảng cách ngang
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween, // Căn giữa và giãn đều các phần tử
              children: [
                Text(
                  AppLocalization.of(context).when, // Văn bản "Khi nào"
                  style:
                      Theme.of(
                        context,
                      ).textTheme.titleMedium, // Kiểu chữ tiêu đề trung bình
                ),
                ListenableBuilder(
                  listenable: viewModel, // Lắng nghe thay đổi từ ViewModel
                  builder: (context, _) {
                    final dateRange =
                        viewModel.dateRange; // Lấy phạm vi ngày từ ViewModel
                    if (dateRange != null) {
                      return Text(
                        dateFormatStartEnd(
                          dateRange,
                        ), // Định dạng và hiển thị phạm vi ngày
                        style:
                            Theme.of(
                              context,
                            ).textTheme.bodyLarge, // Kiểu chữ lớn
                      );
                    } else {
                      return Text(
                        AppLocalization.of(
                          context,
                        ).addDates, // Văn bản "Thêm ngày"
                        style:
                            Theme.of(
                              context,
                            ).inputDecorationTheme.hintStyle, // Kiểu chữ gợi ý
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
