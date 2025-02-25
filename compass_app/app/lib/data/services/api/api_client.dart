// ignore_for_file: directives_ordering
import 'dart:convert'; // Thêm dòng này để sử dụng jsonEncode
import 'package:http/http.dart' as http;
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
              .limit(1)
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
              .select()
              .limit(1)
              .single(); // Thêm dữ liệu vào bảng booking và lấy một bản ghi duy nhất

      final newBooking = BookingApiModel.fromJson(
        response,
      ); // Chuyển đổi dữ liệu thành đối tượng BookingApiModel
      return Result.ok(newBooking);
    } on Exception catch (error) {
      return Result.error(error); // Trả về lỗi nếu có ngoại lệ
    }
  }

  Future<Result<UserApiModel>> getUserProfile() async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) {
        return Result.error(Exception('User not authenticated'));
      }

      final response =
          await _supabaseClient
              .from('profiles')
              .select()
              .eq('id', userId)
              .limit(1)
              .single(); // Fetch profile information for the current user

      final userProfile = UserApiModel.fromJson(response);
      return Result.ok(userProfile);
    } on Exception catch (error) {
      return Result.error(error); // Return error if there is an exception
    }
  }

  Future<Result<UserApiModel>> getUser() async {
    try {
      final u = _supabaseClient.auth.currentUser; // Get current user
      final userId = u?.id;
      if (userId == null) {
        return Result.error(Exception('User not authenticated'));
      }

      final response =
          await _supabaseClient
              .from('profiles')
              .select()
              .eq('id', userId)
              .limit(1)
              .single(); // Fetch profile information for the current user
      final userProfile = UserApiModel.fromJson(response);

      final user = UserApiModel(
        id: userProfile.id,
        mst: userProfile.mst ?? '',
        tencty: userProfile.tencty ?? '',
        picture: userProfile.picture ?? '',
        diachi: userProfile.diachi ?? '',
        sdt1: userProfile.sdt1 ?? '',
        sdt2: userProfile.sdt2 ?? '',
        sdt3: userProfile.sdt3 ?? '',
        nguoidaidiendn: userProfile.nguoidaidiendn ?? '',
        stk1: userProfile.stk1 ?? '',
        tennganhang1: userProfile.tennganhang1 ?? '',
        stk2: userProfile.stk2 ?? '',
        tennganhang2: userProfile.tennganhang2 ?? '',
        stk3: userProfile.stk3 ?? '',
        tennganhang3: userProfile.tennganhang3 ?? '',
      );

      return Result.ok(user);
    } on Exception catch (error) {
      return Result.error(error); // Return error if there is an exception
    }
  }

  Future<Result<UserApiModel>> updateUser(UserApiModel user) async {
    try {
      final json = user.toJson();
      print(json);

      final response =
          await _supabaseClient
              .from('profiles')
              .update(user.toJson())
              .eq('id', user.id)
              .select()
              .order('id')
              .limit(1)
              .single(); // Cập nhật dữ liệu người dùng và lấy một bản ghi duy nhất

      if (response.isEmpty) {
        return Result.error(
          Exception('No user found with the given id or response is empty'),
        );
      }

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

  //không chạy ở phía client được do bảo mật service_role key
  // Future<Result<void>> deleteUser() async {
  //   try {
  //     final userId = _supabaseClient.auth.currentUser?.id;
  //     if (userId == null) {
  //       return Result.error(
  //         Exception('User not authenticated'),
  //       ); // Trả về lỗi nếu người dùng chưa đăng nhập
  //     }

  //     //tuyenhm
  //     //tạm
  //     //cái này cần service_role key
  //     //và supabase khuyến cáo là chỉ gọi ở phía server
  //     //không để service_role key ở client
  //     //có 1 hướng là sử dụng edge function tích hợp vào supabase để làm hàm xóa
  //     await _supabaseClient.auth.admin.deleteUser(
  //       userId,
  //     ); // Xóa người dùng từ Supabase
  //     return const Result.ok(null); // Xóa thành công
  //   } on Exception catch (error) {
  //     return Result.error(error); // Trả về lỗi nếu có ngoại lệ
  //   }
  // }

  //dùng phương án gọi đến Edge function của supabase
  //ĐÃ TEST, CHẠY NGON LÀNH
  Future<Result<void>> deleteUser() async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      final accessToken = _supabaseClient.auth.currentSession?.accessToken;
      if (userId == null || accessToken == null) {
        return Result.error(Exception('User not authenticated'));
      }

      final response = await http.post(
        Uri.parse(
          'https://hxetbhwcaqjfmfpnaiiq.supabase.co/functions/v1/deleteUser',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({'userId': userId}),
      );

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        return Result.error(Exception(response.body));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
