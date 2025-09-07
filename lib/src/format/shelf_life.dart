import '../constant/shelf_life.dart';

String formatShelfLife(int value) {
  if (value <= 0) {
    return '';
  }

  var result = '';

  final year = value ~/ SHELF_LIFE_YEAR;
  if (year > 0) {
    result += '$year年';
    value -= SHELF_LIFE_YEAR * year;
  }

  final month = value ~/ SHELF_LIFE_MONTH;
  if (month > 0) {
    result += '$month个月';
    value -= SHELF_LIFE_MONTH * month;
  }

  final day = value ~/ SHELF_LIFE_DAY;
  if (day > 0) {
    result += '$day天';
    value -= SHELF_LIFE_DAY * day;
  }

  if (value > 0) {
    result += '$value小时';
  }

  return result;
}