// ignore_for_file: directives_ordering
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../data/repositories/chothuekho/chothuekho_repository.dart';
import '../../../domain/models/chothuekho/chothuekho_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../../../data/repositories/image_repository.dart';

class ChoThueKhoViewModel extends ChangeNotifier {
  ChoThueKhoViewModel({
    required ChoThueKhoRepository choThueKhoRepository,
    required ImageRepository imageRepository,
  }) : _choThueKhoRepository = choThueKhoRepository,
       _imageRepository = imageRepository {
    load = Command0(_load)..execute();
    deleteChoThueKho = Command1(_deleteChoThueKho);
    addChoThueKho = Command1(_addChoThueKho);
    updateChoThueKho = Command1(_updateChoThueKho);
    pickAndUploadImage = Command0(_pickAndUploadImage);
  }

  final ChoThueKhoRepository _choThueKhoRepository;
  final ImageRepository _imageRepository;
  final _log = Logger('ChoThueKhoViewModel');
  List<ChoThueKho> _choThueKhos = [];

  List<ChoThueKho> get choThueKhos => _choThueKhos;

  late Command0 load;
  late Command1<void, int> deleteChoThueKho;
  late Command1<void, ChoThueKho> addChoThueKho;
  late Command1<void, ChoThueKho> updateChoThueKho;
  late Command0<String?> pickAndUploadImage;

  Future<Result> _load() async {
    try {
      final listChoThueKhoResult =
          await _choThueKhoRepository.getAllChoThueKho();
      switch (listChoThueKhoResult) {
        case Ok<List<ChoThueKho>>():
          _choThueKhos = listChoThueKhoResult.value;
          _log.fine('Loaded cho thue khos');
        case Error<List<ChoThueKho>>():
          _log.warning(
            'Failed to load cho thue khos',
            listChoThueKhoResult.error,
          );
      }
      return listChoThueKhoResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteChoThueKho(int id) async {
    try {
      final resultDelete = await _choThueKhoRepository.deleteChoThueKho(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted cho thue kho $id');
          _choThueKhos.removeWhere((choThueKho) => choThueKho.id == id);
        case Error<void>():
          _log.warning('Failed to delete cho thue kho $id', resultDelete.error);
          return resultDelete;
      }
      return resultDelete;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addChoThueKho(ChoThueKho choThueKho) async {
    try {
      final resultAdd = await _choThueKhoRepository.addChoThueKho(choThueKho);
      switch (resultAdd) {
        case Ok<void>():
          _log.fine('Added cho thue kho ${choThueKho.id}');
          _choThueKhos.add(choThueKho);
        case Error<void>():
          _log.warning(
            'Failed to add cho thue kho ${choThueKho.id}',
            resultAdd.error,
          );
          return resultAdd;
      }
      return resultAdd;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _updateChoThueKho(ChoThueKho choThueKho) async {
    try {
      final resultUpdate = await _choThueKhoRepository.updateChoThueKho(
        choThueKho,
      );
      switch (resultUpdate) {
        case Ok<void>():
          _log.fine('Updated cho thue kho ${choThueKho.id}');
          final index = _choThueKhos.indexWhere((t) => t.id == choThueKho.id);
          if (index != -1) {
            _choThueKhos[index] = choThueKho;
          }
        case Error<void>():
          _log.warning(
            'Failed to update cho thue kho ${choThueKho.id}',
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
