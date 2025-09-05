
import '../util/number.dart';

/// 毫克 转换为 克
num weightToG(int value) {
  return divideNumber(value, 1000);
}

/// 毫克 转换为 千克
num weightToKG(int value) {
  return divideNumber(value, 1000000);
}

/// 克 转为后端使用的 毫克
num weightGToBackend(num value) {
  return timesNumber(value, 1000);
}

/// 千克 转为后端使用的 毫克
num weightKGToBackend(num value) {
  return timesNumber(value, 1000000);
}