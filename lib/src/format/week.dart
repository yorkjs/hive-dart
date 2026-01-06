import '../constant/millisecond.dart';
import '../format/date.dart';

/// 把时间戳格式化为 周开始 ~ 周结束 格式
String formatWeek(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final offset = -1 * date.weekday;
  final startTimestamp = timestamp + offset * MS_DAY;
  return '${formatDateShortly(startTimestamp)} 至 ${formatDateShortly(startTimestamp + 6 * MS_DAY)}';
}