// ignore_for_file: directives_ordering

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth/auth_repository.dart';
import '../ui/auth/login/view_models/login_viewmodel.dart';
import '../ui/auth/login/widgets/login_screen.dart';
import '../ui/auth/register/view_models/register_viewmodel.dart';
import '../ui/auth/register/widgets/register_screen.dart';
import '../ui/booking/view_models/booking_viewmodel.dart';
import '../ui/booking/widgets/booking_screen.dart';
import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import '../ui/results/view_models/results_viewmodel.dart';
import '../ui/results/widgets/results_screen.dart';
import '../ui/search_form/view_models/search_form_viewmodel.dart';
import '../ui/search_form/widgets/search_form_screen.dart';
import 'routes.dart';
//học sinh
import '../ui/hocsinh/widgets/hocsinh_screen.dart';
import '../ui/hocsinh/view_models/hocsinh_viewmodel.dart';
import '../ui/hocsinh/widgets/add_hocsinh_screen.dart';

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
      path: Routes.register, // Đường dẫn đến trang đăng ký
      builder: (context, state) {
        return RegisterScreen(
          viewModel: RegisterViewModel(
            authRepository: context.read(),
          ), // Tạo viewModel cho màn hình đăng ký
        );
      },
    ),
    GoRoute(
      path: Routes.profile, // Đường dẫn đến trang profile
      builder: (context, state) {
        return RegisterScreen(
          viewModel: RegisterViewModel(
            authRepository: context.read(),
          ), // Tạo viewModel cho màn hình đăng ký
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
          path: Routes.hocSinh, // Đường dẫn đến trang Học sinh (dùng để test)
          builder: (context, state) {
            return ChangeNotifierProvider(
              create:
                  (context) => HocSinhViewModel(
                    hocSinhRepository:
                        context.read(), // Đọc hocSinhRepository từ context
                  ),
              child: const HocSinhScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'add', // Đường dẫn đến trang thêm Học sinh
              builder: (context, state) {
                return ChangeNotifierProvider(
                  create:
                      (context) => HocSinhViewModel(
                        hocSinhRepository:
                            context.read(), // Đọc hocSinhRepository từ context
                      ),
                  child: const AddHocSinhScreen(),
                );
              },
            ),
          ],
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
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.login;
  final registering = state.matchedLocation == Routes.register;

  if (!loggedIn && !loggingIn && !registering) {
    return Routes
        .login; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập và không phải trang đăng nhập hoặc đăng ký
  }

  if (loggedIn) {
    // if (state.matchedLocation == Routes.hocSinh) {
    //   return Routes
    //       .hocSinh; // Chuyển hướng đến trang Học Sinh nếu đã đăng nhập và nhấn vào route hocSinh
    // }
    if (state.matchedLocation == Routes.hocSinh) {
      return Routes
          .hocSinh; // Cho phép điều hướng đến trang Học Sinh hoặc trang thêm Học Sinh nếu đã đăng nhập
    }

    if (state.matchedLocation == '/hocsinh/add') {
      return '/hocsinh/add'; // Cho phép điều hướng đến trang Học Sinh hoặc trang thêm Học Sinh nếu đã đăng nhập
    }

    return Routes.home; // Chuyển hướng đến trang chủ nếu đã đăng nhập
  }

  // không cần chuyển hướng
  return null;
}
