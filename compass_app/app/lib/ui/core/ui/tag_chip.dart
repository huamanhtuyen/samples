// Bản quyền 2024 của nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được tìm thấy trong tệp LICENSE.

import 'dart:ui'; // Thư viện để làm việc với giao diện người dùng

import 'package:flutter/material.dart'; // Thư viện chính của Flutter
import 'package:google_fonts/google_fonts.dart'; // Thư viện để sử dụng các font chữ từ Google Fonts

import '../themes/colors.dart'; // Import tệp màu sắc từ thư mục themes

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.tag, // Thẻ (tag) cần hiển thị
    this.fontSize = 10, // Kích thước font chữ mặc định
    this.height = 20, // Chiều cao mặc định của chip
    this.chipColor, // Màu sắc của chip
    this.onChipColor, // Màu sắc của nội dung trên chip
  });

  final String tag; // Biến lưu trữ thẻ

  final double fontSize; // Biến lưu trữ kích thước font chữ
  final double height; // Biến lưu trữ chiều cao của chip
  final Color? chipColor; // Biến lưu trữ màu sắc của chip
  final Color? onChipColor; // Biến lưu trữ màu sắc của nội dung trên chip

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        height / 2,
      ), // Bo tròn các góc của chip
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ), // Áp dụng hiệu ứng làm mờ nền
        child: DecoratedBox(
          decoration: BoxDecoration(
            color:
                chipColor ?? // Nếu chipColor không được cung cấp, sử dụng màu mặc định từ chủ đề hoặc màu trắng trong suốt
                Theme.of(context).extension<TagChipTheme>()?.chipColor ??
                AppColors.whiteTransparent,
          ),
          child: SizedBox(
            height: height, // Đặt chiều cao của chip
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
              ), // Đặt khoảng cách ngang
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Căn giữa theo chiều dọc
                mainAxisSize: MainAxisSize.min, // Kích thước hàng tối thiểu
                children: [
                  Icon(
                    _iconFrom(tag), // Lấy biểu tượng từ thẻ
                    color:
                        onChipColor ?? // Nếu onChipColor không được cung cấp, sử dụng màu mặc định từ chủ đề hoặc màu trắng
                        Theme.of(
                          context,
                        ).extension<TagChipTheme>()?.onChipColor ??
                        Colors.white,
                    size: fontSize, // Đặt kích thước biểu tượng
                  ),
                  const SizedBox(
                    width: 4,
                  ), // Khoảng cách giữa biểu tượng và văn bản
                  Text(
                    tag, // Hiển thị thẻ
                    textAlign: TextAlign.center, // Căn giữa văn bản
                    style: _textStyle(context), // Áp dụng kiểu chữ
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData? _iconFrom(String tag) {
    return switch (tag) {
      'Adventure sports' =>
        Icons.kayaking_outlined, // Biểu tượng cho thể thao mạo hiểm
      'Beach' => Icons.beach_access_outlined, // Biểu tượng cho bãi biển
      'City' => Icons.location_city_outlined, // Biểu tượng cho thành phố
      'Cultural experiences' =>
        Icons.museum_outlined, // Biểu tượng cho trải nghiệm văn hóa
      'Foodie' || 'Food tours' => Icons.restaurant, // Biểu tượng cho ẩm thực
      'Hiking' => Icons.hiking, // Biểu tượng cho đi bộ đường dài
      'Historic' => Icons.menu_book_outlined, // Biểu tượng cho lịch sử
      'Island' ||
      'Coastal' ||
      'Lake' ||
      'River' => Icons.water, // Biểu tượng cho đảo, bờ biển, hồ, sông
      'Luxury' => Icons.attach_money_outlined, // Biểu tượng cho sang trọng
      'Mountain' || 'Wildlife watching' =>
        Icons.landscape_outlined, // Biểu tượng cho núi, xem động vật hoang dã
      'Nightlife' =>
        Icons.local_bar_outlined, // Biểu tượng cho cuộc sống về đêm
      'Off-the-beaten-path' =>
        Icons
            .do_not_step_outlined, // Biểu tượng cho những nơi ít người biết đến
      'Romantic' => Icons.favorite_border_outlined, // Biểu tượng cho lãng mạn
      'Rural' => Icons.agriculture_outlined, // Biểu tượng cho nông thôn
      'Secluded' => Icons.church_outlined, // Biểu tượng cho nơi hẻo lánh
      'Sightseeing' => Icons.attractions_outlined, // Biểu tượng cho tham quan
      'Skiing' => Icons.downhill_skiing_outlined, // Biểu tượng cho trượt tuyết
      'Wine tasting' => Icons.wine_bar_outlined, // Biểu tượng cho thử rượu
      'Winter destination' => Icons.ac_unit, // Biểu tượng cho điểm đến mùa đông
      _ => Icons.label_outlined, // Biểu tượng mặc định
    };
  }

  // Lưu ý: tệp Figma gốc sử dụng Google Sans
  // không có sẵn trên GoogleFonts
  TextStyle _textStyle(BuildContext context) => GoogleFonts.openSans(
    textStyle: TextStyle(
      fontWeight: FontWeight.w500, // Đặt độ đậm của chữ
      fontSize: fontSize, // Đặt kích thước font chữ
      color:
          onChipColor ?? // Nếu onChipColor không được cung cấp, sử dụng màu mặc định từ chủ đề hoặc màu trắng
          Theme.of(context).extension<TagChipTheme>()?.onChipColor ??
          Colors.white,
      textBaseline: TextBaseline.alphabetic, // Đặt đường cơ sở của văn bản
    ),
  );
}

class TagChipTheme extends ThemeExtension<TagChipTheme> {
  final Color chipColor; // Màu sắc của chip
  final Color onChipColor; // Màu sắc của nội dung trên chip

  TagChipTheme({required this.chipColor, required this.onChipColor});

  @override
  ThemeExtension<TagChipTheme> copyWith({
    Color? chipColor, // Màu sắc của chip mới
    Color? onChipColor, // Màu sắc của nội dung trên chip mới
  }) {
    return TagChipTheme(
      chipColor:
          chipColor ??
          this.chipColor, // Sử dụng màu mới nếu có, nếu không sử dụng màu hiện tại
      onChipColor:
          onChipColor ??
          this.onChipColor, // Sử dụng màu mới nếu có, nếu không sử dụng màu hiện tại
    );
  }

  @override
  ThemeExtension<TagChipTheme> lerp(
    covariant ThemeExtension<TagChipTheme> other,
    double t,
  ) {
    if (other is! TagChipTheme) {
      return this;
    }
    return TagChipTheme(
      chipColor:
          Color.lerp(chipColor, other.chipColor, t) ??
          chipColor, // Trộn màu chip
      onChipColor:
          Color.lerp(onChipColor, other.onChipColor, t) ??
          onChipColor, // Trộn màu nội dung trên chip
    );
  }
}
