// Bản quyền 2024 Nhóm Flutter. Tất cả các quyền được bảo lưu.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD
// có thể được tìm thấy trong tệp LICENSE.

import 'package:freezed_annotation/freezed_annotation.dart'; // Nhập gói freezed_annotation

part 'user.freezed.dart'; // Phần của freezed
part 'user.g.dart'; // Phần của json_serializable

@freezed
abstract class User with _$User {
  // Định nghĩa lớp User sử dụng freezed
  const factory User({
    /// Tên của người dùng.
    required String name,

    /// URL hình ảnh của người dùng.
    required String picture,
  }) = _User;

  // Phương thức tạo đối tượng User từ JSON
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
