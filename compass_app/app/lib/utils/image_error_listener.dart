// Bản quyền 2024 của nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

// Nhập gói 'logging' để sử dụng chức năng ghi nhật ký.
import 'package:logging/logging.dart';

// Khởi tạo một logger với tên 'ImageErrorListener'.
final _log = Logger('ImageErrorListener');

// Hàm lắng nghe lỗi hình ảnh.
void imageErrorListener(Object error) {
  // Ghi cảnh báo khi không tải được hình ảnh, kèm theo thông tin lỗi.
  _log.warning('Failed to load image', error);
}
