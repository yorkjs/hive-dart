import 'dart:math';

import 'package:hive_dart/hive_dart.dart';

class IRgba {
  int red;
  int green;
  int blue;
  double alpha;

  IRgba({
    required this.red,
    required this.green,
    required this.blue,
    this.alpha = 1.0,
  });
}

class IHsl {
  double hue;
  double saturation;
  double lightness;

  IHsl({required this.hue, required this.saturation, required this.lightness});
}

/// 将 HEX 颜色转换为 RGBA 对象
///
/// [color] HEX 颜色值
/// 返回 RGBA 颜色对象
IRgba hexToRgbaObject(String color) {
  // 移除 # 号
  String hex = color.replaceAll('#', '');

  // 处理简写格式 (#rgb 或 #rgba)
  if (hex.length == 3 || hex.length == 4) {
    hex = hex.split('').map((char) => char + char).join('');
  }

  // 验证hex长度
  if (hex.length != 6 && hex.length != 8) {
    throw Exception('无效的HEX颜色格式');
  }

  final result = IRgba(
    red: int.parse(hex.substring(0, 2), radix: 16),
    green: int.parse(hex.substring(2, 4), radix: 16),
    blue: int.parse(hex.substring(4, 6), radix: 16),
    alpha: 1.0,
  );

  if (hex.length == 8) {
    result.alpha = int.parse(hex.substring(6, 8), radix: 16) / 255;
  }

  return result;
}

/// 将 HEX 颜色转换为 HSL 对象
///
/// [color] HEX 颜色值
/// 返回 HSL 颜色对象
IHsl hexToHslObject(String color) {
  return _rgbToHsl(hexToRgbaObject(color));
}

/// 将 HEX 颜色转换为 RGBA 格式
///
/// [color] HEX 颜色值
/// [alpha] 透明度，取值范围 0-1
/// 返回 RGBA 颜色字符串
String hexToRgbaString(String color, double alpha) {
  final rgba = hexToRgbaObject(color);
  return 'rgba(${rgba.red},${rgba.green},${rgba.blue},$alpha)';
}

/// 加深颜色亮度
///
/// [color] HEX 颜色值
/// [offset] 加深幅度，取值范围 0-1
/// 返回新的 hex 颜色
String darkenColor(String color, double offset) {
  return _adjustColorBrightness(color, -offset);
}

/// 减淡颜色亮度
///
/// [color] HEX 颜色值
/// [offset] 减淡幅度，取值范围 0-1
/// 返回新的 hex 颜色
String lightenColor(String color, double offset) {
  return _adjustColorBrightness(color, offset);
}

/// 调整颜色亮度
///
/// [hex] 原始颜色
/// [offset] 取值范围 0-1
/// 返回新的 hex 颜色字符串
String _adjustColorBrightness(String hex, double offset) {
  final rgba = hexToRgbaObject(hex);
  final hsl = _rgbToHsl(rgba);

  // 调整亮度，限制在 0-100 之间
  final newL = hsl.lightness + (offset * 100);
  hsl.lightness = max(0, min(100, newL));

  final newRgb = hslToRgb(hsl);

  // 如果原颜色有透明度，返回值保留该透明度
  String result =
      '#${_toHex(newRgb.red)}${_toHex(newRgb.green)}${_toHex(newRgb.blue)}';
  if (rgba.alpha < 1) {
    result += _toHex((rgba.alpha * 255).round());
  }
  return result;
}

/// 将 RGB 转换为 HSL
/// r, g, b: 0-255
/// 返回 h: 0-360, s: 0-100, l: 0-100
IHsl _rgbToHsl(IRgba rgb) {
  final r = rgb.red / 255;
  final g = rgb.green / 255;
  final b = rgb.blue / 255;

  final max1 = [r, g, b].reduce(max);
  final min1 = [r, g, b].reduce(min);
  double h = 0;
  double s = 0;
  double l = (max1 + min1) / 2;

  if (max1 != min1) {
    final d = max1 - min1;
    s = l > 0.5 ? d / (2 - max1 - min1) : d / (max1 + min1);
    if (max1 == r) {
      h = (g - b) / d + (g < b ? 6 : 0);
    } else if (max1 == g) {
      h = (b - r) / d + 2;
    } else if (max1 == b) {
      h = (r - g) / d + 4;
    }
    h *= 60;
  }

  return IHsl(hue: h, saturation: s * 100, lightness: l * 100);
}

/// 将 HSL 转换为 RGB
/// 返回 r, g, b: 0-255
IRgba hslToRgb(IHsl hsl) {
  final h = hsl.hue / 360;
  final s = hsl.saturation / 100;
  final l = hsl.lightness / 100;

  final q = l < 0.5 ? l * (1 + s) : l + s - l * s;
  final p = 2 * l - q;
  final r = _hue2rgb(p, q, h + 1 / 3);
  final g = _hue2rgb(p, q, h);
  final b = _hue2rgb(p, q, h - 1 / 3);

  return IRgba(
    red: (r * 255).round(),
    green: (g * 255).round(),
    blue: (b * 255).round(),
    alpha: 1,
  );
}

double _hue2rgb(double p, double q, double t) {
  double tt = t;
  if (tt < 0) {
    tt += 1;
  }
  if (tt > 1) {
    tt -= 1;
  }
  if (tt < 1 / 6) {
    return p + (q - p) * 6 * tt;
  }
  if (tt < 1 / 2) {
    return q;
  }
  if (tt < 2 / 3) {
    return p + (q - p) * (2 / 3 - tt) * 6;
  }
  return p;
}

String _toHex(int color) {
  return padStringStart(color.toRadixString(16), 2);
}
