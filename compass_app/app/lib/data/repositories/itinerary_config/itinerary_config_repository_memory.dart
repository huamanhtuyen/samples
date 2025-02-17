// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD
// có trong tệp LICENSE.
//itinerary=hành trình

import 'dart:async'; // Thư viện Dart để làm việc với các tác vụ bất đồng bộ.

import '../../../domain/models/itinerary_config/itinerary_config.dart'; // Import mô hình ItineraryConfig.
import '../../../utils/result.dart'; // Import lớp Result để xử lý kết quả.
import 'itinerary_config_repository.dart'; // Import giao diện ItineraryConfigRepository.

/// Triển khai trong bộ nhớ của [ItineraryConfigRepository].
class ItineraryConfigRepositoryMemory implements ItineraryConfigRepository {
  ItineraryConfig?
  _itineraryConfig; // Biến lưu trữ cấu hình hành trình trong bộ nhớ.

  @override
  Future<Result<ItineraryConfig>> getItineraryConfig() async {
    // Phương thức lấy cấu hình hành trình.
    return Result.ok(
      _itineraryConfig ?? const ItineraryConfig(),
    ); // Trả về cấu hình hành trình hoặc một cấu hình mặc định.
  }

  @override
  Future<Result<bool>> setItineraryConfig(
    ItineraryConfig itineraryConfig,
  ) async {
    // Phương thức thiết lập cấu hình hành trình.
    _itineraryConfig = itineraryConfig; // Lưu cấu hình hành trình vào biến.
    return const Result.ok(true); // Trả về kết quả thành công.
  }
}
