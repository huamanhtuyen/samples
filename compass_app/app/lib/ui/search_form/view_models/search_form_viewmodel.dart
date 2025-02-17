// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD
// có thể được tìm thấy trong tệp LICENSE.

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/continent/continent_repository.dart';
import '../../../data/repositories/itinerary_config/itinerary_config_repository.dart';
import '../../../domain/models/continent/continent.dart';
import '../../../domain/models/itinerary_config/itinerary_config.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

/// View model cho form tìm kiếm.
///
/// Chứa các tùy chọn đã chọn trong form
/// và logic để tải danh sách các khu vực.
class SearchFormViewModel extends ChangeNotifier {
  SearchFormViewModel({
    required ContinentRepository continentRepository,
    required ItineraryConfigRepository itineraryConfigRepository,
  }) : _continentRepository = continentRepository,
       _itineraryConfigRepository = itineraryConfigRepository {
    // Khởi tạo các lệnh cập nhật cấu hình hành trình và tải dữ liệu
    updateItineraryConfig = Command0(_updateItineraryConfig);
    load = Command0(_load)..execute();
  }

  final _log = Logger('SearchFormViewModel'); // Logger để ghi lại các sự kiện
  final ContinentRepository
  _continentRepository; // Repository cho dữ liệu châu lục
  final ItineraryConfigRepository
  _itineraryConfigRepository; // Repository cho cấu hình hành trình
  List<Continent> _continents = []; // Danh sách các châu lục
  String? _selectedContinent; // Châu lục được chọn
  DateTimeRange? _dateRange; // Khoảng thời gian được chọn
  int _guests = 0; // Số lượng khách

  /// Trả về true nếu form hợp lệ và có thể submit
  bool get valid =>
      _guests > 0 && _selectedContinent != null && _dateRange != null;

  /// Danh sách các châu lục.
  /// Được tải trong lệnh [load].
  List<Continent> get continents => _continents;

  /// Châu lục được chọn.
  /// Null nghĩa là không có châu lục nào được chọn.
  String? get selectedContinent => _selectedContinent;

  /// Đặt châu lục được chọn.
  /// Đặt null để xóa lựa chọn.
  set selectedContinent(String? continent) {
    _selectedContinent = continent;
    _log.finest('Châu lục được chọn: $continent');
    notifyListeners(); // Thông báo cho các listener về sự thay đổi
  }

  /// Khoảng thời gian.
  /// Null nghĩa là không có khoảng thời gian nào được chọn.
  DateTimeRange? get dateRange => _dateRange;

  /// Đặt khoảng thời gian.
  /// Có thể đặt null để xóa lựa chọn.
  set dateRange(DateTimeRange? dateRange) {
    _dateRange = dateRange;
    _log.finest('Khoảng thời gian được chọn: $dateRange');
    notifyListeners(); // Thông báo cho các listener về sự thay đổi
  }

  /// Số lượng khách
  int get guests => _guests;

  /// Đặt số lượng khách
  /// Nếu số lượng là số âm, nó sẽ được đặt về 0
  set guests(int quantity) {
    if (quantity < 0) {
      _guests = 0;
    } else {
      _guests = quantity;
    }
    _log.finest('Đặt số lượng khách: $_guests');
    notifyListeners(); // Thông báo cho các listener về sự thay đổi
  }

  /// Tải danh sách các châu lục và cấu hình hành trình hiện tại.
  late final Command0 load;

  /// Lưu dữ liệu ViewModel vào [ItineraryConfigRepository] trước khi điều hướng.
  late final Command0 updateItineraryConfig;

  Future<Result<void>> _load() async {
    final result = await _loadContinents();
    if (result is Error) {
      return result;
    }
    return await _loadItineraryConfig();
  }

  Future<Result<void>> _loadContinents() async {
    final result = await _continentRepository.getContinents();
    switch (result) {
      case Ok():
        _continents = result.value;
        _log.fine('Đã tải (${_continents.length}) châu lục');
      case Error():
        _log.warning('Không thể tải các châu lục', result.error);
    }
    notifyListeners(); // Thông báo cho các listener về sự thay đổi
    return result;
  }

  Future<Result<void>> _loadItineraryConfig() async {
    final result = await _itineraryConfigRepository.getItineraryConfig();
    switch (result) {
      case Ok<ItineraryConfig>():
        final itineraryConfig = result.value;
        _selectedContinent = itineraryConfig.continent;
        if (itineraryConfig.startDate != null &&
            itineraryConfig.endDate != null) {
          _dateRange = DateTimeRange(
            start: itineraryConfig.startDate!,
            end: itineraryConfig.endDate!,
          );
        }
        _guests = itineraryConfig.guests ?? 0;
        _log.fine('Đã tải ItineraryConfig');
        notifyListeners(); // Thông báo cho các listener về sự thay đổi
      case Error<ItineraryConfig>():
        _log.warning('Không thể tải ItineraryConfig đã lưu', result.error);
    }
    return result;
  }

  Future<Result<void>> _updateItineraryConfig() async {
    assert(valid, "được gọi khi valid là false");
    final result = await _itineraryConfigRepository.setItineraryConfig(
      ItineraryConfig(
        continent: _selectedContinent,
        startDate: _dateRange!.start,
        endDate: _dateRange!.end,
        guests: _guests,
      ),
    );
    switch (result) {
      case Ok<void>():
        _log.fine('Đã lưu ItineraryConfig');
      case Error<void>():
        _log.warning('Không thể lưu ItineraryConfig', result.error);
    }
    return result;
  }
}
