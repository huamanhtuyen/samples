// Bản quyền 2024 Đội Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/itinerary_config/itinerary_config_repository.dart';
import '../../../domain/models/booking/booking.dart';
import '../../../domain/models/itinerary_config/itinerary_config.dart';
import '../../../domain/use_cases/booking/booking_create_use_case.dart';
import '../../../domain/use_cases/booking/booking_share_use_case.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class BookingViewModel extends ChangeNotifier {
  BookingViewModel({
    required BookingCreateUseCase
    createBookingUseCase, // Sử dụng case tạo booking
    required BookingShareUseCase
    shareBookingUseCase, // Sử dụng case chia sẻ booking
    required ItineraryConfigRepository
    itineraryConfigRepository, // Repository cấu hình hành trình
    required BookingRepository bookingRepository, // Repository booking
  }) : _createUseCase = createBookingUseCase,
       _shareUseCase = shareBookingUseCase,
       _itineraryConfigRepository = itineraryConfigRepository,
       _bookingRepository = bookingRepository {
    createBooking = Command0(_createBooking); // Lệnh tạo booking
    shareBooking = Command0(
      () => _shareUseCase.shareBooking(_booking!),
    ); // Lệnh chia sẻ booking
    loadBooking = Command1(_load); // Lệnh tải booking
  }

  final BookingCreateUseCase _createUseCase; // Biến lưu trữ case tạo booking
  final BookingShareUseCase _shareUseCase; // Biến lưu trữ case chia sẻ booking
  final ItineraryConfigRepository
  _itineraryConfigRepository; // Biến lưu trữ repository cấu hình hành trình
  final BookingRepository _bookingRepository; // Biến lưu trữ repository booking
  final _log = Logger('BookingViewModel'); // Logger cho BookingViewModel
  Booking? _booking; // Biến lưu trữ booking hiện tại

  Booking? get booking => _booking; // Getter cho booking

  /// Tạo một booking từ ItineraryConfig
  /// và lưu nó vào danh sách booking của người dùng
  late final Command0 createBooking; // Lệnh tạo booking

  /// Tải booking theo id
  late final Command1<void, int> loadBooking; // Lệnh tải booking

  /// Chia sẻ booking hiện tại bằng hộp thoại chia sẻ của hệ điều hành.
  late final Command0 shareBooking; // Lệnh chia sẻ booking

  Future<Result<void>> _createBooking() async {
    _log.fine('Đang tải booking'); // Ghi log khi bắt đầu tải booking
    final itineraryConfig =
        await _itineraryConfigRepository
            .getItineraryConfig(); // Lấy cấu hình hành trình
    switch (itineraryConfig) {
      case Ok<ItineraryConfig>():
        _log.fine(
          'Đã tải cấu hình hành trình',
        ); // Ghi log khi đã tải cấu hình hành trình
        final result = await _createUseCase.createFrom(
          itineraryConfig.value,
        ); // Tạo booking từ cấu hình hành trình
        switch (result) {
          case Ok<Booking>():
            _log.fine('Đã tạo booking'); // Ghi log khi đã tạo booking
            _booking = result.value; // Lưu booking vào biến
            notifyListeners(); // Thông báo cho các listener
            return const Result.ok(null); // Trả về kết quả thành công
          case Error<Booking>():
            _log.warning(
              'Lỗi booking: ${result.error}',
            ); // Ghi log khi có lỗi booking
            notifyListeners(); // Thông báo cho các listener
            return Result.error(result.error); // Trả về kết quả lỗi
        }
      case Error<ItineraryConfig>():
        _log.warning(
          'Lỗi cấu hình hành trình: ${itineraryConfig.error}',
        ); // Ghi log khi có lỗi cấu hình hành trình
        notifyListeners(); // Thông báo cho các listener
        return Result.error(itineraryConfig.error); // Trả về kết quả lỗi
    }
  }

  Future<Result<void>> _load(int id) async {
    final result = await _bookingRepository.getBooking(
      id,
    ); // Lấy booking theo id
    switch (result) {
      case Ok<Booking>():
        _log.fine('Đã tải booking $id'); // Ghi log khi đã tải booking
        _booking = result.value; // Lưu booking vào biến
        notifyListeners(); // Thông báo cho các listener
      case Error<Booking>():
        _log.warning(
          'Không thể tải booking $id',
        ); // Ghi log khi không thể tải booking
    }
    return result; // Trả về kết quả
  }
}
