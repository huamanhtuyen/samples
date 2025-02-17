// Bản quyền 2024 thuộc về nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD
// có thể được tìm thấy trong tệp LICENSE.

import '../../../domain/models/activity/activity.dart'; // Import mô hình Activity
import '../../../utils/result.dart'; // Import lớp Result để xử lý kết quả
import '../../services/api/api_client.dart'; // Import lớp ApiClient để gọi API
import 'activity_repository.dart'; // Import giao diện ActivityRepository

/// Nguồn dữ liệu từ xa cho [Activity].
/// Thực hiện bộ nhớ đệm cục bộ cơ bản.
/// Xem: https://docs.flutter.dev/get-started/fwe/local-caching
class ActivityRepositoryRemote implements ActivityRepository {
  // Hàm khởi tạo với tham số bắt buộc là apiClient
  ActivityRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient; // Khai báo biến _apiClient

  final Map<String, List<Activity>> _cachedData =
      {}; // Khai báo biến bộ nhớ đệm

  @override
  Future<Result<List<Activity>>> getByDestination(String ref) async {
    if (!_cachedData.containsKey(ref)) {
      // Nếu không có dữ liệu trong bộ nhớ đệm, yêu cầu hoạt động từ API
      final result = await _apiClient.getActivityByDestination(ref);
      if (result is Ok<List<Activity>>) {
        _cachedData[ref] =
            result.value; // Lưu dữ liệu vào bộ nhớ đệm nếu thành công
      }
      return result; // Trả về kết quả từ API
    } else {
      // Trả về dữ liệu từ bộ nhớ đệm nếu có sẵn
      return Result.ok(_cachedData[ref]!);
    }
  }
}
