import '../constant/millisecond.dart';
import '../format/date.dart';

/// 把时间戳格式化为 周开始 ~ 周结束 格式
String formatWeek(int value) {
  final date = DateTime.fromMillisecondsSinceEpoch(value);
  final offset = -1 * date.weekday;
  final startTimestamp = value + offset * MS_DAY;
  return '${formatDateShortly(startTimestamp)} 至 ${formatDateShortly(startTimestamp + 6 * MS_DAY)}';
}