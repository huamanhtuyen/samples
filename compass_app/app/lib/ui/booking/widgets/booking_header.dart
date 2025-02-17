// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể tìm thấy
// trong tệp LICENSE.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/booking/booking.dart';
import '../../../utils/image_error_listener.dart';
import '../../core/localization/applocalization.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/date_format_start_end.dart';
import '../../core/ui/home_button.dart';
import '../../core/ui/tag_chip.dart';

// Widget BookingHeader hiển thị thông tin tiêu đề của booking
class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key, required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Top(booking: booking), // Hiển thị phần trên của tiêu đề
        Padding(
          padding: Dimens.of(context).edgeInsetsScreenHorizontal,
          child: Text(
            booking
                .destination
                .knownFor, // Hiển thị thông tin nổi bật của điểm đến
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: Dimens.paddingVertical),
        _Tags(booking: booking), // Hiển thị các thẻ tag của điểm đến
        const SizedBox(height: Dimens.paddingVertical),
        Padding(
          padding: Dimens.of(context).edgeInsetsScreenHorizontal,
          child: Text(
            AppLocalization.of(
              context,
            ).yourChosenActivities, // Hiển thị tiêu đề "Các hoạt động bạn đã chọn"
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}

// Widget _Top hiển thị phần trên của tiêu đề
class _Top extends StatelessWidget {
  const _Top({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _HeaderImage(booking: booking), // Hiển thị hình ảnh tiêu đề
          const _Gradient(), // Hiển thị gradient
          _Headline(booking: booking), // Hiển thị tiêu đề chính
          Positioned(
            right: Dimens.of(context).paddingScreenHorizontal,
            top: Dimens.of(context).paddingScreenVertical,
            child: const SafeArea(
              top: true,
              child: HomeButton(blur: true),
            ), // Hiển thị nút Home
          ),
        ],
      ),
    );
  }
}

// Widget _Tags hiển thị các thẻ tag của điểm đến
class _Tags extends StatelessWidget {
  const _Tags({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final chipColor = switch (brightness) {
      Brightness.dark => AppColors.whiteTransparent,
      Brightness.light => AppColors.blackTransparent,
    };
    return Padding(
      padding: Dimens.of(context).edgeInsetsScreenHorizontal,
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children:
            booking.destination.tags
                .map(
                  (tag) => TagChip(
                    tag: tag, // Hiển thị từng thẻ tag
                    fontSize: 16,
                    height: 32,
                    chipColor: chipColor,
                    onChipColor: Theme.of(context).colorScheme.onSurface,
                  ),
                )
                .toList(),
      ),
    );
  }
}

// Widget _Headline hiển thị tiêu đề chính của điểm đến
class _Headline extends StatelessWidget {
  const _Headline({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomStart,
      child: Padding(
        padding: Dimens.of(context).edgeInsetsScreenSymmetric,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking.destination.name, // Hiển thị tên điểm đến
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              dateFormatStartEnd(
                DateTimeRange(
                  start: booking.startDate,
                  end: booking.endDate,
                ), // Hiển thị ngày bắt đầu và kết thúc của booking
              ),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _HeaderImage hiển thị hình ảnh tiêu đề
class _HeaderImage extends StatelessWidget {
  const _HeaderImage({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fitWidth,
      imageUrl: booking.destination.imageUrl, // URL hình ảnh của điểm đến
      errorListener: imageErrorListener, // Lắng nghe lỗi khi tải hình ảnh
    );
  }
}

// Widget _Gradient hiển thị gradient
class _Gradient extends StatelessWidget {
  const _Gradient();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Theme.of(context).colorScheme.surface,
          ], // Gradient từ trong suốt đến màu bề mặt
        ),
      ),
    );
  }
}
