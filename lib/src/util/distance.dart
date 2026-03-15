import 'dart:math';

// 定义地球半径（单位：米）
const double _earthRadiusM = 6371 * 1000;

// 将角度转换为弧度
double _toRadians(double degrees) {
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
  final double lat1 = _toRadians(latitude1);
  final double lon1 = _toRadians(longitude1);
  final double lat2 = _toRadians(latitude2);
  final double lon2 = _toRadians(longitude2);

  // 计算差值
  final double dLat = lat2 - lat1;
  final double dLon = lon2 - lon1;

  // Haversine 公式
  final double a = pow(sin(dLat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dLon / 2), 2);
  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  // 计算距离并向下取整
  return (_earthRadiusM * c).toInt();
}
