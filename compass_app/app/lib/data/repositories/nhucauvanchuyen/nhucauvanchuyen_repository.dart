import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/nhucauvanchuyen/nhucauvanchuyen_model.dart';
import '../../../utils/result.dart';

class NhuCauVanChuyenRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String table = 'nhucauvanchuyen';

  Future<Result<List<NhuCauVanChuyen>>> getAllNhuCauVanChuyen() async {
    try {
      final response = await _supabase.from(table).select();
      final list =
          response
              .map<NhuCauVanChuyen>((json) => NhuCauVanChuyen.fromJson(json))
              .toList();
      return Result.ok(list);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<NhuCauVanChuyen?> getNhuCauVanChuyenById(int id) async {
    final response =
        await _supabase.from(table).select().eq('id', id).limit(1).single();
    return NhuCauVanChuyen.fromJson(response);
  }

  Future<Result<void>> addNhuCauVanChuyen(
    NhuCauVanChuyen nhuCauVanChuyen,
  ) async {
    try {
      await _supabase.from(table).insert(nhuCauVanChuyen.toJson());
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> updateNhuCauVanChuyen(
    NhuCauVanChuyen nhuCauVanChuyen,
  ) async {
    if (nhuCauVanChuyen.id == null) {
      return Result.error(Exception('NhuCauVanChuyen id cannot be null'));
    }
    try {
      await _supabase
          .from(table)
          .update(nhuCauVanChuyen.toJson())
          .eq('id', nhuCauVanChuyen.id!);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> deleteNhuCauVanChuyen(int id) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
