
import '../is/number.dart';
import '../util/number.dart';

/// 万分比 转换为 百分比
num rateToDisplay(int value) {
  final result = divideNumber(value, 100);
  // 如果小数部分为 0，返回整数部分
  return isInteger(result) ? result.toInt() : result;
}

/// 百分比 转换为 万分比
num rateToBackend(num value) {
  return timesNumber(value, 100);
}

/// 计算万分比
num calculateRate(int value1, int value2) {
  if (value2 == 0) {
    return 0;
  }
  final result = divideNumber(value1 * 10000, value2);
  // 如果小数部分为 0，返回整数部分
  return isInteger(result) ? result.toInt() : result;
}