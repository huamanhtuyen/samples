// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  mst: json['mst'] as String?,
  tencty: json['tencty'] as String?,
  picture: json['picture'] as String?,
  diachi: json['diachi'] as String?, // Add diachi field
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mst': instance.mst,
      'tencty': instance.tencty,
      'picture': instance.picture,
      'diachi': instance.diachi, // Add diachi field
    };
