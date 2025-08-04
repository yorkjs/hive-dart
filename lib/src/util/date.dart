/// 获取某天的开始时间（毫秒时间戳）
int startOfDay(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateTime(date.year, date.month, date.day).millisecondsSinceEpoch;
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

/// 获取某月的结束时间
int endOfMonth(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final nextMonth = date.month == 12 ? 1 : date.month + 1;
  final nextYear = date.month == 12 ? date.year + 1 : date.year;
  final firstDayOfNextMonth = DateTime(nextYear, nextMonth);
  final lastDayOfMonth = firstDayOfNextMonth.subtract(const Duration(days: 1));
  return DateTime(
          lastDayOfMonth.year, lastDayOfMonth.month, lastDayOfMonth.day,
          23, 59, 59, 999).millisecondsSinceEpoch;
}