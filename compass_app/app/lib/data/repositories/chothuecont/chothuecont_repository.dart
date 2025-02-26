import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/chothuecont/chothuecont_model.dart';
import '../../../utils/result.dart';

class ChoThueContRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String table = 'chothuecont';

  Future<Result<List<ChoThueCont>>> getAllChoThueCont() async {
    try {
      final response = await _supabase.from(table).select();
      final list =
          response
              .map<ChoThueCont>((json) => ChoThueCont.fromJson(json))
              .toList();
      return Result.ok(list);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<ChoThueCont?> getChoThueContById(int id) async {
    final response =
        await _supabase.from(table).select().eq('id', id).limit(1).single();
    return ChoThueCont.fromJson(response);
  }

  Future<Result<void>> addChoThueCont(ChoThueCont choThueCont) async {
    try {
      final data = choThueCont.toJson();
      data.remove('created_at');
      data.remove('user_id');
      await _supabase.from(table).insert(data);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> updateChoThueCont(ChoThueCont choThueCont) async {
    if (choThueCont.id == null) {
      return Result.error(Exception('ChoThueCont id cannot be null'));
    }
    try {
      await _supabase
          .from(table)
          .update(choThueCont.toJson())
          .eq('id', choThueCont.id!);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> deleteChoThueCont(int id) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
