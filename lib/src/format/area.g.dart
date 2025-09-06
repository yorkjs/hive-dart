// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeModel _$NodeModelFromJson(Map<String, dynamic> json) =>
    NodeModel(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$NodeModelToJson(NodeModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

AreaModel _$AreaModelFromJson(Map<String, dynamic> json) => AreaModel(
  country: json['country'] == null
      ? null
      : NodeModel.fromJson(json['country'] as Map<String, dynamic>),
  province: json['province'] == null
      ? null
      : NodeModel.fromJson(json['province'] as Map<String, dynamic>),
  city: json['city'] == null
      ? null
      : NodeModel.fromJson(json['city'] as Map<String, dynamic>),
  district: json['district'] == null
      ? null
      : NodeModel.fromJson(json['district'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AreaModelToJson(AreaModel instance) => <String, dynamic>{
  'country': instance.country,
  'province': instance.province,
  'city': instance.city,
  'district': instance.district,
};
