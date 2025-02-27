import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/models/canthuekho/canthuekho_model.dart';
import '../../../utils/result.dart';

abstract class CanThueKhoRepositoryAbstract {
  Future<Result<List<CanThueKho>>> getAllCanThueKho();
  Future<Result<void>> deleteCanThueKho(int id);
  Future<Result<void>> addCanThueKho(CanThueKho canThueKho);
  Future<Result<void>> updateCanThueKho(CanThueKho canThueKho);
}

class CanThueKhoRepository implements CanThueKhoRepositoryAbstract {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String table = 'canthuekho';

  @override
  Future<Result<List<CanThueKho>>> getAllCanThueKho() async {
    try {
      final response = await _supabase.from(table).select();
      final list =
          response
              .map<CanThueKho>((json) => CanThueKho.fromJson(json))
              .toList();
      return Result.ok(list);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<CanThueKho?> getCanThueKhoById(int id) async {
    final response =
        await _supabase.from(table).select().eq('id', id).limit(1).single();
    return CanThueKho.fromJson(response);
  }

  @override
  Future<Result<void>> addCanThueKho(CanThueKho canThueKho) async {
    try {
      final data = canThueKho.toJson();
      data.remove('created_at');
      data.remove('user_id');
      await _supabase.from(table).insert(data);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateCanThueKho(CanThueKho canThueKho) async {
    if (canThueKho.id == null) {
      return Result.error(Exception('CanThueKho id cannot be null'));
    }
    try {
      await _supabase
          .from(table)
          .update(canThueKho.toJson())
          .eq('id', canThueKho.id!);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteCanThueKho(int id) async {
    try {
      await _supabase.from(table).delete().eq('id', id);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
