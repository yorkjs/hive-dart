import 'package:intl/intl.dart';
import '../constant/month.dart';

/// 把时间戳格式化为 2020-10 格式
String formatMonth(int value, {String format = MONTH_DEFAULT}) {
  final date = DateTime.fromMillisecondsSinceEpoch(value);
  return DateFormat(format).format(date);
}