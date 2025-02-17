// GENERATED CODE - DO NOT MODIFY BY HAND
// Mã được sinh tự động - KHÔNG CHỈNH SỬA BẰNG TAY

part of 'booking_api_model.dart'; // Phần của 'booking_api_model.dart'

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// Hàm chuyển đổi từ JSON sang đối tượng _$BookingApiModelImpl
_$BookingApiModelImpl _$$BookingApiModelImplFromJson(
  Map<String, dynamic> json,
) => _$BookingApiModelImpl(
  id: (json['id'] as num?)?.toInt(), // Chuyển đổi 'id' từ JSON sang số nguyên
  startDate: DateTime.parse(
    json['startDate'] as String,
  ), // Chuyển đổi 'startDate' từ JSON sang DateTime
  endDate: DateTime.parse(
    json['endDate'] as String,
  ), // Chuyển đổi 'endDate' từ JSON sang DateTime
  name: json['name'] as String, // Chuyển đổi 'name' từ JSON sang chuỗi
  destinationRef:
      json['destinationRef']
          as String, // Chuyển đổi 'destinationRef' từ JSON sang chuỗi
  activitiesRef: ['111', '222', '333'],
  // (json['activitiesRef'] as List<dynamic>)
  //     .map((e) => e as String)
  //     .toList(), // Chuyển đổi 'activitiesRef' từ JSON sang danh sách chuỗi
);

// Hàm chuyển đổi từ đối tượng _$BookingApiModelImpl sang JSON
Map<String, dynamic> _$$BookingApiModelImplToJson(
  _$BookingApiModelImpl instance,
) => <String, dynamic>{
  'id': instance.id, // Chuyển đổi 'id' từ đối tượng sang JSON
  'startDate':
      instance.startDate
          .toIso8601String(), // Chuyển đổi 'startDate' từ DateTime sang chuỗi ISO 8601
  'endDate':
      instance.endDate
          .toIso8601String(), // Chuyển đổi 'endDate' từ DateTime sang chuỗi ISO 8601
  'name': instance.name, // Chuyển đổi 'name' từ đối tượng sang JSON
  'destinationRef':
      instance
          .destinationRef, // Chuyển đổi 'destinationRef' từ đối tượng sang JSON
  'activitiesRef':
      instance
          .activitiesRef, // Chuyển đổi 'activitiesRef' từ đối tượng sang JSON
};
