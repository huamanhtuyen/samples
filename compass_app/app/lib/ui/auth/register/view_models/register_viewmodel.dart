// Bản quyền 2024 Nhóm Flutter. Đã đăng ký bản quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:logging/logging.dart'; // Thư viện để ghi log

import '../../../../data/repositories/auth/auth_repository.dart'; // Thư viện chứa kho lưu trữ xác thực
import '../../../../utils/command.dart'; // Thư viện chứa các lệnh
import '../../../../utils/result.dart'; // Thư viện chứa kết quả

class RegisterViewModel {
  // Hàm khởi tạo với tham số bắt buộc là authRepository
  RegisterViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    // Khởi tạo lệnh register với hàm _register
    register = Command1<void, (String email, String password)>(_register);
  }

  final AuthRepository _authRepository; // Biến lưu trữ kho lưu trữ xác thực
  final _log = Logger('LoginViewModel'); // Biến ghi log

  late Command1 register; // Biến lưu trữ lệnh login

  // Hàm đăng nhập, trả về kết quả dạng Future<Result<void>>
  Future<Result<void>> _register((String, String) credentials) async {
    final (email, password) =
        credentials; // Lấy email và password từ credentials
    final result = await _authRepository.register(
      email: email,
      password: password,
    ); // Gọi hàm register từ kho lưu trữ xác thực
    if (result is Error<void>) {
      _log.warning(
        'Register failed! ${result.error}',
      ); // Ghi log nếu đăng ký thất bại
    }
    return result; // Trả về kết quả
  }
}
