import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/thongtinxe/thongtinxe_model.dart';
import '../../../utils/result.dart';

class ThongTinXeRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String table = 'thongtinxe';

  /// Lấy danh sách tất cả thông tin xe
  Future<Result<List<ThongTinXe>>> getAllThongTinXe() async {
    try {
      final response = await _supabase.from(table).select();
      final list =
          response
              .map<ThongTinXe>((json) => ThongTinXe.fromJson(json))
              .toList();
      return Result.ok(list);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// Lấy thông tin xe theo ID
  Future<ThongTinXe?> getThongTinXeById(String id) async {
    final response =
        await _supabase.from(table).select().eq('id', id).limit(1).single();
    return ThongTinXe.fromJson(response);
  }

  /// Thêm thông tin xe mới
  Future<Result<void>> addThongTinXe(ThongTinXe thongTinXe) async {
    try {
      await _supabase.from(table).insert(thongTinXe.toJson());
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// Cập nhật thông tin xe
  Future<Result<void>> updateThongTinXe(ThongTinXe thongTinXe) async {
    if (thongTinXe.id == null) {
      return Result.error(Exception('ThongTinXe id cannot be null'));
    }
    try {
      await _supabase
          .from(table)
          .update(thongTinXe.toJson())
          .eq('id', thongTinXe.id!);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// Xóa thông tin xe theo ID
  Future<Result<void>> deleteThongTinXe(int id) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
