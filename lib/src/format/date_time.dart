import 'package:intl/intl.dart';
import '../constant/date_time.dart';

/// 把时间戳格式化为 2020-10-01 10:00 格式
String formatDateTime(int timestamp, {String format = DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE}) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat(format).format(date);
}

/// 把时间戳格式化为 2020-10-01 10:00 至 2020-10-02 10:00 格式
String formatDateTimeRange(int startTimestamp, int endTimestamp) {
  return '${formatDateTime(startTimestamp)} 至 ${formatDateTime(endTimestamp)}';
}

/// 把同年份的时间戳格式化为 10-01 10:00 格式，不同年份的时间戳格式化成 2020-10-01 10:00 格式
String formatDateTimeShortly(int timestamp) {
  final date1 = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final date2 = DateTime.now();
  if (date1.year == date2.year) {
    return DateFormat(DATE_TIME_MONTH_DATE_HOUR_MINUTE).format(date1);
  }
  return DateFormat(DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE).format(date1);
}