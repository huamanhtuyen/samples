import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../utils/result.dart';
import 'model/login_request/login_request.dart';
import 'model/login_response/login_response.dart';

class AuthApiClient {
  AuthApiClient();

  // Phương thức login, trả về một đối tượng Result chứa LoginResponse
  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final supabaseClient = Supabase.instance.client;
      final response = await supabaseClient.auth.signInWithPassword(
        email: loginRequest.email,
        password: loginRequest.password,
      );

      //cách truy cập token
      //final token =response.session!.accessToken;
      print('response=');
      print(response);

      final user = response.user;
      if (user != null) {
        return Result.ok(LoginResponse(token: user.id, userId: user.email!));
      } else {
        return Result.error(Exception('Login failed'));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  // Phương thức logout, trả về một đối tượng Result chứa bool, logout supabase
  Future<Result<bool>> logout() async {
    try {
      final supabaseClient = Supabase.instance.client;
      await supabaseClient.auth.signOut();
      return Result.ok(true);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
