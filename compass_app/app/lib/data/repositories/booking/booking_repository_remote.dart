// Bản quyền 2024 Nhóm Flutter. Đã đăng ký bản quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import '../../../domain/models/activity/activity.dart';
import '../../../domain/models/booking/booking.dart';
import '../../../domain/models/booking/booking_summary.dart';
import '../../../domain/models/destination/destination.dart';
import '../../../utils/result.dart';
import '../../services/api/api_client.dart';
import '../../services/api/model/booking/booking_api_model.dart';
import 'booking_repository.dart';

class BookingRepositoryRemote implements BookingRepository {
  // Hàm khởi tạo với tham số bắt buộc là apiClient
  BookingRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient; // Khai báo biến _apiClient

  List<Destination>?
  _cachedDestinations; // Biến lưu trữ danh sách điểm đến đã được cache

  @override
  Future<Result<void>> createBooking(Booking booking) async {
    try {
      // Chuyển đổi đối tượng Booking thành BookingApiModel
      final bookingApiModel = BookingApiModel(
        startDate: booking.startDate,
        endDate: booking.endDate,
        name: '${booking.destination.name}, ${booking.destination.continent}',
        destinationRef: booking.destination.ref,
        activitiesRef:
            booking.activity.map((activity) => activity.ref).toList(),
      );
      // Gửi yêu cầu tạo booking tới server
      return _apiClient.postBooking(bookingApiModel);
    } on Exception catch (e) {
      // Trả về lỗi nếu có ngoại lệ
      return Result.error(e);
    }
  }

  @override
  Future<Result<Booking>> getBooking(int id) async {
    try {
      // Lấy thông tin booking theo ID từ server
      final resultBooking = await _apiClient.getBooking(id);
      switch (resultBooking) {
        case Error<BookingApiModel>():
          return Result.error(resultBooking.error);
        case Ok<BookingApiModel>():
      }
      final booking = resultBooking.value;

      // Tải danh sách điểm đến nếu chưa được tải
      if (_cachedDestinations == null) {
        final resultDestination = await _apiClient.getDestinations();
        switch (resultDestination) {
          case Error<List<Destination>>():
            return Result.error(resultDestination.error);
          case Ok<List<Destination>>():
        }
        _cachedDestinations = resultDestination.value;
      }

      // Lấy điểm đến cho booking
      final destination = _cachedDestinations!.firstWhere(
        (destination) => destination.ref == booking.destinationRef,
      );

      // Lấy danh sách hoạt động theo điểm đến
      final resultActivities = await _apiClient.getActivityByDestination(
        destination.ref,
      );
      switch (resultActivities) {
        case Error<List<Activity>>():
          return Result.error(resultActivities.error);
        case Ok<List<Activity>>():
      }
      final activities =
          resultActivities.value
              .where((activity) => booking.activitiesRef.contains(activity.ref))
              .toList();

      // Trả về đối tượng Booking
      return Result.ok(
        Booking(
          id: booking.id,
          startDate: booking.startDate,
          endDate: booking.endDate,
          destination: destination,
          activity: activities,
        ),
      );
    } on Exception catch (e) {
      // Trả về lỗi nếu có ngoại lệ
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<BookingSummary>>> getBookingsList() async {
    try {
      // Lấy danh sách booking từ server
      final result = await _apiClient.getBookings();
      switch (result) {
        case Ok<List<BookingApiModel>>():
          final bookingsApi = result.value;
          // Chuyển đổi danh sách BookingApiModel thành BookingSummary
          return Result.ok(
            bookingsApi
                .map(
                  (bookingApi) => BookingSummary(
                    id: bookingApi.id!,
                    name: bookingApi.name,
                    startDate: bookingApi.startDate,
                    endDate: bookingApi.endDate,
                  ),
                )
                .toList(),
          );
        case Error<List<BookingApiModel>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      // Trả về lỗi nếu có ngoại lệ
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(int id) async {
    try {
      // Gửi yêu cầu xóa booking tới server
      return _apiClient.deleteBooking(id);
    } on Exception catch (e) {
      // Trả về lỗi nếu có ngoại lệ
      return Result.error(e);
    }
  }
}
