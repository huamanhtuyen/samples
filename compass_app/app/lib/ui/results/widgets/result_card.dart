// Bản quyền 2024 thuộc về nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:cached_network_image/cached_network_image.dart'; // Thư viện để tải và lưu trữ hình ảnh từ mạng
import 'package:flutter/material.dart'; // Thư viện chính của Flutter
import 'package:google_fonts/google_fonts.dart'; // Thư viện để sử dụng font từ Google
import '../../../domain/models/destination/destination.dart'; // Import model Destination
import '../../../utils/image_error_listener.dart'; // Import hàm xử lý lỗi hình ảnh
import '../../core/ui/tag_chip.dart'; // Import widget TagChip

class ResultCard extends StatelessWidget {
  const ResultCard({super.key, required this.destination, required this.onTap});

  final Destination destination; // Biến lưu trữ thông tin điểm đến
  final GestureTapCallback
  onTap; // Biến lưu trữ hàm callback khi người dùng nhấn vào

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0), // Bo tròn các góc của thẻ
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: destination.imageUrl, // URL hình ảnh của điểm đến
            fit: BoxFit.fitHeight, // Đặt hình ảnh vừa với chiều cao
            errorWidget:
                (context, url, error) => const Icon(
                  Icons.error,
                ), // Hiển thị icon lỗi nếu không tải được hình ảnh
            errorListener: imageErrorListener, // Hàm xử lý lỗi hình ảnh
          ),
          Positioned(
            bottom: 12.0, // Đặt vị trí của phần tử con cách đáy 12.0
            left: 12.0, // Đặt vị trí của phần tử con cách trái 12.0
            right: 12.0, // Đặt vị trí của phần tử con cách phải 12.0
            child: Column(
              mainAxisSize: MainAxisSize.min, // Kích thước cột tối thiểu
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Căn lề trái cho các phần tử con
              children: [
                Text(
                  destination.name.toUpperCase(),
                  style: _cardTitleStyle,
                ), // Hiển thị tên điểm đến với chữ in hoa
                const SizedBox(height: 6), // Khoảng cách giữa các phần tử
                Wrap(
                  spacing: 4.0, // Khoảng cách ngang giữa các phần tử
                  runSpacing: 4.0, // Khoảng cách dọc giữa các phần tử
                  direction:
                      Axis.horizontal, // Sắp xếp các phần tử theo chiều ngang
                  children:
                      destination.tags
                          .map((e) => TagChip(tag: e))
                          .toList(), // Hiển thị các thẻ của điểm đến
                ),
              ],
            ),
          ),
          // Xử lý sự kiện nhấn
          Positioned.fill(
            child: Material(
              color: Colors.transparent, // Màu nền trong suốt
              child: InkWell(onTap: onTap), // Xử lý sự kiện nhấn vào thẻ
            ),
          ),
        ],
      ),
    );
  }
}

final _cardTitleStyle = GoogleFonts.rubik(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w800, // Độ đậm của chữ
    fontSize: 15.0, // Kích thước chữ
    color: Colors.white, // Màu chữ
    letterSpacing: 1, // Khoảng cách giữa các chữ cái
    shadows: [
      // Giúp đọc chữ dễ hơn
      Shadow(blurRadius: 3.0, color: Colors.black), // Đổ bóng cho chữ
    ],
  ),
);
