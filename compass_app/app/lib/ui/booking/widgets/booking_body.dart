// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/activity/activity.dart';
import '../../../utils/image_error_listener.dart';
import '../../core/themes/dimens.dart';
import '../view_models/booking_viewmodel.dart';
import 'booking_header.dart';

// Widget BookingBody là một StatelessWidget
class BookingBody extends StatelessWidget {
  // Constructor của BookingBody, nhận vào một BookingViewModel
  const BookingBody({super.key, required this.viewModel});

  // Biến viewModel để lưu trữ BookingViewModel
  final BookingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    // Sử dụng ListenableBuilder để lắng nghe thay đổi từ viewModel
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        // Lấy thông tin booking từ viewModel
        final booking = viewModel.booking;
        // Nếu booking là null thì trả về một SizedBox rỗng
        if (booking == null) return const SizedBox();
        // Sử dụng CustomScrollView để hiển thị nội dung
        return CustomScrollView(
          slivers: [
            // Hiển thị BookingHeader
            SliverToBoxAdapter(child: BookingHeader(booking: booking)),
            // Hiển thị danh sách các activity
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                // Lấy activity tại vị trí index
                final activity = booking.activity[index];
                // Trả về widget _Activity
                return _Activity(activity: activity);
              }, childCount: booking.activity.length),
            ),
            // Thêm khoảng trống ở cuối danh sách
            const SliverToBoxAdapter(child: SizedBox(height: 200)),
          ],
        );
      },
    );
  }
}

// Widget _Activity là một StatelessWidget
class _Activity extends StatelessWidget {
  // Constructor của _Activity, nhận vào một Activity
  const _Activity({required this.activity});

  // Biến activity để lưu trữ Activity
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    // Sử dụng Padding để tạo khoảng cách xung quanh widget
    return Padding(
      padding: EdgeInsets.only(
        top: Dimens.paddingVertical,
        left: Dimens.of(context).paddingScreenHorizontal,
        right: Dimens.of(context).paddingScreenHorizontal,
      ),
      // Sử dụng Row để hiển thị hình ảnh và thông tin activity
      child: Row(
        children: [
          // Sử dụng ClipRRect để bo góc hình ảnh
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            // Sử dụng CachedNetworkImage để hiển thị hình ảnh từ URL
            child: CachedNetworkImage(
              imageUrl: activity.imageUrl,
              height: 80,
              width: 80,
              // Sử dụng imageErrorListener để xử lý lỗi khi tải hình ảnh
              errorListener: imageErrorListener,
            ),
          ),
          const SizedBox(width: 20),
          // Sử dụng Expanded để chiếm không gian còn lại
          Expanded(
            // Sử dụng Column để hiển thị thông tin activity
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Hiển thị thời gian của activity
                Text(
                  activity.timeOfDay.name.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                // Hiển thị tên của activity
                Text(
                  activity.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                // Hiển thị mô tả của activity
                Text(
                  activity.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
