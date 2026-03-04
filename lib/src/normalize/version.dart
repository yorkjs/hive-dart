import '../util/string.dart';

/// 标准化版本号，方便后续进行比较
String normalizeVersion(String version) {
  final tokens = version.split('.');
  switch (tokens.length) {
    case 1:
      return padStringStart(tokens[0], 12);
    case 2:
      return padStringStart(tokens[0], 6) + padStringStart(tokens[1], 6);
    case 3:
      return padStringStart(tokens[0], 4) +
          padStringStart(tokens[1], 4) +
          padStringStart(tokens[2], 4);
  }
  return '000000000000';
}
