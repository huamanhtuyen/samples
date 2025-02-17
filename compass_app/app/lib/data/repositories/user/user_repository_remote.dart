// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể
// được tìm thấy trong tệp LICENSE.

import '../../../domain/models/user/user.dart'; // Import mô hình người dùng từ domain
import '../../../utils/result.dart'; // Import lớp kết quả từ utils
import '../../services/api/api_client.dart'; // Import lớp khách hàng API từ services
import '../../services/api/model/user/user_api_model.dart'; // Import mô hình người dùng API từ services
import 'user_repository.dart'; // Import giao diện kho người dùng

// Định nghĩa lớp UserRepositoryRemote triển khai giao diện UserRepository
class UserRepositoryRemote implements UserRepository {
  // Hàm khởi tạo với tham số bắt buộc là apiClient
  UserRepositoryRemote({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient; // Khai báo biến thành viên _apiClient

  User?
  _cachedData; // Khai báo biến thành viên _cachedData để lưu trữ dữ liệu người dùng đã được cache

  // Ghi đè phương thức getUser từ giao diện UserRepository
  @override
  Future<Result<User>> getUser() async {
    // Kiểm tra nếu dữ liệu đã được cache thì trả về kết quả thành công với dữ liệu đã cache
    if (_cachedData != null) {
      return Future.value(Result.ok(_cachedData!));
    }

    // Gọi phương thức getUser từ apiClient và lưu kết quả vào biến result
    final result = await _apiClient.getUser();
    // Kiểm tra kết quả trả về
    switch (result) {
      // Nếu kết quả là thành công với kiểu dữ liệu UserApiModel
      case Ok<UserApiModel>():
        // Tạo đối tượng User từ dữ liệu API
        final user = User(
          name: result.value.name, // Lấy tên từ kết quả API
          picture: result.value.picture, // Lấy hình ảnh từ kết quả API
        );
        _cachedData = user; // Lưu dữ liệu vào biến cache
        return Result.ok(user); // Trả về kết quả thành công với đối tượng User
      // Nếu kết quả là lỗi với kiểu dữ liệu UserApiModel
      case Error<UserApiModel>():
        return Result.error(
          result.error,
        ); // Trả về kết quả lỗi với thông báo lỗi
    }
  }
}
