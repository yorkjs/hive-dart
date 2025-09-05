import 'package:intl/intl.dart';
import '../constant/date.dart';

/// 把时间戳格式化为 2020-10 格式
String formatMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat(DATE_YEAR_MONTH).format(date);
}