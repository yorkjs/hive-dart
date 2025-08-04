import 'package:decimal/decimal.dart';

/// 将 `num`（int/double）转换为 `Decimal`，避免精度问题
Decimal _numToDecimal(num n) {
  if (n is int) {
    return Decimal.fromInt(n);
  }
  else {
    return Decimal.parse(n.toString());
  }
}

/// 精确加法
num plusNumber(num value1, num value2) {
  return (_numToDecimal(value1) + _numToDecimal(value2)).toDouble();
}

/// 精确减法
num minusNumber(num value1, num value2) {
  return (_numToDecimal(value1) - _numToDecimal(value2)).toDouble();
}

/// 精确乘法
num timesNumber(num value1, num value2) {
  return (_numToDecimal(value1) * _numToDecimal(value2)).toDouble();
}

/// 精确除法
num divideNumber(num value1, num value2) {
  if (value2 == 0) {
    throw ArgumentError('Divisor cannot be zero');
  }
  return (_numToDecimal(value1) / _numToDecimal(value2)).toDouble();
}

/// 截断数字
String truncateNumber(num value, {int decimals = 0}) {

  final parts = value.toString().split('.');
  final integerPart = parts[0];
  final decimalPart = parts.length > 1 ? parts[1] : '';

  if (decimals == 0) {
    return integerPart;
  }
  if (decimalPart.isEmpty) {
    return '$integerPart.${'0' * decimals}';
  }

  // Truncate the decimal part without rounding
  final truncatedDecimal = decimalPart.length > decimals
      ? decimalPart.substring(0, decimals)
      : decimalPart.padRight(decimals, '0');

  return '$integerPart.$truncatedDecimal';
}