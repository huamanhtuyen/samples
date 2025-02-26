import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/canthuecont/canthuecont_model.dart';
import '../../../utils/result.dart';

class CanThueContRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String table = 'canthuecont';

  Future<Result<List<CanThueCont>>> getAllCanThueCont() async {
    try {
      final response = await _supabase.from(table).select();
      final list =
          response
              .map<CanThueCont>((json) => CanThueCont.fromJson(json))
              .toList();
      return Result.ok(list);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<CanThueCont?> getCanThueContById(int id) async {
    final response =
        await _supabase.from(table).select().eq('id', id).limit(1).single();
    return CanThueCont.fromJson(response);
  }

  Future<Result<void>> addCanThueCont(CanThueCont canThueCont) async {
    try {
      final data = canThueCont.toJson();
      data.remove('created_at');
      data.remove('user_id');
      await _supabase.from(table).insert(data);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> updateCanThueCont(CanThueCont canThueCont) async {
    if (canThueCont.id == null) {
      return Result.error(Exception('CanThueCont id cannot be null'));
    }
    try {
      await _supabase
          .from(table)
          .update(canThueCont.toJson())
          .eq('id', canThueCont.id!);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> deleteCanThueCont(int id) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
