import 'package:intl/intl.dart';
import '../constant/date.dart';

/// 把时间戳格式化为 2020-10-01 格式
String formatDate(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat(DATE_YEAR_MONTH_DATE).format(date);
}

/// 把时间戳格式化为 2020-10-01 至 2020-10-02 格式
String formatDateRange(int startTimestamp, int endTimestamp) {
  return '${formatDate(startTimestamp)} 至 ${formatDate(endTimestamp)}';
}

/// 把同年份的时间戳格式化为 10-01 格式，不同年份的时间戳格式化成 2020-10-01 格式
String formatDateShortly(int timestamp) {
  final date1 = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final date2 = DateTime.now();
  if (date1.year == date2.year) {
    return DateFormat(DATE_MONTH_DATE).format(date1);
  }
  return DateFormat(DATE_YEAR_MONTH_DATE).format(date1);
}