import 'dart:math';

/// 生成指定长度的随机整数
///
/// [length] 数字长度
/// 返回指定长度的随机整数
int randomIntegerByLength(int length) {
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
