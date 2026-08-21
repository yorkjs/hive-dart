import '../util/string.dart';

String _formatMinuteSegment(int value) {
  final hours = value ~/ 60;
  final minutes = value % 60;

  return '${padStringStart(hours.toString(), 2)}:${padStringStart(minutes.toString(), 2)}';
}

// 分钟段范围为 [0, 2880] 可跨天, 0-1440 为当天，1440-2880 为次日
String formatMinuteSegments(List<int> value, {String separator = '、'}) {
  final len = value.length;
  if (len == 0 || len % 2 != 0) {
    return '';
  }

  final timeRanges = <String>[];
  for (var i = 0; i < len; i += 2) {
    final start = value[i];
    final end = value[i + 1];
    final startTime = start % 1440;
    final endTime = end % 1440;

    // 判断是否是全天
    if (startTime == 0 && endTime == 0 && end > start) {
      timeRanges.add('全天');
      continue;
    }

    var startTimeStr = _formatMinuteSegment(startTime);
    if (start > 1440) {
      startTimeStr = '次日$startTimeStr';
    }

    var endTimeStr = _formatMinuteSegment(endTime);
    if (end > 1440) {
      endTimeStr = '次日$endTimeStr';
    }

    timeRanges.add('$startTimeStr-$endTimeStr');
  }

  return timeRanges.join(separator);
}
