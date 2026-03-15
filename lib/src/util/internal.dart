import './number.dart';

// 此文件的函数仅在内部使用，不对外暴露

/// 以较短的方式返回数字
String shortNumber(num value, String Function(num) formatUnshort) {
  if (value >= 1000000000000) {
    final trillion = divideNumber(value, 1000000000000);
    return '${truncateNumber(trillion, decimals: hasDecimal(trillion) ? 1 : 0)}万亿';
  }
  if (value >= 100000000) {
    final billion = divideNumber(value, 100000000);
    return '${truncateNumber(billion, decimals: hasDecimal(billion) ? 1 : 0)}亿';
  }
  if (value >= 10000) {
    final tenThousand = divideNumber(value, 10000);
    return '${truncateNumber(tenThousand, decimals: hasDecimal(tenThousand) ? 1 : 0)}万';
  }
  return formatUnshort(value);
}