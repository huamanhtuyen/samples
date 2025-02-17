// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// Hàm này trả về giá trị đầu vào mà không thay đổi gì
T _$identity<T>(T value) => value;

// Tạo một lỗi không hỗ trợ cho constructor riêng tư
final _privateConstructorUsedError = UnsupportedError(
  'Có vẻ như bạn đã tạo lớp của mình bằng cách sử dụng `MyClass._()`. Constructor này chỉ được sử dụng bởi freezed và bạn không cần phải sử dụng nó.\nVui lòng kiểm tra tài liệu tại đây để biết thêm thông tin: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

// Hàm này chuyển đổi JSON thành đối tượng LoginRequest
LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
// Mixin này định nghĩa các thuộc tính và phương thức cho LoginRequest
mixin _$LoginRequest {
  /// Địa chỉ email.
  String get email => throw _privateConstructorUsedError;

  /// Mật khẩu dạng văn bản thuần túy.
  String get password => throw _privateConstructorUsedError;

  /// Chuyển đổi LoginRequest thành một bản đồ JSON.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Tạo một bản sao của LoginRequest
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
// Định nghĩa một interface để sao chép LoginRequest với các giá trị mới
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
    LoginRequest value,
    $Res Function(LoginRequest) then,
  ) = _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
// Triển khai interface sao chép LoginRequest
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Tạo một bản sao của LoginRequest
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
// Định nghĩa một interface để sao chép _LoginRequest với các giá trị mới
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
    _$LoginRequestImpl value,
    $Res Function(_$LoginRequestImpl) then,
  ) = __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
// Triển khai interface sao chép _LoginRequest
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
    _$LoginRequestImpl _value,
    $Res Function(_$LoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Tạo một bản sao của _LoginRequest
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$LoginRequestImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
// Đánh dấu lớp này là có thể chuyển đổi thành JSON
@JsonSerializable()
// Triển khai lớp _LoginRequest
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl({required this.email, required this.password});

  // Hàm tạo từ JSON
  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  /// Địa chỉ email.
  @override
  final String email;

  /// Mật khẩu dạng văn bản thuần túy.
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Tạo một bản sao của _LoginRequest
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(this);
  }
}

// Định nghĩa lớp trừu tượng _LoginRequest
abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest({
    required final String email,
    required final String password,
  }) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  /// Địa chỉ email.
  @override
  String get email;

  /// Mật khẩu dạng văn bản thuần túy.
  @override
  String get password;

  /// Tạo một bản sao của _LoginRequest
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
