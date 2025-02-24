// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được tìm thấy trong tệp LICENSE.

// Nhập gói freezed_annotation để hỗ trợ tạo các lớp bất biến.
import 'package:freezed_annotation/freezed_annotation.dart';

// Phần này dùng để tạo các tệp liên quan đến freezed và json.
part 'user_api_model.freezed.dart';
part 'user_api_model.g.dart';

// Định nghĩa một lớp bất biến UserApiModel sử dụng freezed.
@freezed
abstract class UserApiModel with _$UserApiModel {
  // Định nghĩa một factory constructor cho UserApiModel.
  const factory UserApiModel({
    // ID của người dùng.
    required String id,

    // Tên của người dùng.
    required String name,

    // Email của người dùng.
    String? tencty,

    // URL hình ảnh của người dùng.
    required String picture,
  }) = _UserApiModel;

  // Phương thức để tạo một đối tượng UserApiModel từ JSON.
  factory UserApiModel.fromJson(Map<String, Object?> json) =>
      _$UserApiModelFromJson(json);
}
