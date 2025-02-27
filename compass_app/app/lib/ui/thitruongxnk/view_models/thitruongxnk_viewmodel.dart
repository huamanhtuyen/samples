// ignore_for_file: directives_ordering
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../data/repositories/thitruongxnk/thitruongxnk_repository.dart';
import '../../../domain/models/thitruongxnk/thitruongxnk_model.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../../../data/repositories/image_repository.dart';

class ThiTruongXNKViewModel extends ChangeNotifier {
  ThiTruongXNKViewModel({
    required ThiTruongXNKRepository thiTruongXNKRepository,
    required ImageRepository imageRepository,
  }) : _thiTruongXNKRepository = thiTruongXNKRepository,
       _imageRepository = imageRepository {
    load = Command0(_load)..execute();
    deleteThiTruongXNK = Command1(_deleteThiTruongXNK);
    addThiTruongXNK = Command1(_addThiTruongXNK);
    updateThiTruongXNK = Command1(_updateThiTruongXNK);
    pickAndUploadImage = Command0(_pickAndUploadImage);
  }

  final ThiTruongXNKRepository _thiTruongXNKRepository;
  final ImageRepository _imageRepository;
  final _log = Logger('ThiTruongXNKViewModel');
  List<ThiTruongXNK> _thiTruongXNKs = [];

  List<ThiTruongXNK> get thiTruongXNKs => _thiTruongXNKs;

  late Command0 load;
  late Command1<void, int> deleteThiTruongXNK;
  late Command1<void, ThiTruongXNK> addThiTruongXNK;
  late Command1<void, ThiTruongXNK> updateThiTruongXNK;
  late Command0<String?> pickAndUploadImage;

  Future<Result> _load() async {
    try {
      final listThiTruongXNKResult =
          await _thiTruongXNKRepository.getAllThiTruongXNK();
      switch (listThiTruongXNKResult) {
        case Ok<List<ThiTruongXNK>>():
          _thiTruongXNKs = listThiTruongXNKResult.value;
          _log.fine('Loaded thi truong XNKs');
        case Error<List<ThiTruongXNK>>():
          _log.warning(
            'Failed to load thi truong XNKs',
            listThiTruongXNKResult.error,
          );
      }
      return listThiTruongXNKResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteThiTruongXNK(int id) async {
    try {
      final resultDelete = await _thiTruongXNKRepository.deleteThiTruongXNK(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted thi truong XNK $id');
          _thiTruongXNKs.removeWhere((thiTruongXNK) => thiTruongXNK.id == id);
        case Error<void>():
          _log.warning(
            'Failed to delete thi truong XNK $id',
            resultDelete.error,
          );
          return resultDelete;
      }
      return resultDelete;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addThiTruongXNK(ThiTruongXNK thiTruongXNK) async {
    try {
      final resultAdd = await _thiTruongXNKRepository.addThiTruongXNK(
        thiTruongXNK,
      );
      switch (resultAdd) {
        case Ok<void>():
          _log.fine('Added thi truong XNK ${thiTruongXNK.id}');
          _thiTruongXNKs.add(thiTruongXNK);
        case Error<void>():
          _log.warning(
            'Failed to add thi truong XNK ${thiTruongXNK.id}',
            resultAdd.error,
          );
          return resultAdd;
      }
      return resultAdd;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _updateThiTruongXNK(ThiTruongXNK thiTruongXNK) async {
    try {
      final resultUpdate = await _thiTruongXNKRepository.updateThiTruongXNK(
        thiTruongXNK,
      );
      switch (resultUpdate) {
        case Ok<void>():
          _log.fine('Updated thi truong XNK ${thiTruongXNK.id}');
          final index = _thiTruongXNKs.indexWhere(
            (t) => t.id == thiTruongXNK.id,
          );
          if (index != -1) {
            _thiTruongXNKs[index] = thiTruongXNK;
          }
        case Error<void>():
          _log.warning(
            'Failed to update thi truong XNK ${thiTruongXNK.id}',
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
