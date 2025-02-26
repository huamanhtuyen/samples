// Định nghĩa một lớp trừu tượng cuối cùng chứa các hằng số cho các tuyến đường
abstract final class Routes {
  // Tuyến đường cho trang chủ
  static const home = '/';
  // Tuyến đường cho trang đăng nhập
  static const login = '/login';
  // Tuyến đường cho trang đăng ký
  static const register = '/register';
  // Tuyến đường cho trang profile
  static const profile = '/profile';
  // Tuyến đường cho trang sửa profile
  static const editprofile = '/editprofile';
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

  //test screen
  static const hocSinh = '/hocsinh';
  static const testmap1 = '/testmap1';

  //link các chức năng
  //chủ xe (phương tiện vận tải)
  static const chuXe = '/chu_xe';
  //tài xế (phương tiện vận tải)
  static const taiXe = '/tai_xe';
  //khách hàng (phương tiện vận tải)
  static const khachHang = '/khach_hang';
  // Tuyến đường cho trang thông tin xe
  static const thongTinXe = '/thongtinxe';
  // Tuyến đường cho trang báo cần hàng
  static const baoCanHang = '/baocanhang';
  // Tuyến đường cho trang nhu cầu vận chuyển
  static const nhucauvanchuyen = '/nhucauvanchuyen';
  //chủ hàng
  static const chuHang = '/chu_hang';
  // Tuyến đường cho trang cho thuê container
  static const chothuecont = '/chothuecont';
}
