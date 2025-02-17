// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import '../../../domain/models/destination/destination.dart'; // Import mô hình Destination
import '../../../utils/result.dart'; // Import lớp Result để xử lý kết quả
import '../../services/api/api_client.dart'; // Import lớp ApiClient để gọi API
import 'destination_repository.dart'; // Import giao diện DestinationRepository

/// Nguồn dữ liệu từ xa cho [Destination].
/// Thực hiện bộ nhớ đệm cục bộ cơ bản.
/// Xem: https://docs.flutter.dev/get-started/fwe/local-caching
class DestinationRepositoryRemote implements DestinationRepository {
  DestinationRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient; // Khởi tạo với ApiClient

  final ApiClient _apiClient; // Biến thành viên để lưu trữ ApiClient

  List<Destination>?
  _cachedData; // Biến thành viên để lưu trữ dữ liệu đã được bộ nhớ đệm

  @override
  Future<Result<List<Destination>>> getDestinations() async {
    if (_cachedData == null) {
      // Nếu không có dữ liệu bộ nhớ đệm
      // Không có dữ liệu bộ nhớ đệm, yêu cầu danh sách điểm đến
      final result =
          await _apiClient
              .getDestinations(); // Gọi API để lấy danh sách điểm đến
      if (result is Ok<List<Destination>>) {
        // Nếu kết quả là Ok
        // Lưu trữ giá trị nếu kết quả là Ok
        _cachedData = result.value; // Lưu trữ dữ liệu vào bộ nhớ đệm
      }
      return result; // Trả về kết quả
    } else {
      // Trả về dữ liệu bộ nhớ đệm nếu có sẵn
      return Result.ok(_cachedData!); // Trả về dữ liệu từ bộ nhớ đệm
    }
  }
}
