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
  mst:
      json['mst']
          as String?, // Lấy giá trị 'mst' từ JSON và gán cho thuộc tính mst
  tencty:
      json['tencty']
          as String?, // Lấy giá trị 'tencty' từ JSON và gán cho thuộc tính tencty
  picture:
      json['picture']
          as String?, // Lấy giá trị 'picture' từ JSON và gán cho thuộc tính picture
  diachi:
      json['diachi']
          as String?, // Lấy giá trị 'diachi' từ JSON và gán cho thuộc tính diachi
);

// Hàm chuyển đổi từ đối tượng _$UserApiModelImpl sang JSON
Map<String, dynamic> _$$UserApiModelImplToJson(
  _$UserApiModelImpl instance,
) => <String, dynamic>{
  'id': instance.id, // Chuyển thuộc tính id của đối tượng thành giá trị JSON
  'mst': instance.mst, // Chuyển thuộc tính mst của đối tượng thành giá trị JSON
  'tencty':
      instance
          .tencty, // Chuyển thuộc tính tencty của đối tượng thành giá trị JSON
  'picture':
      instance
          .picture, // Chuyển thuộc tính picture của đối tượng thành giá trị JSON
  'diachi':
      instance
          .diachi, // Chuyển thuộc tính diachi của đối tượng thành giá trị JSON
};
