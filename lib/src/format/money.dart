import '../constant/money.dart';
import '../convert/money.dart';
import '../format/number.dart';
import '../util/internal.dart';
import '../util/number.dart';

String formatAmount(int value, {String unit = '元'}) {
  return formatNumberWithComma(moneyToDisplay(value), decimals: 2) + unit;
}

String formatPenny(int value, {String unit = '元'}) {
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