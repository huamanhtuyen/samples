// GENERATED CODE - DO NOT MODIFY BY HAND
// Mã được sinh tự động - KHÔNG CHỈNH SỬA BẰNG TAY

part of 'user_api_model.dart'; // Phần của file 'user_api_model.dart'

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// Hàm chuyển đổi từ JSON sang đối tượng _$UserApiModelImpl
_$UserApiModelImpl _$$UserApiModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserApiModelImpl(
  id: json['id'] as String, // Lấy giá trị 'id' từ JSON và gán cho thuộc tính id
  name:
      json['name']
          as String, // Lấy giá trị 'name' từ JSON và gán cho thuộc tính name
  tencty:
      json['email']
          as String, // Lấy giá trị 'email' từ JSON và gán cho thuộc tính email
  picture:
      json['picture']
          as String, // Lấy giá trị 'picture' từ JSON và gán cho thuộc tính picture
);

// Hàm chuyển đổi từ đối tượng _$UserApiModelImpl sang JSON
Map<String, dynamic> _$$UserApiModelImplToJson(
  _$UserApiModelImpl instance,
) => <String, dynamic>{
  'id': instance.id, // Chuyển thuộc tính id của đối tượng thành giá trị JSON
  'name':
      instance.name, // Chuyển thuộc tính name của đối tượng thành giá trị JSON
  'email':
      instance
          .tencty, // Chuyển thuộc tính email của đối tượng thành giá trị JSON
  'picture':
      instance
          .picture, // Chuyển thuộc tính picture của đối tượng thành giá trị JSON
};
