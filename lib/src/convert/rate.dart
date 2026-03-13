import '../util/number.dart';

/// 万分比 转换为 百分比
num rateToDisplay(int value) {
  final result = divideNumber(value, 100);
  // 如果小数部分为 0，返回整数部分
  return hasDecimal(result) ? result : result.toInt();
}

/// 百分比 转换为 万分比
int rateToBackend(num value) {
  return timesNumber(value, 100).toInt();
}
