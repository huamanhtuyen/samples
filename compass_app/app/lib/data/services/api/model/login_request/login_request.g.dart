// GENERATED CODE - DO NOT MODIFY BY HAND
// Mã được sinh tự động - KHÔNG CHỈNH SỬA BẰNG TAY

part of 'login_request.dart';
// Phần của file 'login_request.dart'

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// Hàm chuyển đổi từ JSON sang đối tượng _$LoginRequestImpl
_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String, // Lấy giá trị email từ JSON
      password: json['password'] as String, // Lấy giá trị password từ JSON
    );

// Hàm chuyển đổi từ đối tượng _$LoginRequestImpl sang JSON
Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email, // Đặt giá trị email vào JSON
      'password': instance.password, // Đặt giá trị password vào JSON
    };
