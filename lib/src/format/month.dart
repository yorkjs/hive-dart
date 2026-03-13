import 'package:intl/intl.dart';
import 'package:hive_dart/src/constant/month.dart';

/// 把时间戳格式化为 2020-10 格式
String formatMonth(int value) {
  final date = DateTime.fromMillisecondsSinceEpoch(value);
  return DateFormat(MONTH_DEFAULT).format(date);
}