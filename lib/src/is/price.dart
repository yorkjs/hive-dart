/// 验证价格格式
bool isPrice(String value) {
  return RegExp(r'^(?:[1-9]\d*|0)(?:\.\d{1,2})?$').hasMatch(value);
}