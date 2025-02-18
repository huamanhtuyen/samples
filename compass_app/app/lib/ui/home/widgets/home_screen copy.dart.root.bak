// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có trong tệp LICENSE.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/booking/booking_summary.dart';
import '../../../routing/routes.dart';
import '../../core/localization/applocalization.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/date_format_start_end.dart';
import '../../core/ui/error_indicator.dart';
import '../view_models/home_viewmodel.dart';
import 'home_title.dart';

const String bookingButtonKey = 'booking-button'; // Khóa cho nút đặt chỗ

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.viewModel,
  }); // Constructor với tham số viewModel

  final HomeViewModel viewModel; // Biến viewModel

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // Tạo state cho HomeScreen
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.deleteBooking.addListener(
      _onResult,
    ); // Thêm listener cho deleteBooking
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.deleteBooking.removeListener(
      _onResult,
    ); // Xóa listener cũ
    widget.viewModel.deleteBooking.addListener(_onResult); // Thêm listener mới
  }

  @override
  void dispose() {
    widget.viewModel.deleteBooking.removeListener(
      _onResult,
    ); // Xóa listener khi dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        // Giải pháp tạm thời cho vấn đề https://github.com/flutter/flutter/issues/115358#issuecomment-2117157419
        heroTag: null,
        key: const ValueKey(bookingButtonKey),
        onPressed: () => context.go(Routes.search), // Chuyển đến trang tìm kiếm
        label: Text(AppLocalization.of(context).bookNewTrip), // Nhãn nút
        icon: const Icon(Icons.add_location_outlined), // Biểu tượng nút
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: ListenableBuilder(
          listenable: widget.viewModel.load, // Lắng nghe thay đổi của load
          builder: (context, child) {
            if (widget.viewModel.load.running) {
              return const Center(
                child: CircularProgressIndicator(),
              ); // Hiển thị vòng tròn tải khi đang chạy
            }

            if (widget.viewModel.load.error) {
              return ErrorIndicator(
                title:
                    AppLocalization.of(
                      context,
                    ).errorWhileLoadingHome, // Tiêu đề lỗi
                label: AppLocalization.of(context).tryAgain, // Nhãn nút thử lại
                onPressed:
                    widget
                        .viewModel
                        .load
                        .execute, // Hành động khi nhấn nút thử lại
              );
            }

            return child!; // Trả về child nếu không có lỗi
          },
          child: ListenableBuilder(
            listenable: widget.viewModel, // Lắng nghe thay đổi của viewModel
            builder: (context, _) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimens.of(context).paddingScreenVertical,
                        horizontal: Dimens.of(context).paddingScreenHorizontal,
                      ),
                      child: HomeHeader(
                        viewModel: widget.viewModel,
                      ), // Hiển thị tiêu đề trang chủ
                    ),
                  ),
                  SliverList.builder(
                    itemCount:
                        widget.viewModel.bookings.length, // Số lượng đặt chỗ
                    itemBuilder:
                        (_, index) => _Booking(
                          key: ValueKey(
                            widget.viewModel.bookings[index].id,
                          ), // Khóa cho mỗi đặt chỗ
                          booking:
                              widget
                                  .viewModel
                                  .bookings[index], // Thông tin đặt chỗ
                          onTap:
                              () => context.push(
                                Routes.bookingWithId(
                                  widget.viewModel.bookings[index].id,
                                ),
                              ), // Chuyển đến trang chi tiết đặt chỗ khi nhấn
                          confirmDismiss: (_) async {
                            // Chờ lệnh hoàn thành
                            await widget.viewModel.deleteBooking.execute(
                              widget.viewModel.bookings[index].id,
                            );
                            // Nếu lệnh hoàn thành thành công, trả về true
                            if (widget.viewModel.deleteBooking.completed) {
                              // Xóa mục khỏi danh sách
                              return true;
                            } else {
                              // Giữ mục trong danh sách
                              return false;
                            }
                          },
                        ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.deleteBooking.completed) {
      widget.viewModel.deleteBooking
          .clearResult(); // Xóa kết quả sau khi hoàn thành
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalization.of(context).bookingDeleted),
        ), // Hiển thị thông báo đặt chỗ đã xóa
      );
    }

    if (widget.viewModel.deleteBooking.error) {
      widget.viewModel.deleteBooking
          .clearResult(); // Xóa kết quả sau khi có lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalization.of(context).errorWhileDeletingBooking,
          ), // Hiển thị thông báo lỗi khi xóa đặt chỗ
        ),
      );
    }
  }
}

class _Booking extends StatelessWidget {
  const _Booking({
    super.key,
    required this.booking,
    required this.onTap,
    required this.confirmDismiss,
  });

  final BookingSummary booking; // Thông tin đặt chỗ
  final GestureTapCallback onTap; // Hành động khi nhấn
  final ConfirmDismissCallback confirmDismiss; // Hành động khi xác nhận xóa

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(booking.id), // Khóa cho mỗi đặt chỗ
      direction: DismissDirection.endToStart, // Hướng xóa từ phải sang trái
      confirmDismiss: confirmDismiss, // Xác nhận xóa
      background: Container(
        color: AppColors.grey1, // Màu nền khi xóa
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: Dimens.paddingHorizontal),
              child: Icon(Icons.delete), // Biểu tượng xóa
            ),
          ],
        ),
      ),
      child: InkWell(
        onTap: onTap, // Hành động khi nhấn
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.of(context).paddingScreenHorizontal,
            vertical: Dimens.paddingVertical,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                booking.name,
                style: Theme.of(context).textTheme.titleLarge,
              ), // Tên đặt chỗ
              Text(
                dateFormatStartEnd(
                  DateTimeRange(start: booking.startDate, end: booking.endDate),
                ),
                style:
                    Theme.of(
                      context,
                    ).textTheme.bodyLarge, // Ngày bắt đầu và kết thúc
              ),
            ],
          ),
        ),
      ),
    );
  }
}
