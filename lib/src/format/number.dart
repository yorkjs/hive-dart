
import '../util/number.dart';

String formatNumberWithComma(num value, {int decimals = 0}) {
  final isNegative = value < 0;
  // 先转成正数，避免 - 号影响格式化流程
  if (isNegative) {
    value = -value;
  }
  final newValue = decimals >= 0 ? truncateNumber(value, decimals: decimals) : value.toString();

  final parts = newValue.split('.');
  var integerPart = parts[0];
  var decimalPart = parts.length > 1 ? parts[1] : null;

  // 格式化整数部分
  final list = <String>[];
  final end = integerPart.length - 1;
  for (int i = end; i >= 0; i--) {
    if (i != end && (end - i) % 3 == 0) {
      list.add(',');
    }
    list.add(integerPart[i]);
  }

  var result = list.reversed.join();

  // 处理小数部分
  if (decimalPart != null) {
    if (decimals > 0) {
      decimalPart = decimalPart.padRight(decimals, '0');
      if (decimalPart.length > decimals) {
        decimalPart = decimalPart.substring(0, decimals);
      }
      result += '.$decimalPart';
    }
  } else if (decimals > 0) {
    result += '.${'0' * decimals}';
  }

    return isNegative ? '-$result' : result;
}