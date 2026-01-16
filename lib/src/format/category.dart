import 'package:hive_dart/src/format/area.dart';

class ICategory {
  INode? category1;
  INode? category2;
  INode? category3;

  ICategory({
    this.category1,
    this.category2,
    this.category3,
  });
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