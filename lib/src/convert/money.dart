
import 'package:hive_dart/src/util/number.dart';

/// 把金额转换为前端显示所用的格式
num moneyToDisplay(int value) {
  return divideNumber(value, 100);
}

/// 把金额转换为后端接口所用的格式
num moneyToBackend(num value) {
  return timesNumber(value, 100);
}