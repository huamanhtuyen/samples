// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được tìm thấy trong tệp LICENSE.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/models/continent/continent.dart';
import '../../../utils/image_error_listener.dart';
import '../../core/localization/applocalization.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/error_indicator.dart';
import '../view_models/search_form_viewmodel.dart';

/// Carousel lựa chọn châu lục
///
/// Tải danh sách các châu lục trong một carousel ngang.
/// Người dùng có thể nhấn vào một mục để chọn nó.
/// Nhấn lại vào cùng một mục sẽ bỏ chọn nó.
class SearchFormContinent extends StatelessWidget {
  const SearchFormContinent({super.key, required this.viewModel});

  final SearchFormViewModel viewModel; // ViewModel để quản lý trạng thái

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140, // Chiều cao của carousel
      child: ListenableBuilder(
        listenable: viewModel.load, // Lắng nghe trạng thái tải dữ liệu
        builder: (context, child) {
          if (viewModel.load.running) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Hiển thị vòng tròn tải khi đang tải
          }
          if (viewModel.load.error) {
            return Center(
              child: ErrorIndicator(
                title:
                    AppLocalization.of(
                      context,
                    ).errorWhileLoadingContinents, // Hiển thị lỗi khi tải thất bại
                label: AppLocalization.of(context).tryAgain, // Nhãn nút thử lại
                onPressed:
                    viewModel.load.execute, // Hành động khi nhấn nút thử lại
              ),
            );
          }
          return child!;
        },
        child: ListenableBuilder(
          listenable: viewModel, // Lắng nghe thay đổi từ ViewModel
          builder: (context, child) {
            return ListView.separated(
              scrollDirection: Axis.horizontal, // Cuộn ngang
              itemCount: viewModel.continents.length, // Số lượng châu lục
              padding:
                  Dimens.of(
                    context,
                  ).edgeInsetsScreenHorizontal, // Khoảng cách lề ngang
              itemBuilder: (BuildContext context, int index) {
                final Continent(:imageUrl, :name) =
                    viewModel.continents[index]; // Lấy thông tin châu lục
                return _CarouselItem(
                  key: ValueKey(name), // Khóa duy nhất cho mỗi mục
                  imageUrl: imageUrl, // URL hình ảnh
                  name: name, // Tên châu lục
                  viewModel: viewModel, // ViewModel để quản lý trạng thái
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 8); // Khoảng cách giữa các mục
              },
            );
          },
        ),
      ),
    );
  }
}

class _CarouselItem extends StatelessWidget {
  const _CarouselItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.viewModel,
  });

  final String imageUrl; // URL hình ảnh
  final String name; // Tên châu lục
  final SearchFormViewModel viewModel; // ViewModel để quản lý trạng thái

  bool _selected() =>
      viewModel.selectedContinent == null ||
      viewModel.selectedContinent ==
          name; // Kiểm tra xem mục này có được chọn không

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140, // Chiều rộng của mục
      height: 140, // Chiều cao của mục
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Bo tròn góc
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl, // URL hình ảnh
              fit: BoxFit.cover, // Cách hiển thị hình ảnh
              errorListener: imageErrorListener, // Lắng nghe lỗi hình ảnh
              errorWidget: (context, url, error) {
                // Ghi chú: Nhận lỗi "dữ liệu hình ảnh không hợp lệ" cho một số hình ảnh
                // ví dụ: https://rstr.in/google/tripedia/jlbgFDrSUVE
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.grey3,
                  ), // Màu nền khi lỗi
                  child: SizedBox(
                    width: 140,
                    height: 140,
                  ), // Kích thước khi lỗi
                );
              },
            ),
            Align(
              alignment: Alignment.center, // Căn giữa
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Khoảng cách lề
                child: Text(
                  name, // Tên châu lục
                  textAlign: TextAlign.center, // Căn giữa văn bản
                  style: GoogleFonts.openSans(
                    fontSize: 18, // Kích thước chữ
                    fontWeight: FontWeight.w500, // Độ đậm chữ
                    color: AppColors.white1, // Màu chữ
                  ),
                ),
              ),
            ),
            // Lớp phủ khi châu lục khác được chọn
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: _selected() ? 0 : 0.7, // Độ mờ
                duration: kThemeChangeDuration, // Thời gian chuyển đổi
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    // Hỗ trợ chế độ tối
                    color: Theme.of(context).colorScheme.onPrimary, // Màu nền
                  ),
                ),
              ),
            ),
            // Xử lý nhấn
            Positioned.fill(
              child: Material(
                color: Colors.transparent, // Màu nền trong suốt
                child: InkWell(
                  onTap: () {
                    if (viewModel.selectedContinent == name) {
                      viewModel.selectedContinent = null; // Bỏ chọn nếu đã chọn
                    } else {
                      viewModel.selectedContinent = name; // Chọn châu lục
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
