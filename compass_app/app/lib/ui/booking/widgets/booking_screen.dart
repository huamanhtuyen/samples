// Bản quyền 2024 Đội Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/localization/applocalization.dart';
import '../../core/ui/error_indicator.dart';
import '../view_models/booking_viewmodel.dart';
import 'booking_body.dart';

// Định nghĩa một widget có trạng thái BookingScreen
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, required this.viewModel});

  final BookingViewModel viewModel;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  void initState() {
    super.initState();
    // Thêm listener cho shareBooking khi widget được khởi tạo
    widget.viewModel.shareBooking.addListener(_listener);
  }

  @override
  void dispose() {
    // Loại bỏ listener cho shareBooking khi widget bị hủy
    widget.viewModel.shareBooking.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, r) {
        // Điều hướng quay lại luôn về trang chủ
        if (!didPop) context.go(Routes.home);
      },
      child: Scaffold(
        floatingActionButton: ListenableBuilder(
          listenable: widget.viewModel,
          builder:
              (context, _) => FloatingActionButton.extended(
                // Giải pháp tạm thời cho vấn đề https://github.com/flutter/flutter/issues/115358#issuecomment-2117157419
                heroTag: null,
                key: const ValueKey('share-button'),
                onPressed:
                    widget.viewModel.booking != null
                        ? widget.viewModel.shareBooking.execute
                        : null,
                label: Text(AppLocalization.of(context).shareTrip),
                icon: const Icon(Icons.share_outlined),
              ),
        ),
        body: ListenableBuilder(
          // Lắng nghe sự thay đổi của cả hai lệnh
          listenable: Listenable.merge([
            widget.viewModel.createBooking,
            widget.viewModel.loadBooking,
          ]),
          builder: (context, child) {
            // Nếu một trong hai lệnh đang chạy, hiển thị chỉ báo tiến trình
            if (widget.viewModel.createBooking.running ||
                widget.viewModel.loadBooking.running) {
              return const Center(child: CircularProgressIndicator());
            }
            // Nếu tạo booking thất bại, nhấn để thử lại
            if (widget.viewModel.createBooking.error) {
              return Center(
                child: ErrorIndicator(
                  title: AppLocalization.of(context).errorWhileLoadingBooking,
                  label: AppLocalization.of(context).tryAgain,
                  onPressed: widget.viewModel.createBooking.execute,
                ),
              );
            }
            // Nếu tải booking hiện có thất bại, nhấn để quay về /home
            if (widget.viewModel.loadBooking.error) {
              return Center(
                child: ErrorIndicator(
                  title: AppLocalization.of(context).errorWhileLoadingBooking,
                  label: AppLocalization.of(context).close,
                  onPressed: () => context.go(Routes.home),
                ),
              );
            }
            return child!;
          },
          child: BookingBody(viewModel: widget.viewModel),
        ),
      ),
    );
  }

  void _listener() {
    // Nếu shareBooking gặp lỗi, hiển thị thông báo lỗi
    if (widget.viewModel.shareBooking.error) {
      widget.viewModel.shareBooking.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalization.of(context).errorWhileSharing),
          action: SnackBarAction(
            label: AppLocalization.of(context).tryAgain,
            onPressed: widget.viewModel.shareBooking.execute,
          ),
        ),
      );
    }
  }
}
