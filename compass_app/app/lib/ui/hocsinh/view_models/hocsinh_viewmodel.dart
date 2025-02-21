// ignore_for_file: directives_ordering

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/hocsinh/hocsinh_repository.dart';
import '../../../domain/models/hocsinh/hocsinh_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

// Lớp HomeViewModel kế thừa từ ChangeNotifier
class HocSinhViewModel extends ChangeNotifier {
  // Hàm khởi tạo của HomeViewModel
  HocSinhViewModel({
    required HocSinhRepository hocSinhRepository, //
  }) : _hocSinhRepository =
           hocSinhRepository // Gán giá trị cho biến _hocSinhRepository
           {
    // Gán giá trị cho biến _userRepository
    load = Command0(_load)..execute(); // Khởi tạo và thực thi lệnh load
    deleteHocSinh = Command1(_deleteHocSinh); // Khởi tạo lệnh deleteHocSinh
    addHocSinh = Command1(_addHocSinh); // Khởi tạo lệnh addHocSinh
  }

  final HocSinhRepository
  _hocSinhRepository; // Biến lưu trữ đối tượng HocSinhRepository

  final _log = Logger('HocSinhViewModel'); // Biến lưu trữ đối tượng Logger
  List<HocSinh> _hocsinhs = []; // Danh sách lưu trữ danh sách học sinh

  List<HocSinh> get hocsinhs => _hocsinhs; // Getter cho danh sách học sinh

  late Command0 load; // Lệnh load
  late Command1<void, int> deleteHocSinh; // Lệnh deleteHocSinh
  late Command1<void, HocSinh> addHocSinh; // Lệnh addHocSinh

  // Hàm load dữ liệu
  Future<Result> _load() async {
    try {
      final listHocSinhResult = await _hocSinhRepository.getAllHocSinh(); //
      switch (listHocSinhResult) {
        case Ok<List<HocSinh>>():
          _hocsinhs =
              listHocSinhResult.value; // Gán giá trị cho danh sách học sinh
          _log.fine('Loaded hoc sinhs'); // Ghi log khi load thành công
        case Error<List<HocSinh>>():
          _log.warning(
            'Failed to load hoc sinhs',
            listHocSinhResult.error,
          ); // Ghi log khi load thất bại
      }

      return listHocSinhResult; // Trả về kết quả
    } finally {
      notifyListeners(); // Thông báo cho các listener
    }
  }

  Future<Result<void>> _deleteHocSinh(int id) async {
    try {
      final resultDelete = await _hocSinhRepository.deleteHocSinh(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted hoc sinh $id');
          _hocsinhs.removeWhere((hocSinh) => hocSinh.id == id);
        case Error<void>():
          _log.warning('Failed to delete hoc sinh $id', resultDelete.error);
          return resultDelete;
      }
      return resultDelete;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addHocSinh(HocSinh hocSinh) async {
    try {
      final resultAdd = await _hocSinhRepository.addHocSinh(hocSinh);
      switch (resultAdd) {
        case Ok<void>():
          _log.fine('Added hoc sinh ${hocSinh.hoten}');
          _hocsinhs.add(hocSinh);
        case Error<void>():
          _log.warning(
            'Failed to add hoc sinh ${hocSinh.hoten}',
            resultAdd.error,
          );
          return resultAdd;
      }
      return resultAdd;
    } finally {
      notifyListeners();
    }
  }
}
