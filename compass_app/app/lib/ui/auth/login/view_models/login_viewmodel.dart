// Bản quyền 2024 Nhóm Flutter. Đã đăng ký bản quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:logging/logging.dart'; // Thư viện để ghi log

import '../../../../data/repositories/auth/auth_repository.dart'; // Thư viện chứa kho lưu trữ xác thực
import '../../../../utils/command.dart'; // Thư viện chứa các lệnh
import '../../../../utils/result.dart'; // Thư viện chứa kết quả

class LoginViewModel {
  // Hàm khởi tạo với tham số bắt buộc là authRepository
  LoginViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    // Khởi tạo lệnh login với hàm _login
    login = Command1<void, (String email, String password)>(_login);
  }

  final AuthRepository _authRepository; // Biến lưu trữ kho lưu trữ xác thực
  final _log = Logger('LoginViewModel'); // Biến ghi log

  late Command1 login; // Biến lưu trữ lệnh login

  // Hàm đăng nhập, trả về kết quả dạng Future<Result<void>>
  Future<Result<void>> _login((String, String) credentials) async {
    final (email, password) =
        credentials; // Lấy email và password từ credentials
    final result = await _authRepository.login(
      email: email,
      password: password,
    ); // Gọi hàm login từ kho lưu trữ xác thực
    if (result is Error<void>) {
      _log.warning(
        'Login failed! ${result.error}',
      ); // Ghi log nếu đăng nhập thất bại
    }
    return result; // Trả về kết quả
  }
}
