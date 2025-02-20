// Bản quyền 2024 Nhóm Flutter. Đã đăng ký bản quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

//import 'package:cached_network_image/cached_network_image.dart'; // Thư viện để tải và lưu trữ hình ảnh từ mạng
import 'package:flutter/material.dart'; // Thư viện chính của Flutter
import 'package:flutter_svg/svg.dart'; // Thư viện để hiển thị hình ảnh SVG

//import '../../../../utils/image_error_listener.dart'; // Import hàm xử lý lỗi hình ảnh

class TiltedCards extends StatelessWidget {
  // Định nghĩa một widget không thay đổi
  const TiltedCards({super.key}); // Hàm khởi tạo

  @override
  Widget build(BuildContext context) {
    // Hàm xây dựng giao diện
    return ConstrainedBox(
      // Đặt giới hạn cho kích thước của widget con
      constraints: const BoxConstraints(
        maxWidth: 300,
      ), // Giới hạn chiều rộng tối đa là 300
      child: const AspectRatio(
        // Đặt tỷ lệ khung hình cho widget con
        aspectRatio: 1, // Tỷ lệ khung hình là 1:1
        child: Stack(
          // Xếp chồng các widget con
          alignment: Alignment.center, // Căn giữa các widget con
          children: [
            Positioned(
              // Đặt vị trí cho widget con
              left: 0, // Căn trái
              child: _Card(
                // Widget con là _Card
                imageUrl: 'assets/anh2.jpg', // Local asset image
                width: 200, // Chiều rộng của thẻ
                height: 273, // Chiều cao của thẻ
                tilt: -3.83 / 360, // Góc nghiêng của thẻ
              ),
            ),
            Positioned(
              // Đặt vị trí cho widget con
              right: 0, // Căn phải
              child: _Card(
                // Widget con là _Card
                imageUrl: 'assets/anh3.jpg', // Local asset image
                width: 180, // Chiều rộng của thẻ
                height: 230, // Chiều cao của thẻ
                tilt: 3.46 / 360, // Góc nghiêng của thẻ
              ),
            ),
            _Card(
              // Widget con là _Card
              imageUrl: 'assets/anh1.jpg', // Local asset image
              width: 225, // Chiều rộng của thẻ
              height: 322, // Chiều cao của thẻ
              tilt: 0, // Góc nghiêng của thẻ
              showTitle: true, // Hiển thị tiêu đề
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  // Định nghĩa một widget không thay đổi
  const _Card({
    required this.imageUrl, // URL hình ảnh
    required this.width, // Chiều rộng của thẻ
    required this.height, // Chiều cao của thẻ
    required this.tilt, // Góc nghiêng của thẻ
    this.showTitle = false, // Hiển thị tiêu đề (mặc định là không)
  });

  final double tilt; // Góc nghiêng của thẻ
  final double width; // Chiều rộng của thẻ
  final double height; // Chiều cao của thẻ
  final String imageUrl; // URL hình ảnh
  final bool showTitle; // Hiển thị tiêu đề

  @override
  Widget build(BuildContext context) {
    // Hàm xây dựng giao diện
    return RotationTransition(
      // Widget để xoay thẻ
      turns: AlwaysStoppedAnimation(tilt), // Góc xoay của thẻ
      child: SizedBox(
        // Đặt kích thước cho thẻ
        width: width, // Chiều rộng của thẻ
        height: height, // Chiều cao của thẻ
        child: ClipRRect(
          // Cắt góc của thẻ
          borderRadius: BorderRadius.circular(20), // Bán kính bo tròn góc
          child: Stack(
            // Xếp chồng các widget con
            fit:
                StackFit.expand, // Mở rộng các widget con để lấp đầy không gian
            alignment: Alignment.center, // Căn giữa các widget con
            children: [
              Image.asset(
                // Widget để hiển thị hình ảnh từ local assets
                imageUrl, // Đường dẫn hình ảnh
                fit: BoxFit.cover, // Cách hiển thị hình ảnh
                color:
                    showTitle
                        ? Colors.black.withOpacity(0.5)
                        : null, // Màu phủ nếu hiển thị tiêu đề
                colorBlendMode:
                    showTitle
                        ? BlendMode.darken
                        : null, // Chế độ pha trộn màu nếu hiển thị tiêu đề
              ),
              if (showTitle)
                Center(
                  child: SvgPicture.asset('assets/logo.svg'),
                ), // Hiển thị logo nếu có tiêu đề
            ],
          ),
        ),
      ),
    );
  }
}
