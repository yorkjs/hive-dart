// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Node _$NodeFromJson(Map<String, dynamic> json) =>
    Node(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$NodeToJson(Node instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
  country: json['country'] == null
      ? null
      : Node.fromJson(json['country'] as Map<String, dynamic>),
  province: json['province'] == null
      ? null
      : Node.fromJson(json['province'] as Map<String, dynamic>),
  city: json['city'] == null
      ? null
      : Node.fromJson(json['city'] as Map<String, dynamic>),
  district: json['district'] == null
      ? null
      : Node.fromJson(json['district'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
  'country': instance.country,
  'province': instance.province,
  'city': instance.city,
  'district': instance.district,
};
