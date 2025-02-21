// ignore_for_file: directives_ordering
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repositories/activity/activity_repository.dart';
import '../data/repositories/activity/activity_repository_local.dart';
import '../data/repositories/activity/activity_repository_remote.dart';
import '../data/repositories/auth/auth_repository.dart';
import '../data/repositories/auth/auth_repository_dev.dart';
import '../data/repositories/auth/auth_repository_remote.dart';
import '../data/repositories/booking/booking_repository.dart';
import '../data/repositories/booking/booking_repository_local.dart';
import '../data/repositories/booking/booking_repository_remote.dart';
import '../data/repositories/continent/continent_repository.dart';
import '../data/repositories/continent/continent_repository_local.dart';
import '../data/repositories/continent/continent_repository_remote.dart';
import '../data/repositories/destination/destination_repository.dart';
import '../data/repositories/destination/destination_repository_local.dart';
import '../data/repositories/destination/destination_repository_remote.dart';
import '../data/repositories/itinerary_config/itinerary_config_repository.dart';
import '../data/repositories/itinerary_config/itinerary_config_repository_memory.dart';
import '../data/repositories/user/user_repository.dart';
import '../data/repositories/user/user_repository_local.dart';
import '../data/repositories/user/user_repository_remote.dart';
import '../data/services/api/api_client.dart';
import '../data/services/api/auth_api_client.dart';
import '../data/services/local/local_data_service.dart';
import '../data/services/shared_preferences_service.dart';
import '../domain/use_cases/booking/booking_create_use_case.dart';
import '../domain/use_cases/booking/booking_share_use_case.dart';
import '../data/repositories/hocsinh/hocsinh_repository.dart';

/// Các provider dùng chung cho tất cả các cấu hình.
List<SingleChildWidget> _sharedProviders = [
  Provider(
    lazy: true, // Tạo provider một cách lười biếng (chỉ khi cần thiết)
    create:
        (context) => BookingCreateUseCase(
          destinationRepository:
              context.read(), // Đọc repository đích từ context
          activityRepository:
              context.read(), // Đọc repository hoạt động từ context
          bookingRepository:
              context.read(), // Đọc repository đặt chỗ từ context
        ),
  ),
  Provider(
    lazy: true, // Tạo provider một cách lười biếng (chỉ khi cần thiết)
    create:
        (context) =>
            BookingShareUseCase.withSharePlus(), // Tạo use case chia sẻ đặt chỗ
  ),
];

/// Cấu hình các phụ thuộc cho dữ liệu từ xa.
/// Danh sách phụ thuộc này sử dụng các repository kết nối với máy chủ từ xa.
List<SingleChildWidget> get providersRemote {
  return [
    Provider(create: (context) => AuthApiClient()), // Tạo AuthApiClient
    Provider(create: (context) => ApiClient()), // Tạo ApiClient
    Provider(
      create: (context) => SharedPreferencesService(),
    ), // Tạo SharedPreferencesService
    ChangeNotifierProvider(
      create:
          (context) =>
              AuthRepositoryRemote(
                    authApiClient:
                        context.read(), // Đọc AuthApiClient từ context
                    apiClient: context.read(), // Đọc ApiClient từ context
                    sharedPreferencesService:
                        context
                            .read(), // Đọc SharedPreferencesService từ context
                  )
                  as AuthRepository, // Ép kiểu về AuthRepository
    ),
    Provider(
      create:
          (context) =>
              DestinationRepositoryRemote(apiClient: context.read())
                  as DestinationRepository, // Ép kiểu về DestinationRepository
    ),
    Provider(
      create:
          (context) =>
              ContinentRepositoryRemote(apiClient: context.read())
                  as ContinentRepository, // Ép kiểu về ContinentRepository
    ),
    Provider(
      create:
          (context) =>
              ActivityRepositoryRemote(apiClient: context.read())
                  as ActivityRepository, // Ép kiểu về ActivityRepository
    ),
    Provider(create: (context) => HocSinhRepository()),
    Provider.value(
      value:
          ItineraryConfigRepositoryMemory()
              as ItineraryConfigRepository, // Ép kiểu về ItineraryConfigRepository
    ),
    Provider(
      create:
          (context) =>
              BookingRepositoryRemote(apiClient: context.read())
                  as BookingRepository, // Ép kiểu về BookingRepository
    ),
    Provider(
      create:
          (context) =>
              UserRepositoryRemote(apiClient: context.read())
                  as UserRepository, // Ép kiểu về UserRepository
    ),
    ..._sharedProviders, // Thêm các provider dùng chung
  ];
}

/// Cấu hình các phụ thuộc cho dữ liệu cục bộ.
/// Danh sách phụ thuộc này sử dụng các repository cung cấp dữ liệu cục bộ.
/// Người dùng luôn được đăng nhập.
List<SingleChildWidget> get providersLocal {
  return [
    ChangeNotifierProvider.value(
      value: AuthRepositoryDev() as AuthRepository,
    ), // Ép kiểu về AuthRepository
    Provider.value(value: LocalDataService()), // Tạo LocalDataService
    Provider(
      create:
          (context) =>
              DestinationRepositoryLocal(localDataService: context.read())
                  as DestinationRepository, // Ép kiểu về DestinationRepository
    ),
    Provider(
      create:
          (context) =>
              ContinentRepositoryLocal(localDataService: context.read())
                  as ContinentRepository, // Ép kiểu về ContinentRepository
    ),
    Provider(
      create:
          (context) =>
              ActivityRepositoryLocal(localDataService: context.read())
                  as ActivityRepository, // Ép kiểu về ActivityRepository
    ),
    Provider(
      create:
          (context) =>
              BookingRepositoryLocal(localDataService: context.read())
                  as BookingRepository, // Ép kiểu về BookingRepository
    ),
    Provider.value(
      value:
          ItineraryConfigRepositoryMemory()
              as ItineraryConfigRepository, // Ép kiểu về ItineraryConfigRepository
    ),
    Provider(
      create:
          (context) =>
              UserRepositoryLocal(localDataService: context.read())
                  as UserRepository, // Ép kiểu về UserRepository
    ),
    ..._sharedProviders, // Thêm các provider dùng chung
  ];
}
