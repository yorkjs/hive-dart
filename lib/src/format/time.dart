import 'package:intl/intl.dart';
import '../constant/time.dart';

/// 把时间戳格式化为 12:00:00 格式
String formatTime(int timestamp, {String format = TIME_DEFAULT}) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat(format).format(date);
}