// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:freezed_annotation/freezed_annotation.dart'; // Nhập gói freezed_annotation.

part 'login_response.freezed.dart'; // Phần freezed của tệp login_response.
part 'login_response.g.dart'; // Phần json_serializable của tệp login_response.

/// Mô hình LoginResponse.
@freezed
class LoginResponse with _$LoginResponse {
  // Hàm khởi tạo của LoginResponse.
  const factory LoginResponse({
    /// Token được sử dụng để xác thực.
    required String token,

    /// ID người dùng.
    required String userId,
  }) = _LoginResponse;

  // Phương thức để tạo đối tượng LoginResponse từ JSON.
  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}
