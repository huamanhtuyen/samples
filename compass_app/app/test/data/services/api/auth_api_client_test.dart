// Bản quyền 2024 của nhóm Flutter. Đã bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

//import 'package:compass_app/data/services/api/auth_api_client.dart'; // Import AuthApiClient từ thư mục dịch vụ API
//import 'package:compass_app/data/services/api/model/login_request/login_request.dart'; // Import model LoginRequest
//import 'package:compass_app/data/services/api/model/login_response/login_response.dart'; // Import model LoginResponse
import 'package:flutter_test/flutter_test.dart'; // Import thư viện kiểm thử của Flutter
//import 'package:mockito/mockito.dart'; // Import thư viện Mockito để tạo mock objects
import 'package:shared_preferences/shared_preferences.dart'; // Import thư viện shared_preferences
import 'package:supabase_flutter/supabase_flutter.dart'; // Import thư viện Supabase cho Flutter
//import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import thư viện dotenv để sử dụng biến môi trường

//import '../../../../testing/utils/result.dart'; // Import tiện ích Result từ thư mục testing

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized(); // Đảm bảo môi trường kiểm thử Flutter được khởi tạo

  SharedPreferences.setMockInitialValues(
    {},
  ); // Thiết lập giá trị mặc định cho shared_preferences

  group('AuthApiClient', () {
    // Tạo nhóm kiểm thử cho AuthApiClient

    setUp(() async {});

    test('should post login', () async {
      // Kiểm thử hàm login
      //cái mong muốn trả về
      // final loginResponse = LoginResponse(
      //   // Tạo đối tượng LoginResponse mẫu
      //   token: 'TOKEN',
      //   userId: '123',
      // );

      //Khởi tạo kết nối đến supabase
      await Supabase.initialize(
        url: 'https://hxetbhwcaqjfmfpnaiiq.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4ZXRiaHdjYXFqZm1mcG5haWlxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk2NjYzNDAsImV4cCI6MjA1NTI0MjM0MH0.I-a7DHYtOVNt5oB9EUrfBwqff0bj8AruMlVab37ZyZY',
      );
      // final supabaseClient = SupabaseClient(
      //   'https://hxetbhwcaqjfmfpnaiiq.supabase.co',
      //   'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4ZXRiaHdjYXFqZm1mcG5haWlxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk2NjYzNDAsImV4cCI6MjA1NTI0MjM0MH0.I-a7DHYtOVNt5oB9EUrfBwqff0bj8AruMlVab37ZyZY',
      // );
      final supabase = Supabase.instance.client;

      // final apiClient = AuthApiClient(
      //   supabaseClient: supabaseClient,
      // ); // Initialize apiClient

      // final result = await apiClient.login(
      //   // Gọi hàm login trên apiClient
      //   const LoginRequest(
      //     email: 'test1@gmail.com',
      //     password: '123456',
      //   ), // Truyền vào LoginRequest mẫu
      // );

      final response = await supabase.auth.signInWithPassword(
        email: 'test1',
        password: '123456',
      );

      // final response = await supabaseClient.auth.signInWithPassword(
      //   email: 'test1@gmail.com',
      //   password: '123456',
      // );
      print('response=');
      print(response);
      //print('Error: ${result.asError.error}');

      // expect(
      //   result.asOk.value,
      //   loginResponse,
      // ); // Kiểm tra kết quả trả về không null
    });
  });
}
