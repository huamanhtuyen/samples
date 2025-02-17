// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có trong tệp LICENSE.

import 'package:flutter/material.dart';

import '../../../domain/models/itinerary_config/itinerary_config.dart';
import '../localization/applocalization.dart';
import '../themes/colors.dart';
import '../themes/dimens.dart';
import 'date_format_start_end.dart';
import 'home_button.dart';

/// Thanh tìm kiếm trên cùng của ứng dụng.
/// Hiển thị thanh tìm kiếm với cấu hình hiện tại.
/// Bao gồm [HomeButton] để điều hướng trở lại đường dẫn '/'.
class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, this.config, this.onTap});

  final ItineraryConfig? config; // Cấu hình hành trình
  final GestureTapCallback? onTap; // Callback khi nhấn vào thanh tìm kiếm

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(16.0), // Bán kính bo tròn
            onTap: onTap, // Gọi callback khi nhấn
            child: Container(
              height: 64, // Chiều cao của thanh tìm kiếm
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey1), // Viền màu xám
                borderRadius: BorderRadius.circular(16.0), // Bán kính bo tròn
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.paddingHorizontal, // Khoảng cách ngang
                ),
                child: Align(
                  alignment:
                      AlignmentDirectional.centerStart, // Căn chỉnh bắt đầu
                  child: _QueryText(
                    config: config,
                  ), // Hiển thị văn bản tìm kiếm
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ), // Khoảng cách giữa thanh tìm kiếm và nút home
        const HomeButton(), // Nút home
      ],
    );
  }
}

class _QueryText extends StatelessWidget {
  const _QueryText({required this.config});

  final ItineraryConfig? config; // Cấu hình hành trình

  @override
  Widget build(BuildContext context) {
    if (config == null) {
      return const _EmptySearch(); // Hiển thị tìm kiếm trống nếu không có cấu hình
    }

    final ItineraryConfig(:continent, :startDate, :endDate, :guests) = config!;
    if (startDate == null ||
        endDate == null ||
        guests == null ||
        continent == null) {
      return const _EmptySearch(); // Hiển thị tìm kiếm trống nếu thiếu thông tin
    }

    return Text(
      '$continent - '
      '${dateFormatStartEnd(DateTimeRange(start: startDate, end: endDate))} - '
      'Guests: $guests', // Hiển thị thông tin tìm kiếm
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge, // Kiểu chữ
    );
  }
}

class _EmptySearch extends StatelessWidget {
  const _EmptySearch();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo trục chéo
      mainAxisAlignment: MainAxisAlignment.start, // Căn bắt đầu theo trục chính
      children: [
        const Icon(Icons.search), // Biểu tượng tìm kiếm
        const SizedBox(width: 12), // Khoảng cách giữa biểu tượng và văn bản
        Expanded(
          child: Text(
            AppLocalization.of(context).searchDestination, // Văn bản tìm kiếm
            textAlign: TextAlign.start, // Căn bắt đầu
            style:
                Theme.of(
                  context,
                ).inputDecorationTheme.hintStyle, // Kiểu chữ gợi ý
          ),
        ),
      ],
    );
  }
}
