// ignore_for_file: directives_ordering

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../domain/models/booking/booking_summary.dart';
import '../../../domain/models/user/user.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

// Lớp HomeViewModel kế thừa từ ChangeNotifier
class ChuHangViewModel extends ChangeNotifier {
  // Hàm khởi tạo của HomeViewModel
  ChuHangViewModel({
    required BookingRepository
    bookingRepository, // Tham số bắt buộc bookingRepository
    required UserRepository userRepository, // Tham số bắt buộc userRepository
  }) : _bookingRepository =
           bookingRepository, // Gán giá trị cho biến _bookingRepository
       _userRepository = userRepository {
    // Gán giá trị cho biến _userRepository
    load = Command0(_load)..execute(); // Khởi tạo và thực thi lệnh load
    deleteBooking = Command1(_deleteBooking); // Khởi tạo lệnh deleteBooking
  }

  final BookingRepository
  _bookingRepository; // Biến lưu trữ đối tượng BookingRepository
  final UserRepository _userRepository; // Biến lưu trữ đối tượng UserRepository
  final _log = Logger('HomeViewModel'); // Biến lưu trữ đối tượng Logger
  List<BookingSummary> _bookings = []; // Danh sách lưu trữ các booking
  User? _user; // Biến lưu trữ thông tin người dùng

  late Command0 load; // Lệnh load
  late Command1<void, int> deleteBooking; // Lệnh deleteBooking

  List<BookingSummary> get bookings =>
      _bookings; // Getter cho danh sách bookings

  User? get user => _user; // Getter cho thông tin người dùng

  // Hàm load dữ liệu
  Future<Result> _load() async {
    try {
      final result =
          await _bookingRepository
              .getBookingsList(); // Lấy danh sách bookings từ repository
      switch (result) {
        case Ok<List<BookingSummary>>():
          _bookings = result.value; // Gán giá trị cho danh sách bookings
          _log.fine('Loaded bookings'); // Ghi log khi load thành công
        case Error<List<BookingSummary>>():
          _log.warning(
            'Failed to load bookings',
            result.error,
          ); // Ghi log khi load thất bại
          return result; // Trả về kết quả lỗi
      }

      final userResult =
          await _userRepository
              .getUser(); // Lấy thông tin người dùng từ repository
      switch (userResult) {
        case Ok<User>():
          _user = userResult.value; // Gán giá trị cho biến user
          _log.fine('Loaded user'); // Ghi log khi load thành công
        case Error<User>():
          _log.warning(
            'Failed to load user',
            userResult.error,
          ); // Ghi log khi load thất bại
      }

      return userResult; // Trả về kết quả
    } finally {
      notifyListeners(); // Thông báo cho các listener
    }
  }

  // Hàm xóa booking
  Future<Result<void>> _deleteBooking(int id) async {
    try {
      final resultDelete = await _bookingRepository.delete(
        id,
      ); // Xóa booking từ repository
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted booking $id'); // Ghi log khi xóa thành công
        case Error<void>():
          _log.warning(
            'Failed to delete booking $id',
            resultDelete.error,
          ); // Ghi log khi xóa thất bại
          return resultDelete; // Trả về kết quả lỗi
      }

      // Sau khi xóa booking, cần load lại danh sách bookings.
      // BookingRepository là nguồn dữ liệu chính xác cho bookings.
      final resultLoadBookings =
          await _bookingRepository
              .getBookingsList(); // Lấy lại danh sách bookings từ repository
      switch (resultLoadBookings) {
        case Ok<List<BookingSummary>>():
          _bookings =
              resultLoadBookings.value; // Gán giá trị cho danh sách bookings
          _log.fine('Loaded bookings'); // Ghi log khi load thành công
        case Error<List<BookingSummary>>():
          _log.warning(
            'Failed to load bookings',
            resultLoadBookings.error,
          ); // Ghi log khi load thất bại
          return resultLoadBookings; // Trả về kết quả lỗi
      }

      return resultLoadBookings; // Trả về kết quả
    } finally {
      notifyListeners(); // Thông báo cho các listener
    }
  }
}
