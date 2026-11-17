import '../constant/size.dart';
import '../util/number.dart';

/// 字节 转换为 KB
///
/// [value] 后端的 size 值，单位字节
num sizeToKB(int value) {
  return divideNumber(value, SIZE_KB);
}

/// 字节 转换为 MB
///
/// [value] 后端的 size 值，单位字节
num sizeToMB(int value) {
  return divideNumber(value, SIZE_MB);
}

/// 字节 转换为 GB
///
/// [value] 后端的 size 值，单位字节
num sizeToGB(int value) {
  return divideNumber(value, SIZE_GB);
}

/// KB 转为后端使用的 字节
///
/// [value] 前端的 size 值，单位是 KB
int sizeKBToBackend(num value) {
  return timesNumber(value, SIZE_KB).floor();
}

/// MB 转为后端使用的 字节
///
/// [value] 前端的 size 值，单位是 MB
int sizeMBToBackend(num value) {
  return timesNumber(value, SIZE_MB).floor();
}

/// GB 转为后端使用的 字节
///
/// [value] 前端的 size 值，单位是 GB
int sizeGBToBackend(num value) {
  return timesNumber(value, SIZE_GB).floor();
}