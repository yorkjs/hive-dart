import 'package:hive_dart/src/util/number.dart';

import '../format/number.dart';

String formatCount(int value, {String unit = ''}) {
  return formatNumberWithComma(value) + unit;
}

String formatCountShortly(int value, {String unit = ''}) {
  return '${
    shortNumber(
      value,
      (num value) {
        return value.toInt().toString();
      }
    )
  }$unit';
}