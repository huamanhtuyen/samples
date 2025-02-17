// Bản quyền 2024 thuộc về nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD
// có thể được tìm thấy trong tệp LICENSE.

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth/auth_repository.dart';
import '../ui/activities/view_models/activities_viewmodel.dart';
import '../ui/activities/widgets/activities_screen.dart';
import '../ui/auth/login/view_models/login_viewmodel.dart';
import '../ui/auth/login/widgets/login_screen.dart';
import '../ui/booking/view_models/booking_viewmodel.dart';
import '../ui/booking/widgets/booking_screen.dart';
import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import '../ui/results/view_models/results_viewmodel.dart';
import '../ui/results/widgets/results_screen.dart';
import '../ui/search_form/view_models/search_form_viewmodel.dart';
import '../ui/search_form/widgets/search_form_screen.dart';
import 'routes.dart';

/// Điểm vào chính của go_router.
///
/// Lắng nghe các thay đổi trong [AuthTokenRepository] để chuyển hướng người dùng
/// đến /login khi người dùng đăng xuất.
GoRouter router(AuthRepository authRepository) => GoRouter(
  initialLocation: Routes.home, // Vị trí ban đầu là trang chủ
  debugLogDiagnostics: true, // Bật ghi nhật ký chẩn đoán
  redirect: _redirect, // Hàm chuyển hướng
  refreshListenable: authRepository, // Lắng nghe thay đổi từ authRepository
  routes: [
    GoRoute(
      path: Routes.login, // Đường dẫn đến trang đăng nhập
      builder: (context, state) {
        return LoginScreen(
          viewModel: LoginViewModel(
            authRepository: context.read(),
          ), // Tạo viewModel cho màn hình đăng nhập
        );
      },
    ),
    GoRoute(
      path: Routes.home, // Đường dẫn đến trang chủ
      builder: (context, state) {
        final viewModel = HomeViewModel(
          bookingRepository: context.read(), // Đọc bookingRepository từ context
          userRepository: context.read(), // Đọc userRepository từ context
        );
        return HomeScreen(
          viewModel: viewModel,
        ); // Trả về màn hình trang chủ với viewModel
      },
      routes: [
        GoRoute(
          path: Routes.searchRelative, // Đường dẫn đến trang tìm kiếm
          builder: (context, state) {
            final viewModel = SearchFormViewModel(
              continentRepository:
                  context.read(), // Đọc continentRepository từ context
              itineraryConfigRepository:
                  context.read(), // Đọc itineraryConfigRepository từ context
            );
            return SearchFormScreen(
              viewModel: viewModel,
            ); // Trả về màn hình tìm kiếm với viewModel
          },
        ),
        GoRoute(
          path: Routes.resultsRelative, // Đường dẫn đến trang kết quả
          builder: (context, state) {
            final viewModel = ResultsViewModel(
              destinationRepository:
                  context.read(), // Đọc destinationRepository từ context
              itineraryConfigRepository:
                  context.read(), // Đọc itineraryConfigRepository từ context
            );
            return ResultsScreen(
              viewModel: viewModel,
            ); // Trả về màn hình kết quả với viewModel
          },
        ),
        GoRoute(
          path: Routes.activitiesRelative, // Đường dẫn đến trang hoạt động
          builder: (context, state) {
            final viewModel = ActivitiesViewModel(
              activityRepository:
                  context.read(), // Đọc activityRepository từ context
              itineraryConfigRepository:
                  context.read(), // Đọc itineraryConfigRepository từ context
            );
            return ActivitiesScreen(
              viewModel: viewModel,
            ); // Trả về màn hình hoạt động với viewModel
          },
        ),
        GoRoute(
          path: Routes.bookingRelative, // Đường dẫn đến trang đặt chỗ
          builder: (context, state) {
            final viewModel = BookingViewModel(
              itineraryConfigRepository:
                  context.read(), // Đọc itineraryConfigRepository từ context
              createBookingUseCase:
                  context.read(), // Đọc createBookingUseCase từ context
              shareBookingUseCase:
                  context.read(), // Đọc shareBookingUseCase từ context
              bookingRepository:
                  context.read(), // Đọc bookingRepository từ context
            );

            // Khi mở màn hình đặt chỗ trực tiếp
            // tạo một đặt chỗ mới từ ItineraryConfig đã lưu.
            viewModel.createBooking.execute();

            return BookingScreen(
              viewModel: viewModel,
            ); // Trả về màn hình đặt chỗ với viewModel
          },
          routes: [
            GoRoute(
              path: ':id', // Đường dẫn đến trang đặt chỗ với id cụ thể
              builder: (context, state) {
                final id = int.parse(
                  state.pathParameters['id']!,
                ); // Lấy id từ tham số đường dẫn
                final viewModel = BookingViewModel(
                  itineraryConfigRepository:
                      context
                          .read(), // Đọc itineraryConfigRepository từ context
                  createBookingUseCase:
                      context.read(), // Đọc createBookingUseCase từ context
                  shareBookingUseCase:
                      context.read(), // Đọc shareBookingUseCase từ context
                  bookingRepository:
                      context.read(), // Đọc bookingRepository từ context
                );

                // Khi mở màn hình đặt chỗ với id hiện có
                // tải và hiển thị đặt chỗ đó.
                viewModel.loadBooking.execute(id);

                return BookingScreen(
                  viewModel: viewModel,
                ); // Trả về màn hình đặt chỗ với viewModel
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

// Từ https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // nếu người dùng chưa đăng nhập, họ cần đăng nhập
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.login;
  if (!loggedIn) {
    return Routes.login; // Chuyển hướng đến trang đăng nhập
  }

  // nếu người dùng đã đăng nhập nhưng vẫn ở trang đăng nhập, chuyển họ đến
  // trang chủ
  if (loggingIn) {
    return Routes.home; // Chuyển hướng đến trang chủ
  }

  // không cần chuyển hướng
  return null;
}
