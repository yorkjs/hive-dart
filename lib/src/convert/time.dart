class ITimeField {
  int year;
  int month;
  int date;
  int hour;
  int minute;
  int second;
  int millisecond;

  ITimeField({
    required this.year,
    required this.month,
    required this.date,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
    this.millisecond = 0,
  });
}

ITimeField timeToTimeField(DateTime t) {
  return ITimeField(
    year: t.year,
    month: t.month,
    date: t.day,
    hour: t.hour,
    minute: t.minute,
    second: t.second,
    millisecond: t.millisecond,
  );
}

DateTime timeFieldToTime(ITimeField t) {
  return DateTime(
    t.year,
    t.month,
    t.date,
    t.hour,
    t.minute,
    t.second,
    t.millisecond,
  );
}

/// 时间对象转成时间戳（毫秒）
int timeToTimestamp(DateTime t) {
  return t.millisecondsSinceEpoch;
}

/// 时间戳转成时间对象
DateTime timestampToTime(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp);
}
