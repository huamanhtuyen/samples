// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có trong
// tệp LICENSE.

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'result.dart';

// Định nghĩa kiểu hàm không có tham số, trả về Future<Result<T>>
typedef CommandAction0<T> = Future<Result<T>> Function();
// Định nghĩa kiểu hàm có một tham số, trả về Future<Result<T>>
typedef CommandAction1<T, A> = Future<Result<T>> Function(A);

// Tạo điều kiện tương tác với ViewModel.
//
// Đóng gói một hành động,
// hiển thị trạng thái đang chạy và lỗi của nó,
// và đảm bảo rằng nó không thể được khởi chạy lại cho đến khi hoàn thành.
//
// Sử dụng [Command0] cho các hành động không có tham số.
// Sử dụng [Command1] cho các hành động có một tham số.
//
// Các hành động phải trả về một [Result].
//
// Tiêu thụ kết quả hành động bằng cách lắng nghe các thay đổi,
// sau đó gọi [clearResult] khi trạng thái đã được tiêu thụ.
abstract class Command<T> extends ChangeNotifier {
  Command();

  bool _running = false;

  // Trả về true khi hành động đang chạy.
  bool get running => _running;

  Result<T>? _result;

  // Trả về true nếu hành động hoàn thành với lỗi
  bool get error => _result is Error;

  // Trả về true nếu hành động hoàn thành thành công
  bool get completed => _result is Ok;

  // Lấy kết quả hành động cuối cùng
  Result? get result => _result;

  // Xóa kết quả hành động cuối cùng
  void clearResult() {
    _result = null;
    notifyListeners();
  }

  // Triển khai thực thi nội bộ
  Future<void> _execute(CommandAction0<T> action) async {
    // Đảm bảo hành động không thể khởi chạy nhiều lần.
    // ví dụ: tránh nhiều lần nhấn nút
    if (_running) return;

    // Thông báo cho các listener.
    // ví dụ: nút hiển thị trạng thái đang tải
    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

// [Command] không có tham số.
// Nhận một [CommandAction0] làm hành động.
class Command0<T> extends Command<T> {
  Command0(this._action);

  final CommandAction0<T> _action;

  // Thực thi hành động.
  Future<void> execute() async {
    await _execute(_action);
  }
}

// [Command] có một tham số.
// Nhận một [CommandAction1] làm hành động.
class Command1<T, A> extends Command<T> {
  Command1(this._action);

  final CommandAction1<T, A> _action;

  // Thực thi hành động với tham số.
  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}
