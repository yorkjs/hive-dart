import '../normalize/duration.dart';

String formatDuration(int milliseconds) {
  
  final List<String> result = [];
  final data = normalizeDuration(milliseconds);
  
  if (data.days > 0) {
    result.add('${data.days}天');
  }
  if (data.hours > 0) {
    result.add('${data.hours}小时');
  }
  if (data.minutes > 0) {
    result.add('${data.minutes}分钟');
  }
  if (data.seconds > 0) {
    result.add('${data.seconds}秒');
  }

  return result.join('');
}