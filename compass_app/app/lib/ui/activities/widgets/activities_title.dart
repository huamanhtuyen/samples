// Bản quyền 2024 thuộc về nhóm Flutter. Đã đăng ký bản quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';

import '../../core/localization/applocalization.dart';
import '../../core/themes/dimens.dart';
import '../view_models/activities_viewmodel.dart';
import 'activity_time_of_day.dart';

// Widget hiển thị tiêu đề của các hoạt động
class ActivitiesTitle extends StatelessWidget {
  const ActivitiesTitle({
    super.key,
    required this.activityTimeOfDay, // Thời gian trong ngày của hoạt động
    required this.viewModel, // ViewModel của hoạt động
  });

  final ActivitiesViewModel viewModel; // Biến lưu trữ ViewModel của hoạt động
  final ActivityTimeOfDay
  activityTimeOfDay; // Biến lưu trữ thời gian trong ngày của hoạt động

  @override
  Widget build(BuildContext context) {
    // Lấy danh sách hoạt động dựa trên thời gian trong ngày
    final list = switch (activityTimeOfDay) {
      ActivityTimeOfDay.daytime =>
        viewModel.daytimeActivities, // Hoạt động ban ngày
      ActivityTimeOfDay.evening =>
        viewModel.eveningActivities, // Hoạt động buổi tối
    };
    if (list.isEmpty) {
      // Nếu danh sách trống, trả về một widget trống
      return const SliverToBoxAdapter(child: SizedBox());
    }
    // Trả về widget hiển thị tiêu đề của hoạt động
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            Dimens.of(
              context,
            ).edgeInsetsScreenHorizontal, // Đặt khoảng cách lề ngang
        child: Text(_label(context)), // Hiển thị tiêu đề
      ),
    );
  }

  // Hàm lấy tiêu đề dựa trên thời gian trong ngày
  String _label(BuildContext context) => switch (activityTimeOfDay) {
    ActivityTimeOfDay.daytime =>
      AppLocalization.of(context).daytime, // Tiêu đề ban ngày
    ActivityTimeOfDay.evening =>
      AppLocalization.of(context).evening, // Tiêu đề buổi tối
  };
}
