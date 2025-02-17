// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:freezed_annotation/freezed_annotation.dart';

// Phần này để tạo các tệp bổ sung cho lớp LoginRequest.
part 'login_request.freezed.dart';
part 'login_request.g.dart';

// Lớp dữ liệu đơn giản để chứa dữ liệu yêu cầu đăng nhập.
@freezed
class LoginRequest with _$LoginRequest {
  // Hàm khởi tạo cho lớp LoginRequest.
  const factory LoginRequest({
    // Địa chỉ email.
    required String email,

    // Mật khẩu dạng văn bản thuần túy.
    required String password,
  }) = _LoginRequest;

  // Phương thức để tạo đối tượng LoginRequest từ JSON.
  factory LoginRequest.fromJson(Map<String, Object?> json) =>
      _$LoginRequestFromJson(json);
}
