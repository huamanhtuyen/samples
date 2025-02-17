// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:logging/logging.dart';

import '../../../data/repositories/activity/activity_repository.dart';
import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/destination/destination_repository.dart';
import '../../../utils/result.dart';
import '../../models/activity/activity.dart';
import '../../models/booking/booking.dart';
import '../../models/destination/destination.dart';
import '../../models/itinerary_config/itinerary_config.dart';

/// UseCase để tạo đối tượng [Booking] từ [ItineraryConfig].
///
/// Lấy các đối tượng [Destination] và [Activity] từ các kho lưu trữ,
/// kiểm tra xem ngày đã được đặt chưa và tạo đối tượng [Booking].
class BookingCreateUseCase {
  BookingCreateUseCase({
    required DestinationRepository destinationRepository,
    required ActivityRepository activityRepository,
    required BookingRepository bookingRepository,
  }) : _destinationRepository = destinationRepository,
       _activityRepository = activityRepository,
       _bookingRepository = bookingRepository;

  final DestinationRepository _destinationRepository; // Kho lưu trữ điểm đến
  final ActivityRepository _activityRepository; // Kho lưu trữ hoạt động
  final BookingRepository _bookingRepository; // Kho lưu trữ đặt chỗ
  final _log = Logger(
    'BookingCreateUseCase',
  ); // Logger để ghi lại các thông báo

  /// Tạo [Booking] từ [ItineraryConfig] đã lưu trữ
  Future<Result<Booking>> createFrom(ItineraryConfig itineraryConfig) async {
    // Lấy đối tượng Destination từ kho lưu trữ
    if (itineraryConfig.destination == null) {
      _log.warning(
        'Destination is not set',
      ); // Cảnh báo nếu điểm đến chưa được đặt
      return Result.error(Exception('Destination is not set'));
    }
    final destinationResult = await _fetchDestination(
      itineraryConfig.destination!,
    );
    switch (destinationResult) {
      case Ok<Destination>():
        _log.fine(
          'Destination loaded: ${destinationResult.value.ref}',
        ); // Ghi lại thông tin điểm đến đã tải
      case Error<Destination>():
        _log.warning(
          'Error fetching destination: ${destinationResult.error}',
        ); // Cảnh báo nếu có lỗi khi lấy điểm đến
        return Result.error(destinationResult.error);
    }

    // Lấy các đối tượng Activity từ kho lưu trữ
    if (itineraryConfig.activities.isEmpty) {
      _log.warning(
        'Activities are not set',
      ); // Cảnh báo nếu hoạt động chưa được đặt
      return Result.error(Exception('Activities are not set'));
    }
    final activitiesResult = await _activityRepository.getByDestination(
      itineraryConfig.destination!,
    );
    switch (activitiesResult) {
      case Error<List<Activity>>():
        _log.warning(
          'Error fetching activities: ${activitiesResult.error}',
        ); // Cảnh báo nếu có lỗi khi lấy hoạt động
        return Result.error(activitiesResult.error);
      case Ok<List<Activity>>():
    }
    final activities =
        activitiesResult.value
            .where(
              (activity) => itineraryConfig.activities.contains(activity.ref),
            )
            .toList();
    _log.fine(
      'Activities loaded (${activities.length})',
    ); // Ghi lại số lượng hoạt động đã tải

    // Kiểm tra xem ngày đã được đặt chưa
    if (itineraryConfig.startDate == null || itineraryConfig.endDate == null) {
      _log.warning('Dates are not set'); // Cảnh báo nếu ngày chưa được đặt
      return Result.error(Exception('Dates are not set'));
    }

    final booking = Booking(
      startDate: itineraryConfig.startDate!,
      endDate: itineraryConfig.endDate!,
      destination: destinationResult.value,
      activity: activities,
    );

    final saveBookingResult = await _bookingRepository.createBooking(booking);
    switch (saveBookingResult) {
      case Ok<void>():
        _log.fine(
          'Booking saved successfully',
        ); // Ghi lại thông tin đặt chỗ đã lưu thành công
        break;
      case Error<void>():
        _log.warning(
          'Failed to save booking',
          saveBookingResult.error,
        ); // Cảnh báo nếu có lỗi khi lưu đặt chỗ
        return Result.error(saveBookingResult.error);
    }

    // Tạo đối tượng Booking
    return Result.ok(booking);
  }

  Future<Result<Destination>> _fetchDestination(String destinationRef) async {
    final result = await _destinationRepository.getDestinations();
    switch (result) {
      case Ok<List<Destination>>():
        final destination = result.value.firstWhere(
          (destination) => destination.ref == destinationRef,
        );
        return Result.ok(destination);
      case Error<List<Destination>>():
        return Result.error(result.error);
    }
  }
}
