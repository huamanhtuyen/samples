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

  String? get sdt1 => throw _privateConstructorUsedError;
  String? get sdt2 => throw _privateConstructorUsedError;
  String? get sdt3 => throw _privateConstructorUsedError;
  String? get nguoidaidiendn => throw _privateConstructorUsedError;
  String? get stk1 => throw _privateConstructorUsedError;
  String? get tennganhang1 => throw _privateConstructorUsedError;
  String? get stk2 => throw _privateConstructorUsedError;
  String? get tennganhang2 => throw _privateConstructorUsedError;
  String? get stk3 => throw _privateConstructorUsedError;
  String? get tennganhang3 => throw _privateConstructorUsedError;

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
    String? sdt1,
    String? sdt2,
    String? sdt3,
    String? nguoidaidiendn,
    String? stk1,
    String? tennganhang1,
    String? stk2,
    String? tennganhang2,
    String? stk3,
    String? tennganhang3,
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
    Object? sdt1 = freezed,
    Object? sdt2 = freezed,
    Object? sdt3 = freezed,
    Object? nguoidaidiendn = freezed,
    Object? stk1 = freezed,
    Object? tennganhang1 = freezed,
    Object? stk2 = freezed,
    Object? tennganhang2 = freezed,
    Object? stk3 = freezed,
    Object? tennganhang3 = freezed,
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
            sdt1:
                freezed == sdt1
                    ? _value.sdt1
                    : sdt1 // ignore: cast_nullable_to_non_nullable
                        as String?,
            sdt2:
                freezed == sdt2
                    ? _value.sdt2
                    : sdt2 // ignore: cast_nullable_to_non_nullable
                        as String?,
            sdt3:
                freezed == sdt3
                    ? _value.sdt3
                    : sdt3 // ignore: cast_nullable_to_non_nullable
                        as String?,
            nguoidaidiendn:
                freezed == nguoidaidiendn
                    ? _value.nguoidaidiendn
                    : nguoidaidiendn // ignore: cast_nullable_to_non_nullable
                        as String?,
            stk1:
                freezed == stk1
                    ? _value.stk1
                    : stk1 // ignore: cast_nullable_to_non_nullable
                        as String?,
            tennganhang1:
                freezed == tennganhang1
                    ? _value.tennganhang1
                    : tennganhang1 // ignore: cast_nullable_to_non_nullable
                        as String?,
            stk2:
                freezed == stk2
                    ? _value.stk2
                    : stk2 // ignore: cast_nullable_to_non_nullable
                        as String?,
            tennganhang2:
                freezed == tennganhang2
                    ? _value.tennganhang2
                    : tennganhang2 // ignore: cast_nullable_to_non_nullable
                        as String?,
            stk3:
                freezed == stk3
                    ? _value.stk3
                    : stk3 // ignore: cast_nullable_to_non_nullable
                        as String?,
            tennganhang3:
                freezed == tennganhang3
                    ? _value.tennganhang3
                    : tennganhang3 // ignore: cast_nullable_to_non_nullable
                        as String?,
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
    String? sdt1,
    String? sdt2,
    String? sdt3,
    String? nguoidaidiendn,
    String? stk1,
    String? tennganhang1,
    String? stk2,
    String? tennganhang2,
    String? stk3,
    String? tennganhang3,
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
    Object? sdt1 = freezed,
    Object? sdt2 = freezed,
    Object? sdt3 = freezed,
    Object? nguoidaidiendn = freezed,
    Object? stk1 = freezed,
    Object? tennganhang1 = freezed,
    Object? stk2 = freezed,
    Object? tennganhang2 = freezed,
    Object? stk3 = freezed,
    Object? tennganhang3 = freezed,
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
        sdt1:
            freezed == sdt1
                ? _value.sdt1
                : sdt1 // ignore: cast_nullable_to_non_nullable
                    as String?,
        sdt2:
            freezed == sdt2
                ? _value.sdt2
                : sdt2 // ignore: cast_nullable_to_non_nullable
                    as String?,
        sdt3:
            freezed == sdt3
                ? _value.sdt3
                : sdt3 // ignore: cast_nullable_to_non_nullable
                    as String?,
        nguoidaidiendn:
            freezed == nguoidaidiendn
                ? _value.nguoidaidiendn
                : nguoidaidiendn // ignore: cast_nullable_to_non_nullable
                    as String?,
        stk1:
            freezed == stk1
                ? _value.stk1
                : stk1 // ignore: cast_nullable_to_non_nullable
                    as String?,
        tennganhang1:
            freezed == tennganhang1
                ? _value.tennganhang1
                : tennganhang1 // ignore: cast_nullable_to_non_nullable
                    as String?,
        stk2:
            freezed == stk2
                ? _value.stk2
                : stk2 // ignore: cast_nullable_to_non_nullable
                    as String?,
        tennganhang2:
            freezed == tennganhang2
                ? _value.tennganhang2
                : tennganhang2 // ignore: cast_nullable_to_non_nullable
                    as String?,
        stk3:
            freezed == stk3
                ? _value.stk3
                : stk3 // ignore: cast_nullable_to_non_nullable
                    as String?,
        tennganhang3:
            freezed == tennganhang3
                ? _value.tennganhang3
                : tennganhang3 // ignore: cast_nullable_to_non_nullable
                    as String?,
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
    this.sdt1,
    this.sdt2,
    this.sdt3,
    this.nguoidaidiendn,
    this.stk1,
    this.tennganhang1,
    this.stk2,
    this.tennganhang2,
    this.stk3,
    this.tennganhang3,
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
  final String? sdt1;
  @override
  final String? sdt2;
  @override
  final String? sdt3;
  @override
  final String? nguoidaidiendn;
  @override
  final String? stk1;
  @override
  final String? tennganhang1;
  @override
  final String? stk2;
  @override
  final String? tennganhang2;
  @override
  final String? stk3;
  @override
  final String? tennganhang3;

  @override
  String toString() {
    return 'User(id: $id, mst: $mst, tencty: $tencty, picture: $picture, diachi: $diachi, sdt1: $sdt1, sdt2: $sdt2, sdt3: $sdt3, nguoidaidiendn: $nguoidaidiendn, stk1: $stk1, tennganhang1: $tennganhang1, stk2: $stk2, tennganhang2: $tennganhang2, stk3: $stk3, tennganhang3: $tennganhang3)'; // Add diachi field
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
            (identical(other.diachi, diachi) || other.diachi == diachi) &&
            (identical(other.sdt1, sdt1) || other.sdt1 == sdt1) &&
            (identical(other.sdt2, sdt2) || other.sdt2 == sdt2) &&
            (identical(other.sdt3, sdt3) || other.sdt3 == sdt3) &&
            (identical(other.nguoidaidiendn, nguoidaidiendn) ||
                other.nguoidaidiendn == nguoidaidiendn) &&
            (identical(other.stk1, stk1) || other.stk1 == stk1) &&
            (identical(other.tennganhang1, tennganhang1) ||
                other.tennganhang1 == tennganhang1) &&
            (identical(other.stk2, stk2) || other.stk2 == stk2) &&
            (identical(other.tennganhang2, tennganhang2) ||
                other.tennganhang2 == tennganhang2) &&
            (identical(other.stk3, stk3) || other.stk3 == stk3) &&
            (identical(other.tennganhang3, tennganhang3) ||
                other.tennganhang3 == tennganhang3)); // Add diachi field
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    mst,
    tencty,
    picture,
    diachi,
    sdt1,
    sdt2,
    sdt3,
    nguoidaidiendn,
    stk1,
    tennganhang1,
    stk2,
    tennganhang2,
    stk3,
    tennganhang3,
  ); // Add diachi field

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
    final String? sdt1,
    final String? sdt2,
    final String? sdt3,
    final String? nguoidaidiendn,
    final String? stk1,
    final String? tennganhang1,
    final String? stk2,
    final String? tennganhang2,
    final String? stk3,
    final String? tennganhang3,
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

  @override
  String? get sdt1;
  @override
  String? get sdt2;
  @override
  String? get sdt3;
  @override
  String? get nguoidaidiendn;
  @override
  String? get stk1;
  @override
  String? get tennganhang1;
  @override
  String? get stk2;
  @override
  String? get tennganhang2;
  @override
  String? get stk3;
  @override
  String? get tennganhang3;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
