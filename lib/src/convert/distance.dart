import 'dart:math';
import '../is/number.dart';
import '../util/number.dart';

/// 米 转换为 千米
num distanceToDisplay(int value) {
  final result = divideNumber(value, 1000);
  // 如果小数部分为 0，返回整数部分
  return isInteger(result) ? result.toInt() : result;
}

/// 千米 转换为 米
num distanceToBackend(num value) {
  return timesNumber(value, 1000).toInt();
}

// 定义地球半径（单位：米）
const double EARTH_RADIUS_M = 6371 * 1000;

// 将角度转换为弧度
double toRadians(double degrees) {
  return degrees * pi / 180;
}

/// 计算两个经纬度坐标之间的距离，返回距离单位是米
int calculateDistance(
  double longitude1,
  double latitude1,
  double longitude2,
  double latitude2,
) {
  // 将经纬度转换为弧度
  final double lat1 = toRadians(latitude1);
  final double lon1 = toRadians(longitude1);
  final double lat2 = toRadians(latitude2);
  final double lon2 = toRadians(longitude2);

  // 计算差值
  final double dLat = lat2 - lat1;
  final double dLon = lon2 - lon1;

  // Haversine 公式
  final double a = pow(sin(dLat / 2), 2) +
      cos(lat1) * cos(lat2) * pow(sin(dLon / 2), 2);
  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  // 计算距离并向下取整
  return (EARTH_RADIUS_M * c).toInt();
}