import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/chothuekho/chothuekho_model.dart';
import '../../../utils/result.dart';

abstract class ChoThueKhoRepository {
  Future<Result<List<ChoThueKho>>> getAllChoThueKho();
  Future<Result<void>> deleteChoThueKho(int id);
  Future<Result<void>> addChoThueKho(ChoThueKho choThueKho);
  Future<Result<void>> updateChoThueKho(ChoThueKho choThueKho);
}

class ChoThueKhoRepositoryImpl implements ChoThueKhoRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String table = 'chothuekho';

  @override
  Future<Result<List<ChoThueKho>>> getAllChoThueKho() async {
    try {
      final response = await _supabase.from(table).select();
      final list =
          response
              .map<ChoThueKho>((json) => ChoThueKho.fromJson(json))
              .toList();
      return Result.ok(list);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<ChoThueKho?> getChoThueKhoById(int id) async {
    final response =
        await _supabase.from(table).select().eq('id', id).limit(1).single();
    return ChoThueKho.fromJson(response);
  }

  @override
  Future<Result<void>> addChoThueKho(ChoThueKho choThueKho) async {
    try {
      final data = choThueKho.toJson();
      data.remove('created_at');
      data.remove('user_id');
      await _supabase.from(table).insert(data);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateChoThueKho(ChoThueKho choThueKho) async {
    if (choThueKho.id == null) {
      return Result.error(Exception('ChoThueKho id cannot be null'));
    }
    try {
      await _supabase
          .from(table)
          .update(choThueKho.toJson())
          .eq('id', choThueKho.id!);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteChoThueKho(int id) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
