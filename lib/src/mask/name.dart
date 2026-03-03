import '../util/string.dart';

/// 脱敏姓名
String maskName(String name) {
  final length = getStringLength(name);
  if (length <= 1) {
    return "***";
  }
  return "***${name[length - 1]}";
}
