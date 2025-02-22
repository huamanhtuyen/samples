import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../data/repositories/thongtinxe/thongtinxe_repository.dart';
import '../../../domain/models/thongtinxe/thongtinxe_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class ThongTinXeViewModel extends ChangeNotifier {
  ThongTinXeViewModel({
    required ThongTinXeRepository thongTinXeRepository,
  }) : _thongTinXeRepository = thongTinXeRepository {
    load = Command0(_load)..execute();
    deleteThongTinXe = Command1(_deleteThongTinXe);
    addThongTinXe = Command1(_addThongTinXe);
    updateThongTinXe = Command1(_updateThongTinXe);
  }

  final ThongTinXeRepository _thongTinXeRepository;
  final _log = Logger('ThongTinXeViewModel');
  List<ThongTinXe> _thongTinXes = [];

  List<ThongTinXe> get thongTinXes => _thongTinXes;

  late Command0 load;
  late Command1<void, int> deleteThongTinXe;
  late Command1<void, ThongTinXe> addThongTinXe;
  late Command1<void, ThongTinXe> updateThongTinXe;

  Future<Result> _load() async {
    try {
      final listThongTinXeResult = await _thongTinXeRepository.getAllThongTinXe();
      switch (listThongTinXeResult) {
        case Ok<List<ThongTinXe>>():
          _thongTinXes = listThongTinXeResult.value;
          _log.fine('Loaded thong tin xes');
        case Error<List<ThongTinXe>>():
          _log.warning('Failed to load thong tin xes', listThongTinXeResult.error);
      }
      return listThongTinXeResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteThongTinXe(int id) async {
    try {
      final resultDelete = await _thongTinXeRepository.deleteThongTinXe(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted thong tin xe $id');
          _thongTinXes.removeWhere((thongTinXe) => thongTinXe.id == id);
        case Error<void>():
          _log.warning('Failed to delete thong tin xe $id', resultDelete.error);
          return resultDelete;
      }
      return resultDelete;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addThongTinXe(ThongTinXe thongTinXe) async {
    try {
      final resultAdd = await _thongTinXeRepository.addThongTinXe(thongTinXe);
      switch (resultAdd) {
        case Ok<void>():
          _log.fine('Added thong tin xe ${thongTinXe.email}');
          _thongTinXes.add(thongTinXe);
        case Error<void>():
          _log.warning('Failed to add thong tin xe ${thongTinXe.email}', resultAdd.error);
          return resultAdd;
      }
      return resultAdd;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _updateThongTinXe(ThongTinXe thongTinXe) async {
    try {
      final resultUpdate = await _thongTinXeRepository.updateThongTinXe(thongTinXe);
      switch (resultUpdate) {
        case Ok<void>():
          _log.fine('Updated thong tin xe ${thongTinXe.email}');
          final index = _thongTinXes.indexWhere((t) => t.id == thongTinXe.id);
          if (index != -1) {
            _thongTinXes[index] = thongTinXe;
          }
        case Error<void>():
          _log.warning('Failed to update thong tin xe ${thongTinXe.email}', resultUpdate.error);
          return resultUpdate;
      }
      return resultUpdate;
    } finally {
      notifyListeners();
    }
  }
}
