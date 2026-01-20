// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ICategory _$ICategoryFromJson(Map<String, dynamic> json) => ICategory(
  category1: json['category1'] == null
      ? null
      : INode.fromJson(json['category1'] as Map<String, dynamic>),
  category2: json['category2'] == null
      ? null
      : INode.fromJson(json['category2'] as Map<String, dynamic>),
  category3: json['category3'] == null
      ? null
      : INode.fromJson(json['category3'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ICategoryToJson(ICategory instance) => <String, dynamic>{
  'category1': instance.category1,
  'category2': instance.category2,
  'category3': instance.category3,
};
