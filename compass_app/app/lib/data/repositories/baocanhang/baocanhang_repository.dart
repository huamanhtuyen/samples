import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/baocanhang/baocanhang_model.dart';
import '../../../utils/result.dart';

class BaoCanHangRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String table = 'baocanhang';

  Future<Result<List<BaoCanHang>>> getAllBaoCanHang() async {
    try {
      final response = await _supabase.from(table).select();
      final list = response.map<BaoCanHang>((json) => BaoCanHang.fromJson(json)).toList();
      return Result.ok(list);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<BaoCanHang?> getBaoCanHangById(String id) async {
    final response = await _supabase.from(table).select().eq('id', id).single();
    return BaoCanHang.fromJson(response);
  }

  Future<Result<void>> addBaoCanHang(BaoCanHang baoCanHang) async {
    try {
      await _supabase.from(table).insert(baoCanHang.toJson());
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> updateBaoCanHang(BaoCanHang baoCanHang) async {
    if (baoCanHang.id == null) {
      return Result.error(Exception('BaoCanHang id cannot be null'));
    }
    try {
      await _supabase.from(table).update(baoCanHang.toJson()).eq('id', baoCanHang.id!);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> deleteBaoCanHang(int id) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
