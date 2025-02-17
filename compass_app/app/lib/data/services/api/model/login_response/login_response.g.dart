// GENERATED CODE - DO NOT MODIFY BY HAND
// Mã được sinh tự động - KHÔNG CHỈNH SỬA BẰNG TAY

part of 'login_response.dart'; // Phần của file 'login_response.dart'

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// Hàm chuyển đổi từ JSON sang đối tượng _$LoginResponseImpl
_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      token: json['token'] as String, // Lấy giá trị 'token' từ JSON
      userId: json['userId'] as String, // Lấy giá trị 'userId' từ JSON
    );

// Hàm chuyển đổi từ đối tượng _$LoginResponseImpl sang JSON
Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token, // Đặt giá trị 'token' vào JSON
      'userId': instance.userId, // Đặt giá trị 'userId' vào JSON
    };
