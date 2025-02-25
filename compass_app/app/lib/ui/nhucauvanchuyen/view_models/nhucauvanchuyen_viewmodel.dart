import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../data/repositories/nhucauvanchuyen/nhucauvanchuyen_repository.dart';
import '../../../domain/models/nhucauvanchuyen/nhucauvanchuyen_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class NhuCauVanChuyenViewModel extends ChangeNotifier {
  NhuCauVanChuyenViewModel({
    required NhuCauVanChuyenRepository nhuCauVanChuyenRepository,
  }) : _nhuCauVanChuyenRepository = nhuCauVanChuyenRepository {
    load = Command0(_load)..execute();
    deleteNhuCauVanChuyen = Command1(_deleteNhuCauVanChuyen);
    addNhuCauVanChuyen = Command1(_addNhuCauVanChuyen);
    updateNhuCauVanChuyen = Command1(_updateNhuCauVanChuyen);
  }

  final NhuCauVanChuyenRepository _nhuCauVanChuyenRepository;
  final _log = Logger('NhuCauVanChuyenViewModel');
  List<NhuCauVanChuyen> _nhuCauVanChuyens = [];

  List<NhuCauVanChuyen> get nhuCauVanChuyens => _nhuCauVanChuyens;

  late Command0 load;
  late Command1<void, int> deleteNhuCauVanChuyen;
  late Command1<void, NhuCauVanChuyen> addNhuCauVanChuyen;
  late Command1<void, NhuCauVanChuyen> updateNhuCauVanChuyen;

  Future<Result> _load() async {
    try {
      final listNhuCauVanChuyenResult =
          await _nhuCauVanChuyenRepository.getAllNhuCauVanChuyen();
      switch (listNhuCauVanChuyenResult) {
        case Ok<List<NhuCauVanChuyen>>():
          _nhuCauVanChuyens = listNhuCauVanChuyenResult.value;
          _log.fine('Loaded nhu cau van chuyens');
        case Error<List<NhuCauVanChuyen>>():
          _log.warning(
            'Failed to load nhu cau van chuyens',
            listNhuCauVanChuyenResult.error,
          );
      }
      return listNhuCauVanChuyenResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteNhuCauVanChuyen(int id) async {
    try {
      final resultDelete = await _nhuCauVanChuyenRepository
          .deleteNhuCauVanChuyen(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted nhu cau van chuyen $id');
          _nhuCauVanChuyens.removeWhere(
            (nhuCauVanChuyen) => nhuCauVanChuyen.id == id,
          );
        case Error<void>():
          _log.warning(
            'Failed to delete nhu cau van chuyen $id',
            resultDelete.error,
          );
          return resultDelete;
      }
      return resultDelete;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addNhuCauVanChuyen(
    NhuCauVanChuyen nhuCauVanChuyen,
  ) async {
    try {
      final resultAdd = await _nhuCauVanChuyenRepository.addNhuCauVanChuyen(
        nhuCauVanChuyen,
      );
      switch (resultAdd) {
        case Ok<void>():
          _log.fine('Added nhu cau van chuyen ${nhuCauVanChuyen.id}');
          _nhuCauVanChuyens.add(nhuCauVanChuyen);
        case Error<void>():
          _log.warning(
            'Failed to add nhu cau van chuyen ${nhuCauVanChuyen.id}',
            resultAdd.error,
          );
          return resultAdd;
      }
      return resultAdd;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _updateNhuCauVanChuyen(
    NhuCauVanChuyen nhuCauVanChuyen,
  ) async {
    try {
      final resultUpdate = await _nhuCauVanChuyenRepository
          .updateNhuCauVanChuyen(nhuCauVanChuyen);
      switch (resultUpdate) {
        case Ok<void>():
          _log.fine('Updated nhu cau van chuyen ${nhuCauVanChuyen.id}');
          final index = _nhuCauVanChuyens.indexWhere(
            (t) => t.id == nhuCauVanChuyen.id,
          );
          if (index != -1) {
            _nhuCauVanChuyens[index] = nhuCauVanChuyen;
          }
        case Error<void>():
          _log.warning(
            'Failed to update nhu cau van chuyen ${nhuCauVanChuyen.id}',
            resultUpdate.error,
          );
          return resultUpdate;
      }
      return resultUpdate;
    } finally {
      notifyListeners();
    }
  }
}
