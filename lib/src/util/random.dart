import 'dart:math';

import '../convert/time.dart';
import './string.dart';

/// 生成指定长度的随机整数
///
/// [length] 数字长度
/// 返回指定长度的随机整数
int randomIntegerByLength(int length) {
  if (length <= 0) {
    return 0;
  }
  final random = Random();
  final buffer = StringBuffer();

  // 第一位不能是 0
  buffer.write(random.nextInt(9) + 1);

  // 后续位可以是 0-9
  for (int i = 1; i < length; i++) {
    buffer.write(random.nextInt(10));
  }

  return int.parse(buffer.toString());
}

/// 生成指定范围内的随机整数 [min, max)
///
/// [min] 最小值（包含）
/// [max] 最大值（不包含）
/// 返回范围内的随机整数
int randomIntegerByRange(int min, int max) {
  if (min == max) {
    return min;
  }
  final random = Random();
  return min + random.nextInt(max - min);
}

/// 生成指定长度的随机字符串
///
/// [length] 随机字符串长度
/// [chars] 随机字符集，默认为大小写字母和数字
String randomStringByLength(
  int length, {
  String chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789',
}) {
  final random = Random.secure();
  final result = List<String>.filled(length, '');
  final charLength = chars.length;

  for (int i = 0; i < length; i++) {
    result[i] = chars[random.nextInt(charLength)];
  }
  return result.join('');
}

/// 根据当前时间生成随机字符串，可通过 tailLength 控制重复的概率
///
/// [tailLength] 随机字符串尾端数字长度
/// 返回根据当前时间生成的随机字符串
String randomStringByCurrentTime(int tailLength) {
  final timeField = timeToTimeField(DateTime.now());

  final year = timeField.year;
  final month = padStringStart(timeField.month.toString(), 2);
  final date = padStringStart(timeField.date.toString(), 2);
  final hour = padStringStart(timeField.hour.toString(), 2);
  final minute = padStringStart(timeField.minute.toString(), 2);
  final second = padStringStart(timeField.second.toString(), 2);
  final millisecond = padStringStart(timeField.millisecond.toString(), 3);

  var timeStr = "$year$month$date$hour$minute$second$millisecond";
  if (tailLength > 0) {
    timeStr += randomIntegerByLength(tailLength).toString();
  }
  return timeStr;
}
