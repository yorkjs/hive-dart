import '../constant/date.dart';
import 'package:intl/intl.dart';

/// 把时间戳格式化为 10.01 格式
String formatBirthday(int value, {String format = DATE_MONTH_DATE_DOT}) {
  final date = DateTime.fromMillisecondsSinceEpoch(value);
  return DateFormat(format).format(date);
}