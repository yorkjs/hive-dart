import 'package:intl/intl.dart';
import 'package:hive_dart/src/constant/year.dart';

/// 把时间戳格式化为 2020 格式
String formatYear(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat(YEAR_DEFAULT).format(date);
}