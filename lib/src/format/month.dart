import 'package:intl/intl.dart';
import 'package:hive_dart/src/constant/month.dart';

/// 把时间戳格式化为 2020-10 格式
String formatMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat(MONTH_DEFAULT).format(date);
}