// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/localization/applocalization.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/error_indicator.dart';
import '../view_models/activities_viewmodel.dart';
import 'activities_header.dart';
import 'activities_list.dart';
import 'activities_title.dart';
import 'activity_time_of_day.dart';

const String confirmButtonKey = 'confirm-button'; // Khóa cho nút xác nhận

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key, required this.viewModel});

  final ActivitiesViewModel viewModel; // ViewModel cho màn hình hoạt động

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.saveActivities.addListener(
      _onResult,
    ); // Thêm listener cho saveActivities
  }

  @override
  void didUpdateWidget(covariant ActivitiesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.saveActivities.removeListener(
      _onResult,
    ); // Xóa listener cũ
    widget.viewModel.saveActivities.addListener(_onResult); // Thêm listener mới
  }

  @override
  void dispose() {
    widget.viewModel.saveActivities.removeListener(
      _onResult,
    ); // Xóa listener khi dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Không cho phép pop
      onPopInvokedWithResult: (didPop, r) {
        if (!didPop)
          context.go(
            Routes.results,
          ); // Điều hướng đến kết quả nếu không pop được
      },
      child: Scaffold(
        body: ListenableBuilder(
          listenable:
              widget.viewModel.loadActivities, // Lắng nghe loadActivities
          builder: (context, child) {
            if (widget.viewModel.loadActivities.completed) {
              return child!; // Trả về child nếu loadActivities hoàn thành
            }
            return Column(
              children: [
                const ActivitiesHeader(), // Header của hoạt động
                if (widget.viewModel.loadActivities.running)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ), // Hiển thị vòng tròn tiến trình nếu đang chạy
                  ),
                if (widget.viewModel.loadActivities.error)
                  Expanded(
                    child: Center(
                      child: ErrorIndicator(
                        title:
                            AppLocalization.of(
                              context,
                            ).errorWhileLoadingActivities, // Tiêu đề lỗi
                        label:
                            AppLocalization.of(
                              context,
                            ).tryAgain, // Nhãn thử lại
                        onPressed:
                            widget
                                .viewModel
                                .loadActivities
                                .execute, // Hành động khi nhấn thử lại
                      ),
                    ),
                  ),
              ],
            );
          },
          child: ListenableBuilder(
            listenable: widget.viewModel, // Lắng nghe viewModel
            builder: (context, child) {
              return Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: ActivitiesHeader(),
                        ), // Header của hoạt động
                        ActivitiesTitle(
                          viewModel: widget.viewModel,
                          activityTimeOfDay:
                              ActivityTimeOfDay
                                  .daytime, // Tiêu đề hoạt động ban ngày
                        ),
                        ActivitiesList(
                          viewModel: widget.viewModel,
                          activityTimeOfDay:
                              ActivityTimeOfDay
                                  .daytime, // Danh sách hoạt động ban ngày
                        ),
                        ActivitiesTitle(
                          viewModel: widget.viewModel,
                          activityTimeOfDay:
                              ActivityTimeOfDay
                                  .evening, // Tiêu đề hoạt động buổi tối
                        ),
                        ActivitiesList(
                          viewModel: widget.viewModel,
                          activityTimeOfDay:
                              ActivityTimeOfDay
                                  .evening, // Danh sách hoạt động buổi tối
                        ),
                      ],
                    ),
                  ),
                  _BottomArea(viewModel: widget.viewModel), // Khu vực dưới cùng
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.saveActivities.completed) {
      widget.viewModel.saveActivities
          .clearResult(); // Xóa kết quả nếu saveActivities hoàn thành
      context.go(Routes.booking); // Điều hướng đến booking
    }

    if (widget.viewModel.saveActivities.error) {
      widget.viewModel.saveActivities
          .clearResult(); // Xóa kết quả nếu saveActivities lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalization.of(context).errorWhileSavingActivities,
          ), // Nội dung lỗi
          action: SnackBarAction(
            label: AppLocalization.of(context).tryAgain, // Nhãn thử lại
            onPressed:
                widget
                    .viewModel
                    .saveActivities
                    .execute, // Hành động khi nhấn thử lại
          ),
        ),
      );
    }
  }
}

class _BottomArea extends StatelessWidget {
  const _BottomArea({required this.viewModel});

  final ActivitiesViewModel viewModel; // ViewModel cho khu vực dưới cùng

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true, // Đảm bảo an toàn cho khu vực dưới cùng
      child: Material(
        elevation: 8, // Độ cao của Material
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimens.of(context).paddingScreenHorizontal, // Đệm trái
            right: Dimens.of(context).paddingScreenVertical, // Đệm phải
            top: Dimens.paddingVertical, // Đệm trên
            bottom: Dimens.of(context).paddingScreenVertical, // Đệm dưới
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween, // Căn giữa các phần tử theo chiều ngang
            children: [
              Text(
                AppLocalization.of(context).selected(
                  viewModel.selectedActivities.length,
                ), // Hiển thị số lượng hoạt động đã chọn
                style: Theme.of(context).textTheme.labelLarge, // Kiểu chữ
              ),
              FilledButton(
                key: const Key(confirmButtonKey), // Khóa cho nút xác nhận
                onPressed:
                    viewModel.selectedActivities.isNotEmpty
                        ? viewModel
                            .saveActivities
                            .execute // Hành động khi nhấn nút xác nhận
                        : null,
                child: Text(
                  AppLocalization.of(context).confirm,
                ), // Nhãn nút xác nhận
              ),
            ],
          ),
        ),
      ),
    );
  }
}
