import 'package:hive_dart/src/constant/millisecond.dart';
import 'package:hive_dart/src/format/date.dart';

/// 把时间戳格式化为 周开始 ~ 周结束 格式
String formatWeek(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final offset = -1 * date.weekday;
  final startTimestamp = timestamp + offset * MS_DAY;
  return '${formatDateShortly(startTimestamp)} ~ ${formatDateShortly(startTimestamp + 6 * MS_DAY)}';
}