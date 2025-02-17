// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookingApiModel _$BookingApiModelFromJson(Map<String, dynamic> json) {
  return _BookingApiModel.fromJson(json);
}

/// @nodoc
mixin _$BookingApiModel {
  /// ID của Booking. Được tạo khi lưu trữ trên server.
  int? get id => throw _privateConstructorUsedError;

  /// Ngày bắt đầu của chuyến đi
  DateTime get startDate => throw _privateConstructorUsedError;

  /// Ngày kết thúc của chuyến đi
  DateTime get endDate => throw _privateConstructorUsedError;

  /// Tên của Booking
  /// Nên là "Điểm đến, Châu lục"
  String get name => throw _privateConstructorUsedError;

  /// Điểm đến của chuyến đi
  String get destinationRef => throw _privateConstructorUsedError;

  /// Danh sách các hoạt động đã chọn
  List<String> get activitiesRef => throw _privateConstructorUsedError;

  /// Chuyển đổi BookingApiModel này thành một bản đồ JSON.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Tạo một bản sao của BookingApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingApiModelCopyWith<BookingApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingApiModelCopyWith<$Res> {
  factory $BookingApiModelCopyWith(
    BookingApiModel value,
    $Res Function(BookingApiModel) then,
  ) = _$BookingApiModelCopyWithImpl<$Res, BookingApiModel>;
  @useResult
  $Res call({
    int? id,
    DateTime startDate,
    DateTime endDate,
    String name,
    String destinationRef,
    List<String> activitiesRef,
  });
}

/// @nodoc
class _$BookingApiModelCopyWithImpl<$Res, $Val extends BookingApiModel>
    implements $BookingApiModelCopyWith<$Res> {
  _$BookingApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Tạo một bản sao của BookingApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? name = null,
    Object? destinationRef = null,
    Object? activitiesRef = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            startDate:
                null == startDate
                    ? _value.startDate
                    : startDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            endDate:
                null == endDate
                    ? _value.endDate
                    : endDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            destinationRef:
                null == destinationRef
                    ? _value.destinationRef
                    : destinationRef // ignore: cast_nullable_to_non_nullable
                        as String,
            activitiesRef:
                null == activitiesRef
                    ? _value.activitiesRef
                    : activitiesRef // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingApiModelImplCopyWith<$Res>
    implements $BookingApiModelCopyWith<$Res> {
  factory _$$BookingApiModelImplCopyWith(
    _$BookingApiModelImpl value,
    $Res Function(_$BookingApiModelImpl) then,
  ) = __$$BookingApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    DateTime startDate,
    DateTime endDate,
    String name,
    String destinationRef,
    List<String> activitiesRef,
  });
}

/// @nodoc
class __$$BookingApiModelImplCopyWithImpl<$Res>
    extends _$BookingApiModelCopyWithImpl<$Res, _$BookingApiModelImpl>
    implements _$$BookingApiModelImplCopyWith<$Res> {
  __$$BookingApiModelImplCopyWithImpl(
    _$BookingApiModelImpl _value,
    $Res Function(_$BookingApiModelImpl) _then,
  ) : super(_value, _then);

  /// Tạo một bản sao của BookingApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? name = null,
    Object? destinationRef = null,
    Object? activitiesRef = null,
  }) {
    return _then(
      _$BookingApiModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        startDate:
            null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        endDate:
            null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        destinationRef:
            null == destinationRef
                ? _value.destinationRef
                : destinationRef // ignore: cast_nullable_to_non_nullable
                    as String,
        activitiesRef:
            null == activitiesRef
                ? _value._activitiesRef
                : activitiesRef // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingApiModelImpl implements _BookingApiModel {
  const _$BookingApiModelImpl({
    this.id,
    required this.startDate,
    required this.endDate,
    required this.name,
    required this.destinationRef,
    required final List<String> activitiesRef,
  }) : _activitiesRef = activitiesRef;

  factory _$BookingApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingApiModelImplFromJson(json);

  /// ID của Booking. Được tạo khi lưu trữ trên server.
  @override
  final int? id;

  /// Ngày bắt đầu của chuyến đi
  @override
  final DateTime startDate;

  /// Ngày kết thúc của chuyến đi
  @override
  final DateTime endDate;

  /// Tên của Booking
  /// Nên là "Điểm đến, Châu lục"
  @override
  final String name;

  /// Điểm đến của chuyến đi
  @override
  final String destinationRef;

  /// Danh sách các hoạt động đã chọn
  final List<String> _activitiesRef;

  /// Danh sách các hoạt động đã chọn
  @override
  List<String> get activitiesRef {
    if (_activitiesRef is EqualUnmodifiableListView) return _activitiesRef;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activitiesRef);
  }

  @override
  String toString() {
    return 'BookingApiModel(id: $id, startDate: $startDate, endDate: $endDate, name: $name, destinationRef: $destinationRef, activitiesRef: $activitiesRef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingApiModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.destinationRef, destinationRef) ||
                other.destinationRef == destinationRef) &&
            const DeepCollectionEquality().equals(
              other._activitiesRef,
              _activitiesRef,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    startDate,
    endDate,
    name,
    destinationRef,
    const DeepCollectionEquality().hash(_activitiesRef),
  );

  /// Tạo một bản sao của BookingApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingApiModelImplCopyWith<_$BookingApiModelImpl> get copyWith =>
      __$$BookingApiModelImplCopyWithImpl<_$BookingApiModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingApiModelImplToJson(this);
  }
}

abstract class _BookingApiModel implements BookingApiModel {
  const factory _BookingApiModel({
    final int? id,
    required final DateTime startDate,
    required final DateTime endDate,
    required final String name,
    required final String destinationRef,
    required final List<String> activitiesRef,
  }) = _$BookingApiModelImpl;

  factory _BookingApiModel.fromJson(Map<String, dynamic> json) =
      _$BookingApiModelImpl.fromJson;

  /// ID của Booking. Được tạo khi lưu trữ trên server.
  @override
  int? get id;

  /// Ngày bắt đầu của chuyến đi
  @override
  DateTime get startDate;

  /// Ngày kết thúc của chuyến đi
  @override
  DateTime get endDate;

  /// Tên của Booking
  /// Nên là "Điểm đến, Châu lục"
  @override
  String get name;

  /// Điểm đến của chuyến đi
  @override
  String get destinationRef;

  /// Danh sách các hoạt động đã chọn
  @override
  List<String> get activitiesRef;

  /// Tạo một bản sao của BookingApiModel
  /// với các trường được thay thế bởi các giá trị tham số không null.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingApiModelImplCopyWith<_$BookingApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
