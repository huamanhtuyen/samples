// Bản quyền 2024 thuộc về nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể
// được tìm thấy trong tệp LICENSE.

import 'dart:ui'; // Nhập thư viện 'dart:ui' để sử dụng các chức năng liên quan đến giao diện người dùng.

final kBlurFilter = ImageFilter.blur(
  sigmaX: 2,
  sigmaY: 2,
); // Tạo bộ lọc làm mờ với độ mờ theo trục X và Y là 2.
