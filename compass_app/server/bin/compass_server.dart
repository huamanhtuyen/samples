// Bản quyền 2024 của nhóm Flutter. Tất cả các quyền được bảo lưu.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD
// có thể được tìm thấy trong tệp LICENSE.

import 'dart:io'; // Thư viện Dart để làm việc với I/O.

import 'package:compass_server/middleware/auth.dart'; // Import middleware xác thực.
import 'package:compass_server/routes/booking.dart'; // Import route booking.
import 'package:compass_server/routes/continent.dart'; // Import route continent.
import 'package:compass_server/routes/destination.dart'; // Import route destination.
import 'package:compass_server/routes/login.dart'; // Import route login.
import 'package:compass_server/routes/user.dart'; // Import route user.
import 'package:shelf/shelf.dart'; // Import thư viện Shelf để xây dựng server.
import 'package:shelf/shelf_io.dart'; // Import thư viện Shelf để chạy server.
import 'package:shelf_router/shelf_router.dart'; // Import thư viện Shelf Router để định tuyến.

// Cấu hình các route.
final _router =
    Router()
      ..get('/continent', continentHandler) // Định tuyến GET cho /continent.
      ..mount('/destination', DestinationApi().router.call) // Định tuyến cho /destination.
      ..mount('/booking', BookingApi().router.call) // Định tuyến cho /booking.
      ..mount('/user', UserApi().router.call) // Định tuyến cho /user.
      ..mount('/login', LoginApi().router.call); // Định tuyến cho /login.

void main(List<String> args) async {
  // Sử dụng bất kỳ host hoặc IP container nào có sẵn (thường là `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Cấu hình một pipeline để ghi log các yêu cầu.
  final handler = Pipeline()
      .addMiddleware(logRequests()) // Thêm middleware ghi log yêu cầu.
      .addMiddleware(authRequests()) // Thêm middleware xác thực yêu cầu.
      .addHandler(_router.call); // Thêm router vào pipeline.

  // Để chạy trong container, chúng ta tôn trọng biến môi trường PORT.
  final port = int.parse(Platform.environment['PORT'] ?? '8080'); // Lấy port từ biến môi trường hoặc sử dụng 8080.
  final server = await serve(handler, ip, port); // Khởi động server.
  print('Server listening on port ${server.port}'); // In ra thông báo server đang lắng nghe trên port nào.
}
