import 'package:intl/intl.dart';

/// 时间对象转成时间戳（毫秒）
int timeToTimestamp(DateTime time) {
  return time.millisecondsSinceEpoch;
}

/// 时间戳转成时间对象
DateTime timestampToTime(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp);
}

/// 时间戳转成时间对象
DateTime? stringToTime(String str, String format) {
  try {
    final formatter = DateFormat(format);
    return formatter.parse(str);
  } catch (e) {
    return null;
  }
}
