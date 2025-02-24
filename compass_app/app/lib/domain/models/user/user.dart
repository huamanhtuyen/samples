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
    /// id của người dùng.
    required String id,

    ///
    String? mst,

    String? tencty,

    /// URL hình ảnh của người dùng.
    String? picture,

    /// Địa chỉ của người dùng.
    String? diachi,

    String? sdt1,
    String? sdt2,
    String? sdt3,
    String? nguoidaidiendn,
    String? stk1,
    String? tennganhang1,
    String? stk2,
    String? tennganhang2,
    String? stk3,
    String? tennganhang3,
  }) = _User;

  // Phương thức tạo đối tượng User từ JSON
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
