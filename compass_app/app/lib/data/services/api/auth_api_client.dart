// Bản quyền 2024 của nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể
// tìm thấy trong tệp LICENSE.

import 'dart:convert'; // Thư viện để mã hóa và giải mã JSON
import 'dart:io'; // Thư viện để làm việc với các thao tác I/O

import '../../../utils/result.dart'; // Import lớp Result từ thư mục utils
import 'model/login_request/login_request.dart'; // Import lớp LoginRequest
import 'model/login_response/login_response.dart'; // Import lớp LoginResponse

class AuthApiClient {
  // Hàm khởi tạo của AuthApiClient với các tham số tùy chọn host, port và clientFactory
  AuthApiClient({String? host, int? port, HttpClient Function()? clientFactory})
    : _host =
          host ??
          'localhost', // Gán giá trị mặc định cho host nếu không được cung cấp
      _port =
          port ?? 8080, // Gán giá trị mặc định cho port nếu không được cung cấp
      _clientFactory =
          clientFactory ??
          HttpClient
              .new; // Gán giá trị mặc định cho clientFactory nếu không được cung cấp

  final String _host; // Biến lưu trữ host
  final int _port; // Biến lưu trữ port
  final HttpClient Function() _clientFactory; // Biến lưu trữ hàm tạo HttpClient

  // Phương thức login, trả về một đối tượng Result chứa LoginResponse
  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    final client = _clientFactory(); // Tạo một HttpClient mới
    try {
      final request = await client.post(
        _host,
        _port,
        '/login',
      ); // Tạo một yêu cầu POST tới đường dẫn /login
      request.write(
        jsonEncode(loginRequest),
      ); // Ghi dữ liệu loginRequest dưới dạng JSON vào yêu cầu
      final response = await request.close(); // Đóng yêu cầu và chờ phản hồi
      if (response.statusCode == 200) {
        // Kiểm tra mã trạng thái của phản hồi
        final stringData =
            await response
                .transform(utf8.decoder)
                .join(); // Chuyển đổi phản hồi thành chuỗi
        return Result.ok(
          LoginResponse.fromJson(jsonDecode(stringData)),
        ); // Trả về kết quả thành công với dữ liệu LoginResponse
      } else {
        return const Result.error(
          HttpException("Login error"),
        ); // Trả về kết quả lỗi nếu mã trạng thái không phải 200
      }
    } on Exception catch (error) {
      return Result.error(error); // Bắt và trả về lỗi nếu có ngoại lệ xảy ra
    } finally {
      client.close(); // Đóng HttpClient
    }
  }
}
