import 'package:decimal/decimal.dart';
import 'package:hive_dart/src/is/number.dart';

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

/// 以较短的方式返回数字
String shortNumber(num value, String Function(num) formatUnshort) {
  if (value >= 1000000000000) {
    final trillion = divideNumber(value, 1000000000000);
    return '${truncateNumber(trillion, decimals: isInteger(trillion) ? 0 : 1)}万亿';
  }
  if (value >= 100000000) {
    final billion = divideNumber(value, 100000000);
    return '${truncateNumber(billion, decimals: isInteger(billion) ? 0 : 1)}亿';
  }
  if (value >= 10000) {
    final tenThousand = divideNumber(value, 10000);
    return '${truncateNumber(tenThousand, decimals: isInteger(tenThousand) ? 0 : 1)}万';
  }
  return formatUnshort(value);
}

// 解析字符串中的整数
int? parseInteger(String value, [int? radix]) {
  /// 步骤1：去除首尾空格（和JS行为一致）
  value = value.trim();
  if (value.isEmpty) {
    return null;
  }

  // 步骤2：提取符号（+/-）和数字主体
  String sign = "";
  String numStr = value;
  if (value.startsWith('-') || value.startsWith('+')) {
    sign = value.substring(0, 1);
    numStr = value.substring(1);
    if (numStr.isEmpty) {
      return null;
    }
  }

  // 步骤3：提取有效数字前缀（直到第一个非数字字符为止）
  // 先根据最终确定的radix获取合法字符集，再过滤
  RegExp validCharRegex = RegExp(r'^[0-9a-zA-Z]+');
  Match? numMatch = validCharRegex.firstMatch(numStr);
  if (numMatch == null) {
    return null; // 无有效数字字符
  }
  String rawNumPart = numMatch.group(0)!;
  if (rawNumPart.isEmpty) {
    return null;
  }

  // 步骤4：处理radix的默认值和自动推断逻辑（严格对齐JS规则）
  int finalRadix = radix ?? 10;

  // 当radix为null/0时，自动推断进制（仅识别0x/0X前缀为16进制）
  if (radix == null || radix == 0) {
    if (rawNumPart.startsWith(RegExp(r'^0x|^0X'))) {
      finalRadix = 16;
    } else {
      finalRadix = 10; // 废弃的0开头8进制不再支持，统一按10进制
    }
  }

  // 步骤5：校验radix的合法性（2-36之间）
  if (finalRadix < 2 || finalRadix > 36) {
    return null;
  }

  // 步骤6：处理16进制前缀（0x/0X）
  String actualNumPart = rawNumPart;
  if (finalRadix == 16 && rawNumPart.startsWith(RegExp(r'^0x|^0X'))) {
    actualNumPart = rawNumPart.substring(2); // 去掉0x/0X前缀
    if (actualNumPart.isEmpty) {
      return null; // 只有0x没有数字，解析失败
    }
  }

  // 步骤7：解析数字（处理非法字符，只解析到第一个非法字符前）
  String validNumPart = "";
  // 预定义字符编码值（避免重复计算）
  int zeroCode = '0'.codeUnitAt(0);
  int nineCode = '9'.codeUnitAt(0);
  int aCode = 'a'.codeUnitAt(0);
  int zCode = 'z'.codeUnitAt(0);

  for (int i = 0; i < actualNumPart.length; i++) {
    String char = actualNumPart[i].toLowerCase();
    int charCode = char.codeUnitAt(0); // 获取字符的ASCII编码值
    int charValue;

    // 【核心修复】通过字符编码值比较，而非直接比较字符串
    if (charCode >= zeroCode && charCode <= nineCode) {
      // 0-9 转换为数字 0-9
      charValue = charCode - zeroCode;
    } else if (charCode >= aCode && charCode <= zCode) {
      // a-z 转换为数字 10-35
      charValue = 10 + (charCode - aCode);
    } else {
      break; // 非法字符，停止解析
    }

    // 字符数值超过进制范围，停止解析
    if (charValue >= finalRadix) {
      break;
    }

    validNumPart += char;
  }

  // 无有效数字部分
  if (validNumPart.isEmpty) {
    return null;
  }

  // 步骤8：解析最终的数字并加上符号
  try {
    int result = int.parse(validNumPart, radix: finalRadix);
    return sign == '-' ? -result : result;
  } catch (e) {
    return null; // 解析失败（如数值溢出）
  }
}

// 解析字符串中的浮点数
double? parseNumber(String value) {
  value = value.trim();

  final match = RegExp(r'^[+-]?\d*\.?\d+').firstMatch(value);
  if (match == null) {
    return null;
  }

  try {
    return double.parse(match.group(0)!);
  } catch (e) {
    return null;
  }
}