
import '../util/color.dart';

/// 是否为十六进制颜色
bool isHexColor(String value) {
  if (!value.startsWith('#')) {
    return false;
  }

  try {
    hexToRgbaObject(value);
    return true;
  } catch (_) {
    return false;
  }
}