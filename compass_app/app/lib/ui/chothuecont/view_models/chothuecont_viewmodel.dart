// ignore_for_file: directives_ordering
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../data/repositories/chothuecont/chothuecont_repository.dart';
import '../../../domain/models/chothuecont/chothuecont_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../../../data/repositories/image_repository.dart';

class ChoThueContViewModel extends ChangeNotifier {
  ChoThueContViewModel({
    required ChoThueContRepository choThueContRepository,
    required ImageRepository imageRepository,
  }) : _choThueContRepository = choThueContRepository,
       _imageRepository = imageRepository {
    load = Command0(_load)..execute();
    deleteChoThueCont = Command1(_deleteChoThueCont);
    addChoThueCont = Command1(_addChoThueCont);
    updateChoThueCont = Command1(_updateChoThueCont);
    pickAndUploadImage = Command0(_pickAndUploadImage);
  }

  final ChoThueContRepository _choThueContRepository;
  final ImageRepository _imageRepository;
  final _log = Logger('ChoThueContViewModel');
  List<ChoThueCont> _choThueConts = [];

  List<ChoThueCont> get choThueConts => _choThueConts;

  late Command0 load;
  late Command1<void, int> deleteChoThueCont;
  late Command1<void, ChoThueCont> addChoThueCont;
  late Command1<void, ChoThueCont> updateChoThueCont;
  late Command0<String?> pickAndUploadImage;

  Future<Result> _load() async {
    try {
      final listChoThueContResult =
          await _choThueContRepository.getAllChoThueCont();
      switch (listChoThueContResult) {
        case Ok<List<ChoThueCont>>():
          _choThueConts = listChoThueContResult.value;
          _log.fine('Loaded cho thue conts');
        case Error<List<ChoThueCont>>():
          _log.warning(
            'Failed to load cho thue conts',
            listChoThueContResult.error,
          );
      }
      return listChoThueContResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteChoThueCont(int id) async {
    try {
      final resultDelete = await _choThueContRepository.deleteChoThueCont(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted cho thue cont $id');
          _choThueConts.removeWhere((choThueCont) => choThueCont.id == id);
        case Error<void>():
          _log.warning(
            'Failed to delete cho thue cont $id',
            resultDelete.error,
          );
          return resultDelete;
      }
      return resultDelete;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addChoThueCont(ChoThueCont choThueCont) async {
    try {
      final resultAdd = await _choThueContRepository.addChoThueCont(
        choThueCont,
      );
      switch (resultAdd) {
        case Ok<void>():
          _log.fine('Added cho thue cont ${choThueCont.id}');
          _choThueConts.add(choThueCont);
        case Error<void>():
          _log.warning(
            'Failed to add cho thue cont ${choThueCont.id}',
            resultAdd.error,
          );
          return resultAdd;
      }
      return resultAdd;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _updateChoThueCont(ChoThueCont choThueCont) async {
    try {
      final resultUpdate = await _choThueContRepository.updateChoThueCont(
        choThueCont,
      );
      switch (resultUpdate) {
        case Ok<void>():
          _log.fine('Updated cho thue cont ${choThueCont.id}');
          final index = _choThueConts.indexWhere((t) => t.id == choThueCont.id);
          if (index != -1) {
            _choThueConts[index] = choThueCont;
          }
        case Error<void>():
          _log.warning(
            'Failed to update cho thue cont ${choThueCont.id}',
            resultUpdate.error,
          );
          return resultUpdate;
      }
      return resultUpdate;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<String?>> _pickAndUploadImage() async {
    try {
      final result = await _imageRepository.pickAndUploadImage();
      switch (result) {
        case Ok<String?>():
          _log.fine('Uploaded image');
        case Error<String?>():
          _log.warning('Upload image failure', result.error);
      }
      return result;
    } finally {
      notifyListeners();
    }
  }
}
