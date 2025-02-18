// Bản quyền 2024 của nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:logging/logging.dart';

import '../../../utils/result.dart';
import '../../services/api/api_client.dart';
import '../../services/api/auth_api_client.dart';
import '../../services/api/model/login_request/login_request.dart';
import '../../services/api/model/login_response/login_response.dart';
import '../../services/shared_preferences_service.dart';
import 'auth_repository.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required ApiClient apiClient,
    required AuthApiClient authApiClient,
    required SharedPreferencesService sharedPreferencesService,
  }) : //_apiClient = apiClient,
       _authApiClient = authApiClient,
       _sharedPreferencesService = sharedPreferencesService {
    //_apiClient.authHeaderProvider = _authHeaderProvider;
  }

  final AuthApiClient _authApiClient; // Khai báo biến AuthApiClient
  //final ApiClient _apiClient; // Khai báo biến ApiClient
  final SharedPreferencesService
  _sharedPreferencesService; // Khai báo biến SharedPreferencesService

  bool? _isAuthenticated; // Biến lưu trạng thái xác thực
  String? _authToken; // Biến lưu token xác thực
  final _log = Logger('AuthRepositoryRemote'); // Biến ghi log

  /// Lấy token từ SharedPreferences
  Future<void> _fetch() async {
    final result =
        await _sharedPreferencesService
            .fetchToken(); // Lấy token từ SharedPreferences
    switch (result) {
      case Ok<String?>():
        _authToken = result.value; // Gán giá trị token
        print('Token: $_authToken');
        _isAuthenticated = result.value != null; // Cập nhật trạng thái xác thực
      case Error<String?>():
        _log.severe('Không thể lấy token từ SharedPreferences', result.error);
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    // Trạng thái đã được lưu trữ
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }
    // Nếu chưa có trạng thái, lấy từ bộ nhớ
    await _fetch();
    return _isAuthenticated ?? false;
  }

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authApiClient.login(
        LoginRequest(email: email, password: password), // Gửi yêu cầu đăng nhập
      );
      switch (result) {
        case Ok<LoginResponse>():
          _log.info('Người dùng đã đăng nhập');
          // Cập nhật trạng thái xác thực
          _isAuthenticated = true;
          _authToken = result.value.token; // Lưu token
          // Lưu token vào SharedPreferences
          return await _sharedPreferencesService.saveToken(result.value.token);
        case Error<LoginResponse>():
          _log.warning('Lỗi khi đăng nhập: ${result.error}');
          return Result.error(result.error);
      }
    } finally {
      notifyListeners(); // Thông báo cho các listeners
    }
  }

  @override
  Future<Result<void>> logout() async {
    _log.info('Người dùng đã đăng xuất');
    try {
      //logout trên supabase
      final resultLogout = await _authApiClient.logout();

      if (resultLogout is Error<bool>) {
        _log.severe('Không thể logout trên supabase');
      }

      // Xóa token đã lưu
      final result = await _sharedPreferencesService.saveToken(null);
      if (result is Error<void>) {
        _log.severe('Không thể xóa token đã lưu');
      }

      // Xóa token trong ApiClient
      _authToken = null;

      // Cập nhật trạng thái xác thực
      _isAuthenticated = false;
      return result;
    } finally {
      notifyListeners(); // Thông báo cho các listeners
    }
  }

  @override
  Future<Result<void>> register({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authApiClient.register(
        LoginRequest(email: email, password: password), // Gửi yêu cầu đăng ký
      );
      switch (result) {
        case Ok<LoginResponse>():
          _log.info('Người dùng đã đăng ký');
          // Cập nhật trạng thái xác thực
          _isAuthenticated = true;
          _authToken = result.value.token; // Lưu token
          // Lưu token vào SharedPreferences
          return await _sharedPreferencesService.saveToken(result.value.token);
        case Error<LoginResponse>():
          _log.warning('Lỗi khi đăng ký: ${result.error}');
          return Result.error(result.error);
      }
    } finally {
      notifyListeners(); // Thông báo cho các listeners
    }
  }

  //vì supabase có cơ chế tự lắng nghe và tự cập nhật token mới rồi nên không cần phương thức này
  // String? _authHeaderProvider() =>
  //     _authToken != null
  //         ? 'Bearer $_authToken'
  //         : null; // Cung cấp header xác thực
} //class
