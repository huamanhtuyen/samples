// Bản quyền 2024 thuộc về nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được tìm thấy trong tệp LICENSE.

import '../../../../data/repositories/auth/auth_repository.dart'; // Import kho lưu trữ xác thực
import '../../../../data/repositories/itinerary_config/itinerary_config_repository.dart'; // Import kho lưu trữ cấu hình hành trình
import '../../../../domain/models/itinerary_config/itinerary_config.dart'; // Import mô hình cấu hình hành trình
import '../../../../utils/command.dart'; // Import tiện ích lệnh
import '../../../../utils/result.dart'; // Import tiện ích kết quả

class LogoutViewModel {
  LogoutViewModel({
    required AuthRepository authRepository, // Yêu cầu kho lưu trữ xác thực
    required ItineraryConfigRepository
    itineraryConfigRepository, // Yêu cầu kho lưu trữ cấu hình hành trình
  }) : _authLogoutRepository = authRepository, // Khởi tạo kho lưu trữ xác thực
       _itineraryConfigRepository = itineraryConfigRepository {
    // Khởi tạo kho lưu trữ cấu hình hành trình
    logout = Command0(_logout); // Khởi tạo lệnh đăng xuất
  }
  final AuthRepository
  _authLogoutRepository; // Biến lưu trữ kho lưu trữ xác thực
  final ItineraryConfigRepository
  _itineraryConfigRepository; // Biến lưu trữ kho lưu trữ cấu hình hành trình
  late Command0 logout; // Biến lưu trữ lệnh đăng xuất

  Future<Result> _logout() async {
    final result =
        await _authLogoutRepository
            .logout(); // Gọi hàm đăng xuất từ kho lưu trữ xác thực
    switch (result) {
      case Ok<void>(): // Nếu kết quả là thành công
        // Xóa cấu hình hành trình đã lưu trữ
        return _itineraryConfigRepository.setItineraryConfig(
          const ItineraryConfig(), // Đặt lại cấu hình hành trình rỗng
        );
      case Error<void>(): // Nếu kết quả là lỗi
        return result; // Trả về kết quả lỗi
    }
  }
}
