// Bản quyền 2024 của nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép BSD-style có thể
// tìm thấy trong tệp LICENSE.

import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/destination/destination_repository.dart';
import '../../../data/repositories/itinerary_config/itinerary_config_repository.dart';
import '../../../domain/models/destination/destination.dart';
import '../../../domain/models/itinerary_config/itinerary_config.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

/// ViewModel cho màn hình kết quả
/// Dựa trên https://docs.flutter.dev/get-started/fwe/state-management#using-mvvm-for-your-applications-architecture
class ResultsViewModel extends ChangeNotifier {
  ResultsViewModel({
    required DestinationRepository destinationRepository,
    required ItineraryConfigRepository itineraryConfigRepository,
  }) : _destinationRepository = destinationRepository,
       _itineraryConfigRepository = itineraryConfigRepository {
    // Khởi tạo lệnh cập nhật cấu hình hành trình
    updateItineraryConfig = Command1<void, String>(_updateItineraryConfig);
    // Khởi tạo lệnh tìm kiếm và thực thi ngay lập tức
    search = Command0(_search)..execute();
  }

  // Logger để ghi lại các thông tin log
  final _log = Logger('ResultsViewModel');

  // Repository cho điểm đến
  final DestinationRepository _destinationRepository;

  // Repository cho cấu hình hành trình
  final ItineraryConfigRepository _itineraryConfigRepository;

  // Danh sách điểm đến, chỉ có thể được thay đổi trong lớp này
  List<Destination> _destinations = [];

  /// Danh sách điểm đến, có thể rỗng nhưng không bao giờ null
  List<Destination> get destinations => _destinations;

  // Cấu hình hành trình, có thể null
  ItineraryConfig? _itineraryConfig;

  /// Tùy chọn lọc để hiển thị trên thanh tìm kiếm
  ItineraryConfig get config => _itineraryConfig ?? const ItineraryConfig();

  /// Thực hiện tìm kiếm
  late final Command0 search;

  /// Lưu dữ liệu ViewModel vào [ItineraryConfigRepository] trước khi điều hướng.
  late final Command1<void, String> updateItineraryConfig;

  Future<Result<void>> _search() async {
    // Tải cấu hình hành trình hiện tại
    final resultConfig = await _itineraryConfigRepository.getItineraryConfig();
    switch (resultConfig) {
      case Error<ItineraryConfig>():
        _log.warning(
          'Không thể tải cấu hình hành trình đã lưu',
          resultConfig.error,
        );
        return resultConfig;
      case Ok<ItineraryConfig>():
    }
    _itineraryConfig = resultConfig.value;
    notifyListeners();

    final result = await _destinationRepository.getDestinations();
    switch (result) {
      case Ok():
        {
          // Nếu kết quả là Ok, cập nhật danh sách điểm đến
          _destinations =
              result.value
                  .where(
                    (destination) =>
                        destination.continent == _itineraryConfig!.continent,
                  )
                  .toList();
          _log.fine('Đã tải ${_destinations.length} điểm đến');
        }
      case Error():
        {
          _log.warning('Không thể tải điểm đến', result.error);
        }
    }

    // Sau khi hoàn thành tải kết quả, thông báo cho view
    notifyListeners();
    return result;
  }

  Future<Result<void>> _updateItineraryConfig(String destinationRef) async {
    assert(destinationRef.isNotEmpty, "destinationRef không được rỗng");

    final resultConfig = await _itineraryConfigRepository.getItineraryConfig();
    switch (resultConfig) {
      case Error<ItineraryConfig>():
        _log.warning(
          'Không thể tải cấu hình hành trình đã lưu',
          resultConfig.error,
        );
        return resultConfig;
      case Ok<ItineraryConfig>():
    }

    final itineraryConfig = resultConfig.value;
    final result = await _itineraryConfigRepository.setItineraryConfig(
      itineraryConfig.copyWith(destination: destinationRef, activities: []),
    );
    if (result is Error) {
      _log.warning('Không thể lưu cấu hình hành trình', result.error);
    }
    return result;
  }
}
