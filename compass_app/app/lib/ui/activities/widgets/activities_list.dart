// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart'; // Thư viện Flutter Material

import '../../core/themes/dimens.dart'; // Import các kích thước từ thư mục themes
import '../view_models/activities_viewmodel.dart'; // Import ViewModel của activities
import 'activity_entry.dart'; // Import widget ActivityEntry
import 'activity_time_of_day.dart'; // Import enum ActivityTimeOfDay

// Định nghĩa một StatelessWidget tên là ActivitiesList
class ActivitiesList extends StatelessWidget {
  const ActivitiesList({
    super.key, // Khóa siêu lớp
    required this.viewModel, // ViewModel bắt buộc
    required this.activityTimeOfDay, // Thời gian hoạt động trong ngày bắt buộc
  });

  final ActivitiesViewModel viewModel; // Khai báo biến viewModel
  final ActivityTimeOfDay activityTimeOfDay; // Khai báo biến activityTimeOfDay

  @override
  Widget build(BuildContext context) {
    // Lấy danh sách hoạt động dựa trên thời gian trong ngày
    final list = switch (activityTimeOfDay) {
      ActivityTimeOfDay.daytime =>
        viewModel.daytimeActivities, // Hoạt động ban ngày
      ActivityTimeOfDay.evening =>
        viewModel.eveningActivities, // Hoạt động buổi tối
    };
    return SliverPadding(
      padding: EdgeInsets.only(
        top: Dimens.paddingVertical, // Đệm trên
        left: Dimens.of(context).paddingScreenHorizontal, // Đệm trái
        right: Dimens.of(context).paddingScreenHorizontal, // Đệm phải
        bottom: Dimens.paddingVertical, // Đệm dưới
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final activity = list[index]; // Lấy hoạt động tại vị trí index
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < list.length - 1 ? 20 : 0,
            ), // Đệm dưới cho mỗi mục
            child: ActivityEntry(
              key: ValueKey(activity.ref), // Khóa duy nhất cho mỗi mục
              activity: activity, // Truyền hoạt động vào ActivityEntry
              selected: viewModel.selectedActivities.contains(
                activity.ref,
              ), // Kiểm tra xem hoạt động có được chọn không
              onChanged: (value) {
                if (value!) {
                  viewModel.addActivity(
                    activity.ref,
                  ); // Thêm hoạt động nếu được chọn
                } else {
                  viewModel.removeActivity(
                    activity.ref,
                  ); // Xóa hoạt động nếu bỏ chọn
                }
              },
            ),
          );
        }, childCount: list.length), // Số lượng mục trong danh sách
      ),
    );
  }
}
