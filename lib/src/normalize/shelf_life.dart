import 'package:hive_dart/src/constant/shelf_life.dart';

class IShelfLife {
  int years;
  int months;
  int days;
  int hours;

  IShelfLife({
    required this.years,
    required this.months,
    required this.days,
    required this.hours,
  });
}


IShelfLife normalizeShelfLife(int value) {
  var result = IShelfLife(
    years: 0,
    months: 0,
    days: 0,
    hours: 0,
  );

  if (value <= 0) {
    return result;
  }

  var remainingValue = value;

  final years = remainingValue ~/ SHELF_LIFE_YEAR;
  if (years > 0) {
    result.years = years;
    remainingValue -= SHELF_LIFE_YEAR * years;
  }

  final months = remainingValue ~/ SHELF_LIFE_MONTH;
  if (months > 0) {
    result.months = months;
    remainingValue -= SHELF_LIFE_MONTH * months;
  }

  final days = remainingValue ~/ SHELF_LIFE_DAY;
  if (days > 0) {
    result.days = days;
    remainingValue -= SHELF_LIFE_DAY * days;
  }

  if (remainingValue > 0) {
    result.hours = remainingValue;
  }

  return result;
}