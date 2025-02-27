// ignore_for_file: directives_ordering
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../data/repositories/canthuekho/canthuekho_repository.dart';
import '../../../domain/models/canthuekho/canthuekho_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../../../data/repositories/image_repository.dart';

class CanThueKhoViewModel extends ChangeNotifier {
  CanThueKhoViewModel({
    required CanThueKhoRepository canThueKhoRepository,
    required ImageRepository imageRepository,
  }) : _canThueKhoRepository = canThueKhoRepository,
       _imageRepository = imageRepository {
    load = Command0(_load)..execute();
    deleteCanThueKho = Command1(_deleteCanThueKho);
    addCanThueKho = Command1(_addCanThueKho);
    updateCanThueKho = Command1(_updateCanThueKho);
    pickAndUploadImage = Command0(_pickAndUploadImage);
  }

  final CanThueKhoRepository _canThueKhoRepository;
  final ImageRepository _imageRepository;
  final _log = Logger('CanThueKhoViewModel');
  List<CanThueKho> _canThueKhos = [];

  List<CanThueKho> get canThueKhos => _canThueKhos;

  late Command0 load;
  late Command1<void, int> deleteCanThueKho;
  late Command1<void, CanThueKho> addCanThueKho;
  late Command1<void, CanThueKho> updateCanThueKho;
  late Command0<String?> pickAndUploadImage;

  Future<Result> _load() async {
    try {
      final listCanThueKhoResult =
          await _canThueKhoRepository.getAllCanThueKho();
      switch (listCanThueKhoResult) {
        case Ok<List<CanThueKho>>():
          _canThueKhos = listCanThueKhoResult.value;
          _log.fine('Loaded can thue khos');
        case Error<List<CanThueKho>>():
          _log.warning(
            'Failed to load can thue khos',
            listCanThueKhoResult.error,
          );
      }
      return listCanThueKhoResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteCanThueKho(int id) async {
    try {
      final resultDelete = await _canThueKhoRepository.deleteCanThueKho(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted can thue kho $id');
          _canThueKhos.removeWhere((canThueKho) => canThueKho.id == id);
        case Error<void>():
          _log.warning('Failed to delete can thue kho $id', resultDelete.error);
          return resultDelete;
      }
      return resultDelete;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addCanThueKho(CanThueKho canThueKho) async {
    try {
      final resultAdd = await _canThueKhoRepository.addCanThueKho(canThueKho);
      switch (resultAdd) {
        case Ok<void>():
          _log.fine('Added can thue kho ${canThueKho.id}');
          _canThueKhos.add(canThueKho);
        case Error<void>():
          _log.warning(
            'Failed to add can thue kho ${canThueKho.id}',
            resultAdd.error,
          );
          return resultAdd;
      }
      return resultAdd;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _updateCanThueKho(CanThueKho canThueKho) async {
    try {
      final resultUpdate = await _canThueKhoRepository.updateCanThueKho(
        canThueKho,
      );
      switch (resultUpdate) {
        case Ok<void>():
          _log.fine('Updated can thue kho ${canThueKho.id}');
          final index = _canThueKhos.indexWhere((t) => t.id == canThueKho.id);
          if (index != -1) {
            _canThueKhos[index] = canThueKho;
          }
        case Error<void>():
          _log.warning(
            'Failed to update can thue kho ${canThueKho.id}',
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
