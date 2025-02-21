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
    final response = await _supabase.from(table).select().eq('id', id).single();

    return HocSinh.fromJson(response);
  }

  /// Thêm học sinh mới
  Future<void> addHocSinh(HocSinh hocSinh) async {
    await _supabase.from(table).insert(hocSinh.toJson());
  }

  /// Cập nhật thông tin học sinh
  Future<void> updateHocSinh(HocSinh hocSinh) async {
    await _supabase.from(table).update(hocSinh.toJson()).eq('id', hocSinh.id);
  }

  /// Xóa học sinh theo ID
  Future<void> deleteHocSinh(String id) async {
    await _supabase.from(table).delete().eq('id', id);
  }
}
