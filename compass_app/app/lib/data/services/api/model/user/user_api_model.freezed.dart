// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'Có vẻ như bạn đã tạo lớp của mình bằng cách sử dụng `MyClass._()`. Constructor này chỉ được sử dụng bởi freezed và bạn không cần phải sử dụng nó.\nVui lòng kiểm tra tài liệu tại đây để biết thêm thông tin: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) {
  return _UserApiModel.fromJson(json);
}

/// @nodoc
mixin _$UserApiModel {
  /// ID của người dùng.
  String get id => throw _privateConstructorUsedError;

  /// mã số thuế.
  String? get mst => throw _privateConstructorUsedError;

  /// tencty của người dùng.
  String? get tencty => throw _privateConstructorUsedError;

  /// URL hình ảnh của người dùng.
  String? get picture => throw _privateConstructorUsedError;

  /// Địa chỉ của người dùng.
  String? get diachi => throw _privateConstructorUsedError;

  /// Chuyển đổi UserApiModel này thành một bản đồ JSON.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Tạo một bản sao của UserApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserApiModelCopyWith<UserApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserApiModelCopyWith<$Res> {
  factory $UserApiModelCopyWith(
    UserApiModel value,
    $Res Function(UserApiModel) then,
  ) = _$UserApiModelCopyWithImpl<$Res, UserApiModel>;
  @useResult
  $Res call({
    String id,
    String? mst,
    String? tencty,
    String? picture,
    String? diachi,
  });
}

/// @nodoc
class _$UserApiModelCopyWithImpl<$Res, $Val extends UserApiModel>
    implements $UserApiModelCopyWith<$Res> {
  _$UserApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Tạo một bản sao của UserApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mst = null,
    Object? tencty = null,
    Object? picture = null,
    Object? diachi = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            mst:
                null == mst
                    ? _value.mst
                    : mst // ignore: cast_nullable_to_non_nullable
                        as String,
            tencty:
                null == tencty
                    ? _value.tencty
                    : tencty // ignore: cast_nullable_to_non_nullable
                        as String,
            picture:
                null == picture
                    ? _value.picture
                    : picture // ignore: cast_nullable_to_non_nullable
                        as String,
            diachi:
                null == diachi
                    ? _value.diachi
                    : diachi // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserApiModelImplCopyWith<$Res>
    implements $UserApiModelCopyWith<$Res> {
  factory _$$UserApiModelImplCopyWith(
    _$UserApiModelImpl value,
    $Res Function(_$UserApiModelImpl) then,
  ) = __$$UserApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? mst,
    String? tencty,
    String? picture,
    String? diachi,
  });
}

/// @nodoc
class __$$UserApiModelImplCopyWithImpl<$Res>
    extends _$UserApiModelCopyWithImpl<$Res, _$UserApiModelImpl>
    implements _$$UserApiModelImplCopyWith<$Res> {
  __$$UserApiModelImplCopyWithImpl(
    _$UserApiModelImpl _value,
    $Res Function(_$UserApiModelImpl) _then,
  ) : super(_value, _then);

  /// Tạo một bản sao của UserApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mst = null,
    Object? tencty = null,
    Object? picture = null,
    Object? diachi = null,
  }) {
    return _then(
      _$UserApiModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        mst:
            null == mst
                ? _value.mst
                : mst // ignore: cast_nullable_to_non_nullable
                    as String,
        tencty:
            null == tencty
                ? _value.tencty
                : tencty // ignore: cast_nullable_to_non_nullable
                    as String,
        picture:
            null == picture
                ? _value.picture
                : picture // ignore: cast_nullable_to_non_nullable
                    as String,
        diachi:
            null == diachi
                ? _value.diachi
                : diachi // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserApiModelImpl implements _UserApiModel {
  const _$UserApiModelImpl({
    required this.id,
    this.mst, // Make optional
    this.tencty, // Make optional
    this.picture, // Make optional
    this.diachi, // Make optional
  });

  factory _$UserApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserApiModelImplFromJson(json);

  /// ID của người dùng.
  @override
  final String id;

  /// Tên của người dùng.
  @override
  final String? mst;

  /// tencty của người dùng.
  @override
  final String? tencty;

  /// URL hình ảnh của người dùng.
  @override
  final String? picture;

  /// Địa chỉ của người dùng.
  @override
  final String? diachi;

  @override
  String toString() {
    return 'UserApiModel(id: $id, mst: $mst, tencty: $tencty, picture: $picture, diachi: $diachi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserApiModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mst, mst) || other.mst == mst) &&
            (identical(other.tencty, tencty) || other.tencty == tencty) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.diachi, diachi) || other.diachi == diachi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mst, tencty, picture, diachi);

  /// Tạo một bản sao của UserApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserApiModelImplCopyWith<_$UserApiModelImpl> get copyWith =>
      __$$UserApiModelImplCopyWithImpl<_$UserApiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserApiModelImplToJson(this);
  }
}

abstract class _UserApiModel implements UserApiModel {
  const factory _UserApiModel({
    required final String id,
    final String? mst,
    final String? tencty,
    final String? picture,
    final String? diachi,
  }) = _$UserApiModelImpl;

  factory _UserApiModel.fromJson(Map<String, dynamic> json) =
      _$UserApiModelImpl.fromJson;

  /// ID của người dùng.
  @override
  String get id;

  /// Tên của người dùng.
  @override
  String? get mst;

  /// tencty của người dùng.
  @override
  String? get tencty;

  /// URL hình ảnh của người dùng.
  @override
  String? get picture;

  /// Địa chỉ của người dùng.
  @override
  String? get diachi;

  /// Tạo một bản sao của UserApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserApiModelImplCopyWith<_$UserApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
