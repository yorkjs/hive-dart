import '../is/number.dart';
import '../constant/size.dart';
import '../util/number.dart';

/// 格式化体积
String formatSize(num value) {
  if (value >= SIZE_GB) {
    final result = divideNumber(value, SIZE_GB);
    return '${truncateNumber(result, decimals: isInteger(result) ? 0 : 2)}GB';
  }
  else if (value >= SIZE_MB) {
    final result = divideNumber(value, SIZE_MB);
    return '${truncateNumber(result, decimals: isInteger(result) ? 0 : 2)}MB';
  }
  else if (value >= SIZE_KB) {
    final result = divideNumber(value, SIZE_KB);
    return '${truncateNumber(result, decimals: isInteger(result) ? 0 : 2)}KB';
  }
  return '${value}B';
}