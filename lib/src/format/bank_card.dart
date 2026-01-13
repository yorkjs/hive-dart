/// 格式化银行卡号
String formatBankCardNumber(String value) {
  final length = value.length;

  /// 每4位一组，最后一组如果不足4位，有多少显示多少
  final parts = <String>[];
  for (int i = 0; i < length; i += 4) {
    final end = (i + 4) > length ? length : i + 4;
    parts.add(value.substring(i, end));
  }

  return parts.join(' ');
}