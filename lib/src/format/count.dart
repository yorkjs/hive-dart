import 'package:hive_dart/src/is/number.dart';
import 'package:hive_dart/src/util/number.dart';

import '../format/number.dart';

String formatCount(int value, { unit = '' }) {
  return formatNumberWithComma(value) + unit;
}

String formatCountShortly(int value, {String unit = ''}) {
  if (value >= 1000000000000) {
    final trillion = divideNumber(value, 1000000000000);
    return '${truncateNumber(trillion, decimals: isInteger(trillion) ? 0 : 1)}万亿$unit';
  }
  if (value >= 100000000) {
    final billion = divideNumber(value, 100000000);
    return '${truncateNumber(billion, decimals: isInteger(billion) ? 0 : 1)}亿$unit';
  }
  if (value >= 10000) {
    final tenThousand = divideNumber(value, 10000);
    return '${truncateNumber(tenThousand, decimals: isInteger(tenThousand) ? 0 : 1)}万$unit';
  }
  return '$value$unit';
}