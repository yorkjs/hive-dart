
import 'package:hive_dart/src/constant/money.dart';
import 'package:hive_dart/src/util/number.dart';

/// 把金额转换为前端显示所用的格式
num moneyToDisplay(int value, {int unit = MONEY_YUAN_TO_CENT}) {
  return divideNumber(value, unit);
}

/// 把金额转换为后端接口所用的格式
num moneyToBackend(num value, {int unit = MONEY_YUAN_TO_CENT}) {
  return timesNumber(value, unit);
}