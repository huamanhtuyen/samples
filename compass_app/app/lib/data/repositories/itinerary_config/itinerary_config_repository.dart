// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD
// có thể được tìm thấy trong tệp LICENSE.

import '../../../domain/models/itinerary_config/itinerary_config.dart'; // Import mô hình ItineraryConfig từ domain
import '../../../utils/result.dart'; // Import lớp Result từ utils

/// Nguồn dữ liệu cho [ItineraryConfig] hiện tại
abstract class ItineraryConfigRepository {
  /// Lấy [ItineraryConfig] hiện tại, có thể trống nếu chưa có cấu hình nào được bắt đầu.
  /// Phương thức này là async để hỗ trợ việc ghi vào cơ sở dữ liệu, tệp, v.v.
  Future<Result<ItineraryConfig>> getItineraryConfig();

  /// Đặt [ItineraryConfig], ghi đè lên cái trước đó đã được lưu trữ.
  /// Trả về Result.Ok nếu việc đặt thành công.
  Future<Result<void>> setItineraryConfig(ItineraryConfig itineraryConfig);
}
