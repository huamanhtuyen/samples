// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép BSD-style có thể
// được tìm thấy trong tệp LICENSE.

import 'dart:convert';
import 'dart:io';

import '../../../domain/models/activity/activity.dart';
import '../../../domain/models/continent/continent.dart';
import '../../../domain/models/destination/destination.dart';
import '../../../utils/result.dart';
import 'model/booking/booking_api_model.dart';
import 'model/user/user_api_model.dart';

/// Thêm header `Authentication` vào cấu hình header.
typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({String? host, int? port, HttpClient Function()? clientFactory})
    : _host =
          host ??
          'localhost', // Đặt giá trị mặc định cho host nếu không được cung cấp
      _port =
          port ?? 8080, // Đặt giá trị mặc định cho port nếu không được cung cấp
      _clientFactory =
          clientFactory ??
          HttpClient
              .new; // Đặt giá trị mặc định cho clientFactory nếu không được cung cấp

  final String _host; // Biến lưu trữ host
  final int _port; // Biến lưu trữ port
  final HttpClient Function() _clientFactory; // Hàm tạo HttpClient

  AuthHeaderProvider?
  _authHeaderProvider; // Biến lưu trữ hàm cung cấp header Authentication

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider =
        authHeaderProvider; // Thiết lập hàm cung cấp header Authentication
  }

  Future<void> _authHeader(HttpHeaders headers) async {
    final header =
        _authHeaderProvider?.call(); // Gọi hàm cung cấp header Authentication
    if (header != null) {
      headers.add(
        HttpHeaders.authorizationHeader,
        header,
      ); // Thêm header Authentication vào headers
    }
  }

  Future<Result<List<Continent>>> getContinents() async {
    final client = _clientFactory(); // Tạo HttpClient
    try {
      final request = await client.get(
        _host,
        _port,
        '/continent',
      ); // Gửi yêu cầu GET tới endpoint '/continent'
      await _authHeader(
        request.headers,
      ); // Thêm header Authentication vào yêu cầu
      final response = await request.close(); // Đóng yêu cầu và nhận phản hồi
      if (response.statusCode == 200) {
        final stringData =
            await response
                .transform(utf8.decoder)
                .join(); // Chuyển đổi phản hồi thành chuỗi
        final json =
            jsonDecode(stringData)
                as List<dynamic>; // Giải mã chuỗi JSON thành danh sách động
        return Result.ok(
          json
              .map((element) => Continent.fromJson(element))
              .toList(), // Chuyển đổi danh sách động thành danh sách Continent
        );
      } else {
        return const Result.error(
          HttpException("Invalid response"),
        ); // Trả về lỗi nếu phản hồi không hợp lệ
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    } finally {
      client.close(); // Đóng HttpClient
    }
  }

  Future<Result<List<Destination>>> getDestinations() async {
    final client = _clientFactory(); // Tạo HttpClient
    try {
      final request = await client.get(
        _host,
        _port,
        '/destination',
      ); // Gửi yêu cầu GET tới endpoint '/destination'
      await _authHeader(
        request.headers,
      ); // Thêm header Authentication vào yêu cầu
      final response = await request.close(); // Đóng yêu cầu và nhận phản hồi
      if (response.statusCode == 200) {
        final stringData =
            await response
                .transform(utf8.decoder)
                .join(); // Chuyển đổi phản hồi thành chuỗi
        final json =
            jsonDecode(stringData)
                as List<dynamic>; // Giải mã chuỗi JSON thành danh sách động
        return Result.ok(
          json
              .map((element) => Destination.fromJson(element))
              .toList(), // Chuyển đổi danh sách động thành danh sách Destination
        );
      } else {
        return const Result.error(
          HttpException("Invalid response"),
        ); // Trả về lỗi nếu phản hồi không hợp lệ
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    } finally {
      client.close(); // Đóng HttpClient
    }
  }

  Future<Result<List<Activity>>> getActivityByDestination(String ref) async {
    final client = _clientFactory(); // Tạo HttpClient
    try {
      final request = await client.get(
        _host,
        _port,
        '/destination/$ref/activity', // Gửi yêu cầu GET tới endpoint '/destination/$ref/activity'
      );
      await _authHeader(
        request.headers,
      ); // Thêm header Authentication vào yêu cầu
      final response = await request.close(); // Đóng yêu cầu và nhận phản hồi
      if (response.statusCode == 200) {
        final stringData =
            await response
                .transform(utf8.decoder)
                .join(); // Chuyển đổi phản hồi thành chuỗi
        final json =
            jsonDecode(stringData)
                as List<dynamic>; // Giải mã chuỗi JSON thành danh sách động
        final activities =
            json
                .map((element) => Activity.fromJson(element))
                .toList(); // Chuyển đổi danh sách động thành danh sách Activity
        return Result.ok(activities);
      } else {
        return const Result.error(
          HttpException("Invalid response"),
        ); // Trả về lỗi nếu phản hồi không hợp lệ
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    } finally {
      client.close(); // Đóng HttpClient
    }
  }

  Future<Result<List<BookingApiModel>>> getBookings() async {
    final client = _clientFactory(); // Tạo HttpClient
    try {
      final request = await client.get(
        _host,
        _port,
        '/booking',
      ); // Gửi yêu cầu GET tới endpoint '/booking'
      await _authHeader(
        request.headers,
      ); // Thêm header Authentication vào yêu cầu
      final response = await request.close(); // Đóng yêu cầu và nhận phản hồi
      if (response.statusCode == 200) {
        final stringData =
            await response
                .transform(utf8.decoder)
                .join(); // Chuyển đổi phản hồi thành chuỗi
        final json =
            jsonDecode(stringData)
                as List<dynamic>; // Giải mã chuỗi JSON thành danh sách động
        final bookings =
            json
                .map((element) => BookingApiModel.fromJson(element))
                .toList(); // Chuyển đổi danh sách động thành danh sách BookingApiModel
        return Result.ok(bookings);
      } else {
        return const Result.error(
          HttpException("Invalid response"),
        ); // Trả về lỗi nếu phản hồi không hợp lệ
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    } finally {
      client.close(); // Đóng HttpClient
    }
  }

  Future<Result<BookingApiModel>> getBooking(int id) async {
    final client = _clientFactory(); // Tạo HttpClient
    try {
      final request = await client.get(
        _host,
        _port,
        '/booking/$id',
      ); // Gửi yêu cầu GET tới endpoint '/booking/$id'
      await _authHeader(
        request.headers,
      ); // Thêm header Authentication vào yêu cầu
      final response = await request.close(); // Đóng yêu cầu và nhận phản hồi
      if (response.statusCode == 200) {
        final stringData =
            await response
                .transform(utf8.decoder)
                .join(); // Chuyển đổi phản hồi thành chuỗi
        final booking = BookingApiModel.fromJson(
          jsonDecode(stringData),
        ); // Giải mã chuỗi JSON thành đối tượng BookingApiModel
        return Result.ok(booking);
      } else {
        return const Result.error(
          HttpException("Invalid response"),
        ); // Trả về lỗi nếu phản hồi không hợp lệ
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    } finally {
      client.close(); // Đóng HttpClient
    }
  }

  Future<Result<BookingApiModel>> postBooking(BookingApiModel booking) async {
    final client = _clientFactory(); // Tạo HttpClient
    try {
      final request = await client.post(
        _host,
        _port,
        '/booking',
      ); // Gửi yêu cầu POST tới endpoint '/booking'
      await _authHeader(
        request.headers,
      ); // Thêm header Authentication vào yêu cầu
      request.write(jsonEncode(booking)); // Ghi dữ liệu booking vào yêu cầu
      final response = await request.close(); // Đóng yêu cầu và nhận phản hồi
      if (response.statusCode == 201) {
        final stringData =
            await response
                .transform(utf8.decoder)
                .join(); // Chuyển đổi phản hồi thành chuỗi
        final booking = BookingApiModel.fromJson(
          jsonDecode(stringData),
        ); // Giải mã chuỗi JSON thành đối tượng BookingApiModel
        return Result.ok(booking);
      } else {
        return const Result.error(
          HttpException("Invalid response"),
        ); // Trả về lỗi nếu phản hồi không hợp lệ
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    } finally {
      client.close(); // Đóng HttpClient
    }
  }

  Future<Result<UserApiModel>> getUser() async {
    final client = _clientFactory(); // Tạo HttpClient
    try {
      final request = await client.get(
        _host,
        _port,
        '/user',
      ); // Gửi yêu cầu GET tới endpoint '/user'
      await _authHeader(
        request.headers,
      ); // Thêm header Authentication vào yêu cầu
      final response = await request.close(); // Đóng yêu cầu và nhận phản hồi
      if (response.statusCode == 200) {
        final stringData =
            await response
                .transform(utf8.decoder)
                .join(); // Chuyển đổi phản hồi thành chuỗi
        final user = UserApiModel.fromJson(
          jsonDecode(stringData),
        ); // Giải mã chuỗi JSON thành đối tượng UserApiModel
        return Result.ok(user);
      } else {
        return const Result.error(
          HttpException("Invalid response"),
        ); // Trả về lỗi nếu phản hồi không hợp lệ
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    } finally {
      client.close(); // Đóng HttpClient
    }
  }

  Future<Result<void>> deleteBooking(int id) async {
    final client = _clientFactory(); // Tạo HttpClient
    try {
      final request = await client.delete(
        _host,
        _port,
        '/booking/$id',
      ); // Gửi yêu cầu DELETE tới endpoint '/booking/$id'
      await _authHeader(
        request.headers,
      ); // Thêm header Authentication vào yêu cầu
      final response = await request.close(); // Đóng yêu cầu và nhận phản hồi
      // Phản hồi 204 "No Content", xóa thành công
      if (response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        return const Result.error(
          HttpException("Invalid response"),
        ); // Trả về lỗi nếu phản hồi không hợp lệ
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    } finally {
      client.close(); // Đóng HttpClient
    }
  }
}
