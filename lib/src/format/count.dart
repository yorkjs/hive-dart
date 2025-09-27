import '../format/number.dart';

String formatCount(int value, { unit = '' }) {
  return formatNumberWithComma(value) + unit;
}