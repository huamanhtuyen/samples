// Định nghĩa một lớp trừu tượng cuối cùng chứa các hằng số cho các tuyến đường
abstract final class Routes {
  // Tuyến đường cho trang chủ
  static const home = '/';
  // Tuyến đường cho trang đăng nhập
  static const login = '/login';
  // Tuyến đường cho trang đăng ký
  static const register = '/register';
  // Tuyến đường cho trang tìm kiếm, sử dụng hằng số searchRelative
  static const search = '/$searchRelative';
  // Hằng số tương đối cho tìm kiếm
  static const searchRelative = 'search';
  // Tuyến đường cho trang kết quả, sử dụng hằng số resultsRelative
  static const results = '/$resultsRelative';
  // Hằng số tương đối cho kết quả
  static const resultsRelative = 'results';
  // Tuyến đường cho trang hoạt động, sử dụng hằng số activitiesRelative
  static const activities = '/$activitiesRelative';
  // Hằng số tương đối cho hoạt động
  static const activitiesRelative = 'activities';
  // Tuyến đường cho trang đặt chỗ, sử dụng hằng số bookingRelative
  static const booking = '/$bookingRelative';
  // Hằng số tương đối cho đặt chỗ
  static const bookingRelative = 'booking';
  // Hàm tạo tuyến đường cho trang đặt chỗ với ID cụ thể
  static String bookingWithId(int id) => '$booking/$id';
}
