/// 标准化版本号，方便后续进行比较
String normalizeVersion(String version) {
  final tokens = version.split('.');
  switch (tokens.length) {
    case 1:
      return tokens[0].padLeft(12, '0');
    case 2:
      return tokens[0].padLeft(6, '0') + tokens[1].padLeft(6, '0');
    case 3:
      return tokens[0].padLeft(4, '0') +
              tokens[1].padLeft(4, '0') +
              tokens[2].padLeft(4, '0');
  }
  return '000000000000';
}