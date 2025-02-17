// Bản quyền 2024 của nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD
// có trong tệp LICENSE.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/localization/applocalization.dart';
import '../../core/themes/dimens.dart';
import '../../results/widgets/results_screen.dart';
import '../view_models/search_form_viewmodel.dart';

const String searchFormSubmitButtonKey =
    'submit-button'; // Khóa cho nút gửi biểu mẫu tìm kiếm

/// Nút gửi biểu mẫu tìm kiếm
///
/// Nút sẽ bị vô hiệu hóa khi dữ liệu biểu mẫu chưa đầy đủ.
/// Khi được nhấn, nó sẽ điều hướng đến [ResultsScreen]
/// truyền các tùy chọn tìm kiếm dưới dạng tham số truy vấn.
class SearchFormSubmit extends StatefulWidget {
  const SearchFormSubmit({super.key, required this.viewModel});

  final SearchFormViewModel viewModel; // ViewModel của biểu mẫu tìm kiếm

  @override
  State<SearchFormSubmit> createState() => _SearchFormSubmitState();
}

class _SearchFormSubmitState extends State<SearchFormSubmit> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.updateItineraryConfig.addListener(
      _onResult,
    ); // Thêm listener cho updateItineraryConfig
  }

  @override
  void didUpdateWidget(covariant SearchFormSubmit oldWidget) {
    oldWidget.viewModel.updateItineraryConfig.removeListener(
      _onResult,
    ); // Xóa listener cũ
    widget.viewModel.updateItineraryConfig.addListener(
      _onResult,
    ); // Thêm listener mới
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.viewModel.updateItineraryConfig.removeListener(
      _onResult,
    ); // Xóa listener khi dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimens.paddingVertical,
        left: Dimens.of(context).paddingScreenHorizontal,
        right: Dimens.of(context).paddingScreenHorizontal,
        bottom: Dimens.of(context).paddingScreenVertical,
      ),
      child: ListenableBuilder(
        listenable: widget.viewModel,
        child: SizedBox(
          height: 52,
          child: Center(
            child: Text(AppLocalization.of(context).search),
          ), // Văn bản của nút
        ),
        builder: (context, child) {
          return FilledButton(
            key: const ValueKey(searchFormSubmitButtonKey),
            onPressed:
                widget.viewModel.valid
                    ? widget
                        .viewModel
                        .updateItineraryConfig
                        .execute // Thực thi khi biểu mẫu hợp lệ
                    : null,
            child: child,
          );
        },
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.updateItineraryConfig.completed) {
      widget.viewModel.updateItineraryConfig
          .clearResult(); // Xóa kết quả sau khi hoàn thành
      context.go(Routes.results); // Điều hướng đến màn hình kết quả
    }

    if (widget.viewModel.updateItineraryConfig.error) {
      widget.viewModel.updateItineraryConfig
          .clearResult(); // Xóa kết quả sau khi có lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalization.of(context).errorWhileSavingItinerary,
          ), // Hiển thị thông báo lỗi
          action: SnackBarAction(
            label:
                AppLocalization.of(
                  context,
                ).tryAgain, // Nhãn cho hành động thử lại
            onPressed:
                widget
                    .viewModel
                    .updateItineraryConfig
                    .execute, // Thực thi lại khi nhấn thử lại
          ),
        ),
      );
    }
  }
}
