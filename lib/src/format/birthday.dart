import 'package:intl/intl.dart';
import 'package:hive_dart/src/constant/date.dart';

/// 把时间戳格式化为 10.01 格式
String formatBirthday(int value) {
  final date = DateTime.fromMillisecondsSinceEpoch(value);
  return DateFormat(DATE_MONTH_DATE_DOT).format(date);
}