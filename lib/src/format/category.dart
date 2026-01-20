import 'package:hive_dart/src/type.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class ICategory {
  @JsonKey(name: "category1")
  INode? category1;
  @JsonKey(name: "category2")
  INode? category2;
  @JsonKey(name: "category3")
  INode? category3;

  ICategory({
    this.category1,
    this.category2,
    this.category3,
  });

  factory ICategory.fromJson(Map<String, dynamic> json) =>
      _$ICategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ICategoryToJson(this);
}

// 格式化地区信息
String formatCategory(ICategory category) {

  final List<String> list = [];

  if (category.category1 != null) {
    list.add(category.category1!.name);
  }
  if (category.category2 != null) {
    list.add(category.category2!.name);
  }
  if (category.category3 != null) {
    list.add(category.category3!.name);
  }

  return list.join('/');
}