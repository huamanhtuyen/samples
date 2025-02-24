// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép BSD-style có thể
// được tìm thấy trong tệp LICENSE.

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/activity/activity.dart';
import '../../../domain/models/continent/continent.dart';
import '../../../domain/models/destination/destination.dart';
import '../../../utils/result.dart';
import 'model/booking/booking_api_model.dart';
import 'model/user/user_api_model.dart';

/// Thêm header `Authentication` vào cấu hình header.
typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient();

  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<Result<List<Continent>>> getContinents() async {
    try {
      final response =
          await _supabaseClient
              .from('continent')
              .select(); // Fetch data from Supabase

      final continents =
          response
              .map<Continent>((element) => Continent.fromJson(element))
              .toList(); // Convert data to list of Continent
      return Result.ok(continents);
    } on Exception catch (error) {
      return Result.error(error); // Return error if there is an exception
    }
  }

  Future<Result<List<Destination>>> getDestinations() async {
    try {
      final response =
          await _supabaseClient
              .from('destination')
              .select(); // Fetch data from Supabase

      final destinations =
          response
              .map<Destination>((element) => Destination.fromJson(element))
              .toList(); // Convert data to list of Destination
      return Result.ok(destinations);
    } on Exception catch (error) {
      return Result.error(error); // Return error if there is an exception
    }
  }

  Future<Result<List<Activity>>> getActivityByDestination(String ref) async {
    try {
      final response = await _supabaseClient
          .from('activity')
          .select()
          .eq('ref', ref); // Truy vấn bảng activity với điều kiện cột ref

      final activities =
          response
              .map<Activity>((element) => Activity.fromJson(element))
              .toList(); // Chuyển đổi dữ liệu thành danh sách Activity
      return Result.ok(activities);
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    }
  }

  Future<Result<List<BookingApiModel>>> getBookings() async {
    try {
      final response =
          await _supabaseClient
              .from('booking')
              .select(); // Fetch data from Supabase

      final bookings =
          response
              .map<BookingApiModel>(
                (element) => BookingApiModel.fromJson(element),
              )
              .toList(); // Convert data to list of BookingApiModel
      return Result.ok(bookings);
    } on Exception catch (error) {
      return Result.error(error); // Return error if there is an exception
    }
  }

  Future<Result<BookingApiModel>> getBooking(int id) async {
    try {
      final response =
          await _supabaseClient
              .from('booking')
              .select()
              .eq('id', id)
              .single(); // Truy vấn bảng booking với điều kiện cột id và lấy một bản ghi duy nhất

      final booking = BookingApiModel.fromJson(
        response,
      ); // Chuyển đổi dữ liệu thành đối tượng BookingApiModel
      return Result.ok(booking);
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    }
  }

  Future<Result<BookingApiModel>> postBooking(BookingApiModel booking) async {
    try {
      final response =
          await _supabaseClient
              .from('booking')
              .insert(booking.toJson())
              .single(); // Thêm dữ liệu vào bảng booking và lấy một bản ghi duy nhất

      final newBooking = BookingApiModel.fromJson(
        response,
      ); // Chuyển đổi dữ liệu thành đối tượng BookingApiModel
      return Result.ok(newBooking);
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    }
  }

  Future<Result<UserApiModel>> getUser() async {
    try {
      final u = _supabaseClient.auth.currentUser; // Get current user
      final user = UserApiModel(
        email: u?.email ?? '',
        id: u?.id ?? '',
        name: u?.email ?? '',
        picture: '',
      );

      return Result.ok(user);
    } on Exception catch (error) {
      return Result.error(error); // Return error if there is an exception
    }
  }

  Future<Result<UserApiModel>> updateUser(UserApiModel user) async {
    try {
      final response =
          await _supabaseClient
              .from('user')
              .update(user.toJson())
              .eq('id', user.id)
              .single(); // Cập nhật dữ liệu người dùng và lấy một bản ghi duy nhất

      final updatedUser = UserApiModel.fromJson(
        response,
      ); // Chuyển đổi dữ liệu thành đối tượng UserApiModel
      return Result.ok(
        updatedUser,
      ); // Trả về kết quả thành công với đối tượng UserApiModel
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    }
  }

  Future<Result<void>> deleteBooking(int id) async {
    try {
      final response = await _supabaseClient
          .from('booking')
          .delete()
          .eq('id', id); // Sử dụng Supabase client để xóa bản ghi

      if (response.error == null) {
        return const Result.ok(null); // Xóa thành công
      } else {
        return Result.error(
          response.error!.message,
        ); // Trả về lỗi nếu có lỗi từ Supabase
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    }
  }

  Future<Result<void>> deleteUser() async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) {
        return Result.error(
          Exception('User not authenticated'),
        ); // Trả về lỗi nếu người dùng chưa đăng nhập
      }

      final response = await _supabaseClient
          .from('user')
          .delete()
          .eq('id', userId); // Xóa người dùng hiện tại

      if (response.error == null) {
        return const Result.ok(null); // Xóa thành công
      } else {
        return Result.error(
          response.error!.message,
        ); // Trả về lỗi nếu có lỗi từ Supabase
      }
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    }
  }
}
