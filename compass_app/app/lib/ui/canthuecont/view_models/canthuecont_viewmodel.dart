// ignore_for_file: directives_ordering
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../data/repositories/canthuecont/canthuecont_repository.dart';
import '../../../domain/models/canthuecont/canthuecont_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../../../data/repositories/image_repository.dart';

class CanThueContViewModel extends ChangeNotifier {
  CanThueContViewModel({
    required CanThueContRepository canThueContRepository,
    required ImageRepository imageRepository,
  }) : _canThueContRepository = canThueContRepository,
       _imageRepository = imageRepository {
    load = Command0(_load)..execute();
    deleteCanThueCont = Command1(_deleteCanThueCont);
    addCanThueCont = Command1(_addCanThueCont);
    updateCanThueCont = Command1(_updateCanThueCont);
    pickAndUploadImage = Command0(_pickAndUploadImage);
  }

  final CanThueContRepository _canThueContRepository;
  final ImageRepository _imageRepository;
  final _log = Logger('CanThueContViewModel');
  List<CanThueCont> _canThueConts = [];

  List<CanThueCont> get CanThueConts => _canThueConts;

  late Command0 load;
  late Command1<void, int> deleteCanThueCont;
  late Command1<void, CanThueCont> addCanThueCont;
  late Command1<void, CanThueCont> updateCanThueCont;
  late Command0<String?> pickAndUploadImage;

  Future<Result> _load() async {
    try {
      final listCanThueContResult =
          await _canThueContRepository.getAllCanThueCont();
      switch (listCanThueContResult) {
        case Ok<List<CanThueCont>>():
          _canThueConts = listCanThueContResult.value;
          _log.fine('Loaded cho thue conts');
        case Error<List<CanThueCont>>():
          _log.warning(
            'Failed to load cho thue conts',
            listCanThueContResult.error,
          );
      }
      return listCanThueContResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteCanThueCont(int id) async {
    try {
      final resultDelete = await _canThueContRepository.deleteCanThueCont(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted cho thue cont $id');
          _canThueConts.removeWhere((canThueCont) => canThueCont.id == id);
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

  Future<Result<void>> _addCanThueCont(CanThueCont canThueCont) async {
    try {
      final resultAdd = await _canThueContRepository.addCanThueCont(
        canThueCont,
      );
      switch (resultAdd) {
        case Ok<void>():
          _log.fine('Added cho thue cont ${canThueCont.id}');
          _canThueConts.add(canThueCont);
        case Error<void>():
          _log.warning(
            'Failed to add cho thue cont ${canThueCont.id}',
            resultAdd.error,
          );
          return resultAdd;
      }
      return resultAdd;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _updateCanThueCont(CanThueCont canThueCont) async {
    try {
      final resultUpdate = await _canThueContRepository.updateCanThueCont(
        canThueCont,
      );
      switch (resultUpdate) {
        case Ok<void>():
          _log.fine('Updated cho thue cont ${canThueCont.id}');
          final index = _canThueConts.indexWhere((t) => t.id == canThueCont.id);
          if (index != -1) {
            _canThueConts[index] = canThueCont;
          }
        case Error<void>():
          _log.warning(
            'Failed to update cho thue cont ${canThueCont.id}',
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
