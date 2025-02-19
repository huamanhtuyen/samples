// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có trong tệp LICENSE.

import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';

//import '../../../domain/models/booking/booking_summary.dart';
//import '../../../routing/routes.dart';
import '../../core/localization/applocalization.dart';
//import '../../core/themes/colors.dart';
//import '../../core/themes/dimens.dart';
//import '../../core/ui/date_format_start_end.dart';
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
                        //vertical: Dimens.of(context).paddingScreenVertical,
                        vertical: 0,
                        //horizontal: Dimens.of(context).paddingScreenHorizontal,
                        horizontal: 0,
                      ),
                      child: HomeHeader(
                        viewModel: widget.viewModel,
                      ), // Hiển thị tiêu đề trang chủ
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // Add your list of links or other widgets here
                        Text('Link 1'),
                        Text('Link 2'),
                        Text('Link 3'),
                        // ...more links or widgets...
                      ],
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
      // widget.viewModel.deleteBooking
      //     .clearResult(); // Xóa kết quả sau khi hoàn thành
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(AppLocalization.of(context).bookingDeleted),
      //   ), // Hiển thị thông báo đặt chỗ đã xóa
      // );
    }

    if (widget.viewModel.deleteBooking.error) {
      // widget.viewModel.deleteBooking
      //     .clearResult(); // Xóa kết quả sau khi có lỗi
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       AppLocalization.of(context).errorWhileDeletingBooking,
      //     ), // Hiển thị thông báo lỗi khi xóa đặt chỗ
      //   ),
      // );
    }
  }
}
