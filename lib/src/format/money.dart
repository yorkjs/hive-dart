import 'dart:math';

import 'package:hive_dart/src/constant/money.dart';
import 'package:hive_dart/src/convert/money.dart';
import 'package:hive_dart/src/format/number.dart';
import 'package:hive_dart/src/util/number.dart';

String formatAmount(int value, { unit = '元' }) {
  return formatNumberWithComma(moneyToDisplay(value), decimals: 2) + unit;
}

String formatPenny(int value, { unit = '元' }) {
  return formatNumberWithComma(moneyToDisplay(value, unit: MONEY_YUAN_TO_PENNY), decimals: 3) + unit;
}

String formatAmountShortly(int value, {String unit = '元'}) {
  return '${
    shortNumber(
      moneyToDisplay(value),
      (num value) {
        return truncateNumber(value, decimals: 2);
      }
    )
  }$unit';
}