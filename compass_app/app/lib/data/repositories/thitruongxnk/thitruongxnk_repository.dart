import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/thitruongxnk/thitruongxnk_model.dart';
import '../../../utils/result.dart';

abstract class ThiTruongXNKRepositoryAbstract {
  Future<Result<List<ThiTruongXNK>>> getAllThiTruongXNK();
  Future<Result<void>> deleteThiTruongXNK(int id);
  Future<Result<void>> addThiTruongXNK(ThiTruongXNK thiTruongXNK);
  Future<Result<void>> updateThiTruongXNK(ThiTruongXNK thiTruongXNK);
}

class ThiTruongXNKRepository implements ThiTruongXNKRepositoryAbstract {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String table = 'thitruongxnk';

  @override
  Future<Result<List<ThiTruongXNK>>> getAllThiTruongXNK() async {
    try {
      final response = await _supabase.from(table).select();
      final list =
          response
              .map<ThiTruongXNK>((json) => ThiTruongXNK.fromJson(json))
              .toList();
      return Result.ok(list);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<ThiTruongXNK?> getThiTruongXNKById(int id) async {
    final response =
        await _supabase.from(table).select().eq('id', id).limit(1).single();
    return ThiTruongXNK.fromJson(response);
  }

  @override
  Future<Result<void>> addThiTruongXNK(ThiTruongXNK thiTruongXNK) async {
    try {
      final data = thiTruongXNK.toJson();
      data.remove('created_at');
      data.remove('user_id');
      await _supabase.from(table).insert(data);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateThiTruongXNK(ThiTruongXNK thiTruongXNK) async {
    if (thiTruongXNK.id == null) {
      return Result.error(Exception('ThiTruongXNK id cannot be null'));
    }
    try {
      await _supabase
          .from(table)
          .update(thiTruongXNK.toJson())
          .eq('id', thiTruongXNK.id!);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteThiTruongXNK(int id) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
