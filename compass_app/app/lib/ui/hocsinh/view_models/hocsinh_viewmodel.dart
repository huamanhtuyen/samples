// ignore_for_file: directives_ordering

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/hocsinh/hocsinh_repository.dart';
import '../../../domain/models/hocsinh/hocsinh_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

// Lớp HomeViewModel kế thừa từ ChangeNotifier
class HocSinhViewModel extends ChangeNotifier {
  // Hàm khởi tạo của HomeViewModel
  HocSinhViewModel({
    required HocSinhRepository hocSinhRepository, //
  }) : _hocSinhRepository =
           hocSinhRepository // Gán giá trị cho biến _hocSinhRepository
           {
    // Gán giá trị cho biến _userRepository
    load = Command0(_load)..execute(); // Khởi tạo và thực thi lệnh load
    //deleteBooking = Command1(_deleteBooking); // Khởi tạo lệnh deleteBooking
  }

  final HocSinhRepository
  _hocSinhRepository; // Biến lưu trữ đối tượng HocSinhRepository

  final _log = Logger('HocSinhViewModel'); // Biến lưu trữ đối tượng Logger
  List<HocSinh> _hocsinhs = []; // Danh sách lưu trữ danh sách học sinh

  List<HocSinh> get hocsinhs => _hocsinhs; // Getter cho danh sách học sinh

  late Command0 load; // Lệnh load
  //late Command1<void, int> deleteBooking; // Lệnh delete

  // Hàm load dữ liệu
  Future<Result> _load() async {
    try {
      final listHocSinhResult = await _hocSinhRepository.getAllHocSinh(); //
      switch (listHocSinhResult) {
        case Ok<List<HocSinh>>():
          _hocsinhs =
              listHocSinhResult.value; // Gán giá trị cho danh sách học sinh
          _log.fine('Loaded hoc sinhs'); // Ghi log khi load thành công
        case Error<List<HocSinh>>():
          _log.warning(
            'Failed to load hoc sinhs',
            listHocSinhResult.error,
          ); // Ghi log khi load thất bại
      }

      return listHocSinhResult; // Trả về kết quả
    } finally {
      notifyListeners(); // Thông báo cho các listener
    }
  }

  //   // Hàm xóa booking
  //   Future<Result<void>> _deleteBooking(int id) async {
  //     try {
  //       final resultDelete = await _bookingRepository.delete(
  //         id,
  //       ); // Xóa booking từ repository
  //       switch (resultDelete) {
  //         case Ok<void>():
  //           _log.fine('Deleted booking $id'); // Ghi log khi xóa thành công
  //         case Error<void>():
  //           _log.warning(
  //             'Failed to delete booking $id',
  //             resultDelete.error,
  //           ); // Ghi log khi xóa thất bại
  //           return resultDelete; // Trả về kết quả lỗi
  //       }

  //       // Sau khi xóa booking, cần load lại danh sách bookings.
  //       // BookingRepository là nguồn dữ liệu chính xác cho bookings.
  //       final resultLoadBookings =
  //           await _bookingRepository
  //               .getBookingsList(); // Lấy lại danh sách bookings từ repository
  //       switch (resultLoadBookings) {
  //         case Ok<List<BookingSummary>>():
  //           _bookings =
  //               resultLoadBookings.value; // Gán giá trị cho danh sách bookings
  //           _log.fine('Loaded bookings'); // Ghi log khi load thành công
  //         case Error<List<BookingSummary>>():
  //           _log.warning(
  //             'Failed to load bookings',
  //             resultLoadBookings.error,
  //           ); // Ghi log khi load thất bại
  //           return resultLoadBookings; // Trả về kết quả lỗi
  //       }

  //       return resultLoadBookings; // Trả về kết quả
  //     } finally {
  //       notifyListeners(); // Thông báo cho các listener
  //     }
  //   }
}
