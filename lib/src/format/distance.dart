import '../convert/distance.dart';

/// 把距离格式化为千米单位
String formatDistance(int value) {
  return '${distanceToDisplay(value)}公里';
}