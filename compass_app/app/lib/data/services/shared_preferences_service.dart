// Bản quyền 2024 của nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

/*
Tệp shared_preferences_service.dart được sử dụng để quản lý việc lưu trữ và 
truy xuất token trong ứng dụng bằng cách sử dụng thư viện SharedPreferences.
Nó cung cấp các phương thức để lấy và lưu token, 
và ghi lại các hoạt động này bằng cách sử dụng thư viện logging. 
Lớp Result được sử dụng để xử lý kết quả của các hoạt động này, 
bao gồm kết quả thành công hoặc lỗi.
*/
import 'package:logging/logging.dart'; // Import thư viện logging
import 'package:shared_preferences/shared_preferences.dart'; // Import thư viện shared_preferences

import '../../utils/result.dart'; // Import tệp result từ thư mục utils

class SharedPreferencesService {
  static const _tokenKey =
      'TOKEN'; // Khóa token được lưu trữ trong SharedPreferences
  final _log = Logger(
    'SharedPreferencesService',
  ); // Tạo logger cho dịch vụ SharedPreferences

  Future<Result<String?>> fetchToken() async {
    // Hàm bất đồng bộ để lấy token
    try {
      final sharedPreferences =
          await SharedPreferences.getInstance(); // Lấy instance của SharedPreferences
      _log.finer(
        'Got token from SharedPreferences',
      ); // Ghi log khi lấy được token
      return Result.ok(
        sharedPreferences.getString(_tokenKey),
      ); // Trả về token nếu có
    } on Exception catch (e) {
      // Bắt lỗi nếu có ngoại lệ
      _log.warning(
        'Failed to get token',
        e,
      ); // Ghi log khi không lấy được token
      return Result.error(e); // Trả về lỗi
    }
  }

  Future<Result<void>> saveToken(String? token) async {
    // Hàm bất đồng bộ để lưu token
    try {
      final sharedPreferences =
          await SharedPreferences.getInstance(); // Lấy instance của SharedPreferences
      if (token == null) {
        // Nếu token là null
        _log.finer('Removed token'); // Ghi log khi xóa token
        await sharedPreferences.remove(
          _tokenKey,
        ); // Xóa token khỏi SharedPreferences
      } else {
        // Nếu token không phải là null
        _log.finer('Replaced token'); // Ghi log khi thay thế token
        await sharedPreferences.setString(
          _tokenKey,
          token,
        ); // Lưu token vào SharedPreferences
      }
      return const Result.ok(null); // Trả về kết quả thành công
    } on Exception catch (e) {
      // Bắt lỗi nếu có ngoại lệ
      _log.warning(
        'Failed to set token',
        e,
      ); // Ghi log khi không lưu được token
      return Result.error(e); // Trả về lỗi
    }
  }
}
