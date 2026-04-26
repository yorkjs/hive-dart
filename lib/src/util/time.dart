import 'package:intl/intl.dart';
import '../constant/millisecond.dart';

/// 时间戳转成时间对象
DateTime? parseTime(String str, String format) {
  try {
    final formatter = DateFormat(format);
    return formatter.parse(str);
  } catch (e) {
    return null;
  }
}


/// 获取某个小时开始时间
int startOfHour(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateTime(
    date.year,
    date.month,
    date.day,
    date.hour,
  ).millisecondsSinceEpoch;
}

/// 获取前一个小时开始时间
int startOfPrevHour(int timestamp) {
  return startOfHour(timestamp - MS_HOUR);
}

/// 获取下个小时开始时间
int startOfNextHour(int timestamp) {
  return startOfHour(timestamp + MS_HOUR);
}

/// 获取某个小时结束时间
int endOfHour(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateTime(
    date.year,
    date.month,
    date.day,
    date.hour,
    59,
    59,
    999,
  ).millisecondsSinceEpoch;
}

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
  return DateTime(
    date.year,
    date.month,
    date.day,
    23,
    59,
    59,
    999,
  ).millisecondsSinceEpoch;
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
  return DateTime(
    end.year,
    end.month,
    end.day,
    23,
    59,
    59,
    999,
  ).millisecondsSinceEpoch;
}

/// 获取某月的开始时间
int startOfMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateTime(date.year, date.month).millisecondsSinceEpoch;
}

/// 获取前一月的开始时间（毫秒时间戳）
int startOfPrevMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final prevMonth = date.month == DateTime.january
      ? DateTime.december
      : date.month - 1;
  final prevYear = date.month == DateTime.january ? date.year - 1 : date.year;
  return DateTime(prevYear, prevMonth).millisecondsSinceEpoch;
}

/// 获取后一月的开始时间（毫秒时间戳）
int startOfNextMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final nextMonth = date.month == DateTime.december
      ? DateTime.january
      : date.month + 1;
  final nextYear = date.month == DateTime.december ? date.year + 1 : date.year;
  return DateTime(nextYear, nextMonth).millisecondsSinceEpoch;
}

/// 获取某月的结束时间
int endOfMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final nextMonth = date.month == DateTime.december
      ? DateTime.january
      : date.month + 1;
  final nextYear = date.month == DateTime.december ? date.year + 1 : date.year;
  final firstDayOfNextMonth = DateTime(nextYear, nextMonth);
  final lastDayOfMonth = firstDayOfNextMonth.subtract(const Duration(days: 1));
  return DateTime(
    lastDayOfMonth.year,
    lastDayOfMonth.month,
    lastDayOfMonth.day,
    23,
    59,
    59,
    999,
  ).millisecondsSinceEpoch;
}






/// 获取某年的开始时间
int startOfYear(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final result = DateTime(date.year, 1, 1, 0, 0, 0, 0);
  return result.millisecondsSinceEpoch;
}

/// 获取前一年的开始时间
int startOfPrevYear(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final result = DateTime(date.year - 1, 1, 1, 0, 0, 0, 0);
  return result.millisecondsSinceEpoch;
}

/// 获取下一年的开始时间
int startOfNextYear(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final result = DateTime(date.year + 1, 1, 1, 0, 0, 0, 0);
  return result.millisecondsSinceEpoch;
}

/// 获取某年的结束时间
int endOfYear(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final result = DateTime(date.year, 12, 31, 23, 59, 59, 999);
  return result.millisecondsSinceEpoch;
}

/// 获取昨天的同时刻
int sameOfPrevDay(int timestamp) {
  return timestamp - MS_DAY;
}

/// 获取前一周的同时刻
int sameOfPrevWeek(int timestamp) {
  return timestamp - MS_WEEK;
}

/// 获取上个月的同时刻
int sameOfPrevMonth(int timestampMs) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestampMs);
  final year = date.year;
  final month = date.month;
  final day = date.day;

  // 上个月第一天
  final prevMonthStart = DateTime(year, month - 1, 1, 0, 0, 0, 0);

  // 上个月最后一天（本月第 0 天）
  final prevMonthEnd = DateTime(year, month, 0, 23, 59, 59, 999);

  if (day > prevMonthEnd.day) {
    return prevMonthEnd.millisecondsSinceEpoch;
  }

  // 构建上个月同时刻
  final result = DateTime(
    prevMonthStart.year,
    prevMonthStart.month,
    day,
    date.hour,
    date.minute,
    date.second,
    date.millisecond,
  );

  return result.millisecondsSinceEpoch;
}

/// 获取去年的同时刻
int sameOfPrevYear(int timestampMs) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestampMs);
  final month = date.month;
  final day = date.day;

  // 去年同月最后一天（下个月第 0 天）
  final prevYearMonthEnd = DateTime(date.year - 1, month + 1, 0, 23, 59, 59, 999);

  if (day > prevYearMonthEnd.day) {
    return prevYearMonthEnd.millisecondsSinceEpoch;
  }

  // 构建去年同时刻
  final result = DateTime(
    date.year - 1,
    month,
    day,
    date.hour,
    date.minute,
    date.second,
    date.millisecond,
  );

  return result.millisecondsSinceEpoch;
}

class ITimeRangeOptimizer {
  final void Function(int hour)? isHour;
  final void Function(int day)? isDay;
  final void Function(int week)? isWeek;
  final void Function(int month)? isMonth;
  final void Function(int start, int end) isRange;

  ITimeRangeOptimizer({
    this.isHour,
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
  final startHour = startOfHour(startTimestamp);
  final endHour = endOfHour(startTimestamp);

  final startDay = startOfDay(startTimestamp);
  final endDay = endOfDay(startTimestamp);

  final startWeek = startOfWeek(startTimestamp);
  final endWeek = endOfWeek(startTimestamp);

  final startMonth = startOfMonth(startTimestamp);
  final endMonth = endOfMonth(startTimestamp);

  if (startTimestamp == startHour &&
      endTimestamp == endHour &&
      optimizer.isHour != null) {
    optimizer.isHour!(startTimestamp);
  } else if (startTimestamp == startDay &&
      endTimestamp == endDay &&
      optimizer.isDay != null) {
    optimizer.isDay!(startTimestamp);
  } else if (startTimestamp == startWeek &&
      endTimestamp == endWeek &&
      optimizer.isWeek != null) {
    optimizer.isWeek!(startTimestamp);
  } else if (startTimestamp == startMonth &&
      endTimestamp == endMonth &&
      optimizer.isMonth != null) {
    optimizer.isMonth!(startTimestamp);
  } else {
    optimizer.isRange(startTimestamp, endTimestamp);
  }
}
