// Bản quyền 2024 Đội Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.
//continent=châu lục
import '../../../domain/models/continent/continent.dart'; // Import mô hình Continent
import '../../../utils/result.dart'; // Import lớp Result để xử lý kết quả
import '../../services/api/api_client.dart'; // Import lớp ApiClient để gọi API
import 'continent_repository.dart'; // Import giao diện ContinentRepository

/// Nguồn dữ liệu từ xa cho [Continent].
/// Thực hiện bộ nhớ đệm cục bộ cơ bản.
/// Xem: https://docs.flutter.dev/get-started/fwe/local-caching
class ContinentRepositoryRemote implements ContinentRepository {
  // Hàm khởi tạo với đối tượng ApiClient bắt buộc
  ContinentRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient; // Đối tượng ApiClient để gọi API

  List<Continent>? _cachedData; // Biến lưu trữ dữ liệu đã được bộ nhớ đệm

  @override
  Future<Result<List<Continent>>> getContinents() async {
    if (_cachedData == null) {
      // Nếu không có dữ liệu trong bộ nhớ đệm, yêu cầu dữ liệu từ API
      final result = await _apiClient.getContinents();
      if (result is Ok<List<Continent>>) {
        // Lưu trữ giá trị nếu kết quả là Ok
        _cachedData = result.value;
      }
      return result; // Trả về kết quả từ API
    } else {
      // Trả về dữ liệu từ bộ nhớ đệm nếu có
      return Result.ok(_cachedData!);
    }
  }
}
