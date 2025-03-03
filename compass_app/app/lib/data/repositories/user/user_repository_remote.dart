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
          id: result.value.id, // Thêm tham số id
          mst: result.value.mst, // Lấy tên từ kết quả API
          picture: result.value.picture, // Lấy hình ảnh từ kết quả API
          tencty: result.value.tencty, // Lấy tên từ kết quả API
          diachi: result.value.diachi, // Ensure diachi field is handled
          sdt1: result.value.sdt1,
          sdt2: result.value.sdt2,
          sdt3: result.value.sdt3,
          nguoidaidiendn: result.value.nguoidaidiendn,
          stk1: result.value.stk1,
          tennganhang1: result.value.tennganhang1,
          stk2: result.value.stk2,
          tennganhang2: result.value.tennganhang2,
          stk3: result.value.stk3,
          tennganhang3: result.value.tennganhang3,
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

  // Ghi đè phương thức deleteUser từ giao diện UserRepository
  @override
  Future<Result<void>> deleteUser() async {
    // Gọi phương thức deleteUser từ apiClient và lưu kết quả vào biến result
    final result = await _apiClient.deleteUser();
    // Kiểm tra kết quả trả về
    switch (result) {
      // Nếu kết quả là thành công
      case Ok<void>():
        _cachedData = null; // Xóa dữ liệu cache
        return Result.ok(null); // Trả về kết quả thành công
      // Nếu kết quả là lỗi
      case Error<void>():
        return Result.error(
          result.error,
        ); // Trả về kết quả lỗi với thông báo lỗi
    }
  }

  // Ghi đè phương thức updateUser từ giao diện UserRepository
  @override
  Future<Result<User>> updateUser(User user) async {
    // Chuyển đổi đối tượng User thành UserApiModel
    final userApiModel = UserApiModel(
      id: user.id, // Thêm tham số id
      mst: user.mst,
      tencty: user.tencty,
      picture: user.picture,
      diachi: user.diachi, // Ensure diachi field is handled
      sdt1: user.sdt1,
      sdt2: user.sdt2,
      sdt3: user.sdt3,
      nguoidaidiendn: user.nguoidaidiendn,
      stk1: user.stk1,
      tennganhang1: user.tennganhang1,
      stk2: user.stk2,
      tennganhang2: user.tennganhang2,
      stk3: user.stk3,
      tennganhang3: user.tennganhang3,
    );

    // Gọi phương thức updateUser từ apiClient và lưu kết quả vào biến result
    final result = await _apiClient.updateUser(userApiModel);
    // Kiểm tra kết quả trả về
    switch (result) {
      // Nếu kết quả là thành công với kiểu dữ liệu UserApiModel
      case Ok<UserApiModel>():
        // Tạo đối tượng User từ dữ liệu API
        final updatedUser = User(
          id: user.id, // Thêm tham số id
          mst: result.value.mst, // Lấy tên từ kết quả API
          tencty: result.value.tencty, // Lấy tên từ kết quả API
          picture: result.value.picture, // Lấy hình ảnh từ kết quả API
          diachi: result.value.diachi, // Ensure diachi field is handled
          sdt1: result.value.sdt1,
          sdt2: result.value.sdt2,
          sdt3: result.value.sdt3,
          nguoidaidiendn: result.value.nguoidaidiendn,
          stk1: result.value.stk1,
          tennganhang1: result.value.tennganhang1,
          stk2: result.value.stk2,
          tennganhang2: result.value.tennganhang2,
          stk3: result.value.stk3,
          tennganhang3: result.value.tennganhang3,
        );
        _cachedData = updatedUser; // Cập nhật dữ liệu cache
        return Result.ok(
          updatedUser,
        ); // Trả về kết quả thành công với đối tượng User
      // Nếu kết quả là lỗi với kiểu dữ liệu UserApiModel
      case Error<UserApiModel>():
        return Result.error(
          result.error,
        ); // Trả về kết quả lỗi với thông báo lỗi
    }
  }
}
