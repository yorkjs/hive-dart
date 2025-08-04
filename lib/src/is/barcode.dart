/// 验证是否是标准条码
bool isStandardBarcode(String value) {
  // EAN 码：通常是69开头，13位数字
  // UPC 码：通常以0开头，12位数字
  final length = value.length;
  if (length == 8 || length == 12 || length == 13 || length == 14) {
    // 检查是否全部为数字
    return RegExp(r'^\d+$').hasMatch(value);
  }
  return false;
}

/// 验证是否是自定义条码
bool isCustomBarcode(String value) {
  // 自定义条码，规则为 大写字母开头跟 10-12 个数字
  if (RegExp(r'^[A-Z]\d{10,12}$').hasMatch(value)) {
    return true;
  }
  // 这里留给以后加其他规则
  return false;
}