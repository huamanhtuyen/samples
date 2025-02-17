// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được tìm thấy trong tệp LICENSE.

// Nhập gói freezed_annotation để sử dụng các chú thích của freezed
import 'package:freezed_annotation/freezed_annotation.dart';

// Phần này để tạo mã cho freezed
part 'continent.freezed.dart';

// Phần này để tạo mã cho việc chuyển đổi JSON
part 'continent.g.dart';

// Sử dụng chú thích @freezed để tạo lớp Continent với các tính năng của freezed
@freezed
class Continent with _$Continent {
  // Định nghĩa một factory constructor cho lớp Continent
  const factory Continent({
    // Tên của lục địa, ví dụ: 'Europe'
    required String name,

    // URL hình ảnh của lục địa, ví dụ: 'https://rstr.in/google/tripedia/TmR12QdlVTT'
    required String imageUrl,
  }) = _Continent;

  // Phương thức factory để tạo đối tượng Continent từ JSON
  factory Continent.fromJson(Map<String, Object?> json) =>
      _$ContinentFromJson(json);
}
