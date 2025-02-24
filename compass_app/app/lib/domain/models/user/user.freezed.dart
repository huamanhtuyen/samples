// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  /// The user's id.
  String get id => throw _privateConstructorUsedError;

  ///
  String? get mst => throw _privateConstructorUsedError;

  String? get tencty => throw _privateConstructorUsedError;

  /// The user's picture URL.
  String? get picture => throw _privateConstructorUsedError;

  /// The user's address.
  String? get diachi => throw _privateConstructorUsedError; // Add diachi field

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    String id,
    String? mst,
    String? tencty,
    String? picture,
    String? diachi,
  }); // Add diachi field
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mst = freezed,
    Object? tencty = freezed,
    Object? picture = freezed,
    Object? diachi = freezed, // Add diachi field
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            mst:
                freezed == mst
                    ? _value.mst
                    : mst // ignore: cast_nullable_to_non_nullable
                        as String?,
            tencty:
                freezed == tencty
                    ? _value.tencty
                    : tencty // ignore: cast_nullable_to_non_nullable
                        as String?,
            picture:
                freezed == picture
                    ? _value.picture
                    : picture // ignore: cast_nullable_to_non_nullable
                        as String?,
            diachi:
                freezed == diachi
                    ? _value.diachi
                    : diachi // ignore: cast_nullable_to_non_nullable
                        as String?, // Add diachi field
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? mst,
    String? tencty,
    String? picture,
    String? diachi,
  }); // Add diachi field
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mst = freezed,
    Object? tencty = freezed,
    Object? picture = freezed,
    Object? diachi = freezed, // Add diachi field
  }) {
    return _then(
      _$UserImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        mst:
            freezed == mst
                ? _value.mst
                : mst // ignore: cast_nullable_to_non_nullable
                    as String?,
        tencty:
            freezed == tencty
                ? _value.tencty
                : tencty // ignore: cast_nullable_to_non_nullable
                    as String?,
        picture:
            freezed == picture
                ? _value.picture
                : picture // ignore: cast_nullable_to_non_nullable
                    as String?,
        diachi:
            freezed == diachi
                ? _value.diachi
                : diachi // ignore: cast_nullable_to_non_nullable
                    as String?, // Add diachi field
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({
    required this.id,
    this.mst,
    this.tencty,
    this.picture,
    this.diachi,
  }); // Add diachi field

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;

  ///
  @override
  final String? mst;

  @override
  final String? tencty;

  /// The user's picture URL.
  @override
  final String? picture;

  /// The user's address.
  @override
  final String? diachi; // Add diachi field

  @override
  String toString() {
    return 'User(id: $id, mst: $mst, tencty: $tencty, picture: $picture, diachi: $diachi)'; // Add diachi field
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mst, mst) || other.mst == mst) &&
            (identical(other.tencty, tencty) || other.tencty == tencty) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.diachi, diachi) ||
                other.diachi == diachi)); // Add diachi field
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mst, tencty, picture, diachi); // Add diachi field

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    required final String id,
    final String? mst,
    final String? tencty,
    final String? picture,
    final String? diachi, // Add diachi field
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  ///
  @override
  String? get mst;

  ///
  @override
  String? get tencty;

  /// The user's picture URL.
  @override
  String? get picture;

  /// The user's address.
  @override
  String? get diachi; // Add diachi field

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
