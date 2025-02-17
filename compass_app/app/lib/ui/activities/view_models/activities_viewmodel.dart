// Bản quyền 2024 Nhóm Flutter. Đã đăng ký bản quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/activity/activity_repository.dart';
import '../../../data/repositories/itinerary_config/itinerary_config_repository.dart';
import '../../../domain/models/activity/activity.dart';
import '../../../domain/models/itinerary_config/itinerary_config.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class ActivitiesViewModel extends ChangeNotifier {
  // Hàm khởi tạo của ActivitiesViewModel
  ActivitiesViewModel({
    required ActivityRepository activityRepository,
    required ItineraryConfigRepository itineraryConfigRepository,
  }) : _activityRepository = activityRepository,
       _itineraryConfigRepository = itineraryConfigRepository {
    // Khởi tạo lệnh loadActivities và thực thi nó
    loadActivities = Command0(_loadActivities)..execute();
    // Khởi tạo lệnh saveActivities
    saveActivities = Command0(_saveActivities);
  }

  // Logger để ghi lại các thông báo
  final _log = Logger('ActivitiesViewModel');
  // Repository cho hoạt động
  final ActivityRepository _activityRepository;
  // Repository cho cấu hình hành trình
  final ItineraryConfigRepository _itineraryConfigRepository;
  // Danh sách các hoạt động ban ngày
  List<Activity> _daytimeActivities = <Activity>[];
  // Danh sách các hoạt động buổi tối
  List<Activity> _eveningActivities = <Activity>[];
  // Tập hợp các hoạt động đã chọn
  final Set<String> _selectedActivities = <String>{};

  // Danh sách các hoạt động ban ngày theo điểm đến
  List<Activity> get daytimeActivities => _daytimeActivities;

  // Danh sách các hoạt động buổi tối theo điểm đến
  List<Activity> get eveningActivities => _eveningActivities;

  // Các hoạt động đã chọn theo ref
  Set<String> get selectedActivities => _selectedActivities;

  // Lệnh tải danh sách các hoạt động cho một điểm đến theo ref
  late final Command0 loadActivities;

  // Lệnh lưu danh sách các hoạt động đã chọn vào cấu hình hành trình
  late final Command0 saveActivities;

  // Hàm tải các hoạt động
  Future<Result<void>> _loadActivities() async {
    // Lấy cấu hình hành trình
    final result = await _itineraryConfigRepository.getItineraryConfig();
    switch (result) {
      case Error<ItineraryConfig>():
        // Ghi lại cảnh báo nếu không tải được cấu hình hành trình
        _log.warning('Failed to load stored ItineraryConfig', result.error);
        return result;
      case Ok<ItineraryConfig>():
    }

    // Lấy điểm đến từ cấu hình hành trình
    final destinationRef = result.value.destination;
    if (destinationRef == null) {
      // Ghi lại lỗi nếu không tìm thấy điểm đến
      _log.severe('Destination missing in ItineraryConfig');
      return Result.error(Exception('Destination not found'));
    }

    // Thêm các hoạt động đã chọn vào tập hợp
    _selectedActivities.addAll(result.value.activities);

    // Lấy các hoạt động theo điểm đến
    final resultActivities = await _activityRepository.getByDestination(
      destinationRef,
    );
    switch (resultActivities) {
      case Ok():
        {
          // Lọc và thêm các hoạt động ban ngày vào danh sách
          _daytimeActivities =
              resultActivities.value
                  .where(
                    (activity) => [
                      TimeOfDay.any,
                      TimeOfDay.morning,
                      TimeOfDay.afternoon,
                    ].contains(activity.timeOfDay),
                  )
                  .toList();

          // Lọc và thêm các hoạt động buổi tối vào danh sách
          _eveningActivities =
              resultActivities.value
                  .where(
                    (activity) => [
                      TimeOfDay.evening,
                      TimeOfDay.night,
                    ].contains(activity.timeOfDay),
                  )
                  .toList();

          // Ghi lại thông tin về số lượng hoạt động đã tải
          _log.fine(
            'Activities (daytime: ${_daytimeActivities.length}, '
            'evening: ${_eveningActivities.length}) loaded',
          );
        }
      case Error():
        {
          // Ghi lại cảnh báo nếu không tải được các hoạt động
          _log.warning('Failed to load activities', resultActivities.error);
        }
    }

    // Thông báo cho các listener
    notifyListeners();
    return resultActivities;
  }

  // Hàm thêm hoạt động vào danh sách đã chọn
  void addActivity(String activityRef) {
    assert(
      (_daytimeActivities + _eveningActivities).any(
        (activity) => activity.ref == activityRef,
      ),
      "Activity $activityRef not found",
    );
    _selectedActivities.add(activityRef);
    _log.finest('Activity $activityRef added');
    notifyListeners();
  }

  // Hàm xóa hoạt động khỏi danh sách đã chọn
  void removeActivity(String activityRef) {
    assert(
      (_daytimeActivities + _eveningActivities).any(
        (activity) => activity.ref == activityRef,
      ),
      "Activity $activityRef not found",
    );
    _selectedActivities.remove(activityRef);
    _log.finest('Activity $activityRef removed');
    notifyListeners();
  }

  // Hàm lưu các hoạt động đã chọn
  Future<Result<void>> _saveActivities() async {
    // Lấy cấu hình hành trình
    final resultConfig = await _itineraryConfigRepository.getItineraryConfig();
    switch (resultConfig) {
      case Error<ItineraryConfig>():
        // Ghi lại cảnh báo nếu không tải được cấu hình hành trình
        _log.warning(
          'Failed to load stored ItineraryConfig',
          resultConfig.error,
        );
        return resultConfig;
      case Ok<ItineraryConfig>():
    }

    // Lấy cấu hình hành trình
    final itineraryConfig = resultConfig.value;
    // Lưu cấu hình hành trình với các hoạt động đã chọn
    final result = await _itineraryConfigRepository.setItineraryConfig(
      itineraryConfig.copyWith(activities: _selectedActivities.toList()),
    );
    if (result is Error) {
      // Ghi lại cảnh báo nếu không lưu được cấu hình hành trình
      _log.warning('Failed to store ItineraryConfig', result.error);
    }
    return result;
  }
}
