import './number.dart';

/// 计算万分比，即 value1 / value2 得到一个万分比
///
/// [value1] 除数
/// [value2] 被除数
/// 返回万分比比例
int calculateRate(num value1, num value2) {
  if (value2 == 0) {
    return 0;
  }
  return divideNumber(timesNumber(value1, 10000), value2).toInt();
}

/// 根据万分比比例计算数值，策略是向下取整
///
/// [value] 原始数值
/// [rate] 万分比比例
/// 返回计算后的数值
int applyRateFloor(num value, int rate) {
  return divideNumber(timesNumber(value, rate), 10000).floor();
}

/// 根据万分比比例计算数值，策略是向上取整
///
/// [value] 原始数值
/// [rate] 万分比比例
/// 返回计算后的数值
int applyRateCeil(num value, int rate) {
  return divideNumber(timesNumber(value, rate), 10000).ceil();
}

/// 根据万分比比例计算数值，策略是四舍五入
///
/// [value] 原始数值
/// [rate] 万分比比例
/// 返回计算后的数值
int applyRateRound(num value, int rate) {
  return divideNumber(timesNumber(value, rate), 10000).round();
}
