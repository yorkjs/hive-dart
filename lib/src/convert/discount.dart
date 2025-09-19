import '../is/number.dart';
import '../util/number.dart';

/// 万分比 转换为 折扣
num discountToDisplay(int value) {
  final result = divideNumber(value, 1000);
  // 如果小数部分为 0，返回整数部分
  // 如果有小数，保留 1 位小数
  return isInteger(result)
    ? result.toInt()
    : double.parse(truncateNumber(result, decimals: 1));
}

/// 折扣 转换为 万分比
num discountToBackend(num value) {
  return timesNumber(
    isInteger(value)
      ? value
      : double.parse(truncateNumber(value, decimals: 1)),
    1000
  );
}