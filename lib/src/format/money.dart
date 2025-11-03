import '../constant/money.dart';
import '../convert/money.dart';
import '../format/number.dart';

String formatAmount(int value, { unit = '元' }) {
  return formatNumberWithComma(moneyToDisplay(value), decimals: 2) + unit;
}

String formatPenny(int value, { unit = '元' }) {
  return formatNumberWithComma(moneyToDisplay(value, unit: MONEY_YUAN_TO_PENNY), decimals: 3) + unit;
}