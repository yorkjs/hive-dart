import '../util/number.dart';

/// 米 转换为 千米
num distanceToDisplay(int value) {
  final result = divideNumber(value, 1000);
  // 如果小数部分为 0，返回整数部分
  return hasDecimal(result) ? result : result.toInt();
}

/// 千米 转换为 米
num distanceToBackend(num value) {
  return timesNumber(value, 1000).toInt();
}
