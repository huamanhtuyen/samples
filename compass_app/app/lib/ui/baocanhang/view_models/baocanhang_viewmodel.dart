import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../data/repositories/baocanhang/baocanhang_repository.dart';
import '../../../domain/models/baocanhang/baocanhang_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class BaoCanHangViewModel extends ChangeNotifier {
  BaoCanHangViewModel({
    required BaoCanHangRepository baoCanHangRepository,
  }) : _baoCanHangRepository = baoCanHangRepository {
    load = Command0(_load)..execute();
    deleteBaoCanHang = Command1(_deleteBaoCanHang);
    addBaoCanHang = Command1(_addBaoCanHang);
    updateBaoCanHang = Command1(_updateBaoCanHang);
  }

  final BaoCanHangRepository _baoCanHangRepository;
  final _log = Logger('BaoCanHangViewModel');
  List<BaoCanHang> _baoCanHangs = [];

  List<BaoCanHang> get baoCanHangs => _baoCanHangs;

  late Command0 load;
  late Command1<void, int> deleteBaoCanHang;
  late Command1<void, BaoCanHang> addBaoCanHang;
  late Command1<void, BaoCanHang> updateBaoCanHang;

  Future<Result> _load() async {
    try {
      final listBaoCanHangResult = await _baoCanHangRepository.getAllBaoCanHang();
      switch (listBaoCanHangResult) {
        case Ok<List<BaoCanHang>>():
          _baoCanHangs = listBaoCanHangResult.value;
          _log.fine('Loaded bao can hangs');
        case Error<List<BaoCanHang>>():
          _log.warning('Failed to load bao can hangs', listBaoCanHangResult.error);
      }
      return listBaoCanHangResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteBaoCanHang(int id) async {
    try {
      final resultDelete = await _baoCanHangRepository.deleteBaoCanHang(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted bao can hang $id');
          _baoCanHangs.removeWhere((baoCanHang) => baoCanHang.id == id);
        case Error<void>():
          _log.warning('Failed to delete bao can hang $id', resultDelete.error);
          return resultDelete;
      }
      return resultDelete;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addBaoCanHang(BaoCanHang baoCanHang) async {
    try {
      final resultAdd = await _baoCanHangRepository.addBaoCanHang(baoCanHang);
      switch (resultAdd) {
        case Ok<void>():
          _log.fine('Added bao can hang ${baoCanHang.email}');
          _baoCanHangs.add(baoCanHang);
        case Error<void>():
          _log.warning('Failed to add bao can hang ${baoCanHang.email}', resultAdd.error);
          return resultAdd;
      }
      return resultAdd;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _updateBaoCanHang(BaoCanHang baoCanHang) async {
    try {
      final resultUpdate = await _baoCanHangRepository.updateBaoCanHang(baoCanHang);
      switch (resultUpdate) {
        case Ok<void>():
          _log.fine('Updated bao can hang ${baoCanHang.email}');
          final index = _baoCanHangs.indexWhere((t) => t.id == baoCanHang.id);
          if (index != -1) {
            _baoCanHangs[index] = baoCanHang;
          }
        case Error<void>():
          _log.warning('Failed to update bao can hang ${baoCanHang.email}', resultUpdate.error);
          return resultUpdate;
      }
      return resultUpdate;
    } finally {
      notifyListeners();
    }
  }
}
