class IRgba {
  final int red;
  final int green;
  final int blue;
  final double alpha;

  IRgba({
    required this.red,
    required this.green,
    required this.blue,
    required this.alpha,
  });
}

/// 将 HEX 颜色转换为 RGBA 格式
///
/// [color] HEX 颜色值
/// [alpha] 透明度，取值范围 0-1
/// 返回 RGBA 颜色对象
IRgba hexToRgbaObject(String color, double alpha) {
  // 移除 # 号
  String hex = color.replaceFirst('#', '');

  // 处理简写格式 (#rgb 或 #rgba)
  if (hex.length == 3 || hex.length == 4) {
    hex = hex.split('').map((char) => char + char).join('');
  }

  // 验证hex长度
  if (hex.length != 6 && hex.length != 8) {
    throw FormatException('无效的 HEX 颜色格式');
  }

  return IRgba(
    red: int.parse(hex.substring(0, 2), radix: 16),
    green: int.parse(hex.substring(2, 4), radix: 16),
    blue: int.parse(hex.substring(4, 6), radix: 16),
    alpha: alpha.clamp(0.0, 1.0),
  );
}

/// 将 HEX 颜色转换为 RGBA 格式的字符串
///
/// [color] HEX 颜色值
/// [alpha] 透明度，取值范围 0-1
/// 返回 RGBA 颜色字符串
String hexToRgbaString(String color, double alpha) {
  final rgba = hexToRgbaObject(color, alpha);
  return 'rgba(${rgba.red},${rgba.green},${rgba.blue},${rgba.alpha})';
}
