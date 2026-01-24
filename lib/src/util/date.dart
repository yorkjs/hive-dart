import 'package:hive_dart/hive_dart.dart';

/// 获取某天的开始时间（毫秒时间戳）
int startOfDay(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateTime(date.year, date.month, date.day).millisecondsSinceEpoch;
}

/// 获取前一天的开始时间（毫秒时间戳）
int startOfPrevDay(int timestamp) {
  return startOfDay(timestamp - MS_DAY);
}

/// 获取后一天的开始时间（毫秒时间戳）
int startOfNextDay(int timestamp) {
  return startOfDay(timestamp + MS_DAY);
}

/// 获取某天的结束时间（毫秒时间戳）
int endOfDay(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateTime(date.year, date.month, date.day, 23, 59, 59, 999).millisecondsSinceEpoch;
}

/// 获取某周的开始时间
int startOfWeek(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final day = date.weekday == DateTime.sunday ? 0 : date.weekday; // 和 js 保持一致
  final offset = (day < 0 ? 7 : 0) + day;
  final start = date.subtract(Duration(days: offset));
  return DateTime(start.year, start.month, start.day).millisecondsSinceEpoch;
}

/// 获取前一周的开始时间（毫秒时间戳）
int startOfPrevWeek(int timestamp) {
  return startOfWeek(timestamp - MS_WEEK);
}

/// 获取后一周的开始时间（毫秒时间戳）
int startOfNextWeek(int timestamp) {
  return startOfWeek(timestamp + MS_WEEK);
}

/// 获取某周的结束时间
int endOfWeek(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final day = date.weekday == DateTime.sunday ? 0 : date.weekday; // 和 js 保持一致
  final offset = (day < 0 ? -7 : 0) + 6 - day;
  final end = date.add(Duration(days: offset));
  return DateTime(end.year, end.month, end.day, 23, 59, 59, 999).millisecondsSinceEpoch;
}

/// 获取某月的开始时间
int startOfMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateTime(date.year, date.month).millisecondsSinceEpoch;
}

/// 获取前一月的开始时间（毫秒时间戳）
int startOfPrevMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final prevMonth = date.month == DateTime.january ? DateTime.december : date.month - 1;
  final prevYear = date.month == DateTime.january ? date.year - 1 : date.year;
  return DateTime(prevYear, prevMonth).millisecondsSinceEpoch;
}

/// 获取后一月的开始时间（毫秒时间戳）
int startOfNextMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final nextMonth = date.month == DateTime.december ? DateTime.january : date.month + 1;
  final nextYear = date.month == DateTime.december ? date.year + 1 : date.year;
  return DateTime(nextYear, nextMonth).millisecondsSinceEpoch;
}

/// 获取某月的结束时间
int endOfMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final nextMonth = date.month == DateTime.december ? DateTime.january : date.month + 1;
  final nextYear = date.month == DateTime.december ? date.year + 1 : date.year;
  final firstDayOfNextMonth = DateTime(nextYear, nextMonth);
  final lastDayOfMonth = firstDayOfNextMonth.subtract(const Duration(days: 1));
  return DateTime(
          lastDayOfMonth.year, lastDayOfMonth.month, lastDayOfMonth.day,
          23, 59, 59, 999).millisecondsSinceEpoch;
}


class ITimeRangeOptimizer {
  final void Function(int day)? isDay;
  final void Function(int week)? isWeek;
  final void Function(int month)? isMonth;
  final void Function(int start, int end) isRange;

  ITimeRangeOptimizer({
    this.isDay,
    this.isWeek,
    this.isMonth,
    required this.isRange,
  });
}

/// 优化时间范围，尽量归一到某个类型下，无法归一时，才用范围
void optimizeTimeRange(
  int startTimestamp,
  int endTimestamp,
  ITimeRangeOptimizer optimizer,
) {
  final startDay = startOfDay(startTimestamp);
  final endDay = endOfDay(startTimestamp);

  final startWeek = startOfWeek(startTimestamp);
  final endWeek = endOfWeek(startTimestamp);

  final startMonth = startOfMonth(startTimestamp);
  final endMonth = endOfMonth(startTimestamp);

  if (startTimestamp == startDay && endTimestamp == endDay && optimizer.isDay != null) {
    optimizer.isDay!(startTimestamp);
  }
  else if (startTimestamp == startWeek && endTimestamp == endWeek && optimizer.isWeek != null) {
    optimizer.isWeek!(startTimestamp);
  }
  else if (startTimestamp == startMonth && endTimestamp == endMonth && optimizer.isMonth != null) {
    optimizer.isMonth!(startTimestamp);
  }
  else {
    optimizer.isRange(startTimestamp, endTimestamp);
  }
}