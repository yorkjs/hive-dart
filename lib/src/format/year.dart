import 'package:intl/intl.dart';
import '../constant/year.dart';

/// 把时间戳格式化为 2020 格式
String formatYear(int timestamp, {String format = YEAR_DEFAULT}) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat(format).format(date);
}