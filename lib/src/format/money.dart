import '../convert/money.dart';
import '../format/number.dart';

String formatAmount(int value, { unit = '元' }) {
  return formatNumberWithComma(moneyToDisplay(value), decimals: 2) + unit;
}