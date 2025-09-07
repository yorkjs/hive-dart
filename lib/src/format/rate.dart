import '../convert/rate.dart';

/// 把万分比格式化为百分比
String formatRatePercent(int value) {
  return '${rateToDisplay(value)}%';
}