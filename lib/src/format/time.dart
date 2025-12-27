String formatHourMinutes(int value) {
  final hours = value ~/ 60;
  final minutes = value % 60;

  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}

// 营业时间时段范围为 [0, 2880] 可跨天, 0-1440 为当天，1440-2880 为次日
String formatBusinessTimes(List<int> businessTimes) {
  final len = businessTimes.length;
  if (len == 0 || len % 2 != 0) {
    return '';
  }

  final timeRanges = <String>[];
  for (var i = 0; i < businessTimes.length; i += 2) {
    final start = businessTimes[i];
    final end = businessTimes[i + 1];
    final startTime = start % 1440;
    final endTime = end % 1440;

    // 判断是否是全天
    if (startTime == 0 && endTime == 0 && end > start) {
      timeRanges.add('全天');
      continue;
    }

    var startTimeStr = formatHourMinutes(startTime);
    if (start > 1440) {
      startTimeStr = '次日 $startTimeStr';
    } else {
      startTimeStr = '每日 $startTimeStr';
    }

    var endTimeStr = formatHourMinutes(endTime);
    if (end > 1440) {
      endTimeStr = '次日 $endTimeStr';
    }

    timeRanges.add('$startTimeStr-$endTimeStr');
  }

  return timeRanges.join('、');
}