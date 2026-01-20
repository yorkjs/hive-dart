// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IArea _$IAreaFromJson(Map<String, dynamic> json) => IArea(
  country: json['country'] == null
      ? null
      : INode.fromJson(json['country'] as Map<String, dynamic>),
  province: json['province'] == null
      ? null
      : INode.fromJson(json['province'] as Map<String, dynamic>),
  city: json['city'] == null
      ? null
      : INode.fromJson(json['city'] as Map<String, dynamic>),
  district: json['district'] == null
      ? null
      : INode.fromJson(json['district'] as Map<String, dynamic>),
  address: json['address'] as String?,
);

Map<String, dynamic> _$IAreaToJson(IArea instance) => <String, dynamic>{
  'country': instance.country,
  'province': instance.province,
  'city': instance.city,
  'district': instance.district,
  'address': instance.address,
};
