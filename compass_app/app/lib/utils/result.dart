// Bản quyền 2024 thuộc về nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

/// Lớp tiện ích để bao bọc dữ liệu kết quả
///
/// Đánh giá kết quả bằng cách sử dụng câu lệnh switch:
/// ```dart
/// switch (result) {
///   case Ok(): {
///     print(result.value);
///   }
///   case Error(): {
///     print(result.error);
///   }
/// }
/// ```
sealed class Result<T> {
  const Result();

  /// Tạo một [Result] thành công, hoàn thành với [value] được chỉ định.
  //Trong trường hợp này, Ok._ là một constructor riêng tư của lớp Ok, và nó chỉ có thể được gọi từ bên trong thư viện chứa lớp Ok. Điều này giúp kiểm soát việc khởi tạo các đối tượng Ok và Error chỉ thông qua các factory constructor Result.ok và Result.error.
  //Điều này có nghĩa là khi bạn gọi Result.ok(value), nó sẽ tạo ra một đối tượng Ok bằng cách sử dụng constructor riêng tư Ok._.
  const factory Result.ok(T value) = Ok._;

  /// Tạo một [Result] lỗi, hoàn thành với [error] được chỉ định.
  const factory Result.error(Exception error) = Error._;
}

/// Lớp con của Result cho các giá trị
final class Ok<T> extends Result<T> {
  //Dấu _ trong Ok._ biểu thị rằng constructor này là riêng tư và chỉ có thể được truy cập từ bên trong thư viện chứa lớp Ok.
  const Ok._(this.value);

  /// Giá trị được trả về trong kết quả
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// Lớp con của Result cho các lỗi
final class Error<T> extends Result<T> {
  const Error._(this.error);

  /// Lỗi được trả về trong kết quả
  final Exception error;

  String messsage() => error.toString();

  @override
  String toString() => 'Result<$T>.error($error)';
}
