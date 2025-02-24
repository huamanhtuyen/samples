import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/hocsinh/hocsinh_model.dart'; // Import model HocSinh
import '../../../utils/result.dart';

class HocSinhRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String table = 'hocsinh';

  /// Lấy danh sách tất cả học sinh
  Future<Result<List<HocSinh>>> getAllHocSinh() async {
    try {
      final response = await _supabase.from(table).select();
      final list =
          response.map<HocSinh>((json) => HocSinh.fromJson(json)).toList();
      return Result.ok(list);
    } on Exception catch (e) {
      // Trả về lỗi nếu có ngoại lệ
      return Result.error(e);
    }
  }

  /// Lấy thông tin học sinh theo ID
  Future<HocSinh?> getHocSinhById(String id) async {
    final response =
        await _supabase.from(table).select().eq('id', id).limit(1).single();

    return HocSinh.fromJson(response);
  }

  /// Thêm học sinh mới
  Future<Result<void>> addHocSinh(HocSinh hocSinh) async {
    try {
      await _supabase.from(table).insert(hocSinh.toJson());
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// Cập nhật thông tin học sinh
  Future<Result<void>> updateHocSinh(HocSinh hocSinh) async {
    if (hocSinh.id == null) {
      return Result.error(Exception('HocSinh id cannot be null'));
    }
    try {
      await _supabase
          .from(table)
          .update(hocSinh.toJson())
          .eq(
            'id',
            hocSinh.id!,
          ); //dấu ! để báo rằng id không thể null, là kỹ thuật casting
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// Xóa học sinh theo ID
  Future<Result<void>> deleteHocSinh(int id) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
