import 'package:hive_dart/src/constant/date_time.dart';
import 'package:hive_dart/src/format/date_time.dart';
import 'package:hive_dart/src/util/number.dart';
import 'package:hive_dart/src/util/date.dart';
import 'package:test/test.dart';

void main() {

  group('number', () {

    test('plusNumber', () {
      expect(plusNumber(1, 2), 3);
      expect(plusNumber(1.1, 2.1), 3.2);
      expect(plusNumber(1.12, 2.13), 3.25);
      expect(plusNumber(1.121, 2.131), 3.252);
      expect(plusNumber(1.121321, 2.3312213), 3.4525423);
      expect(plusNumber(1, -2), -1);
      expect(plusNumber(-2, -3), -5);
    });


    test('minusNumber', () {
      expect(minusNumber(2, 1), 1);
      expect(minusNumber(2.1, 1.1), 1);
      expect(minusNumber(2.32, 1.04), 1.28);
      expect(minusNumber(4.978672, 2.131231), 2.847441);
      expect(minusNumber(3, -1), 4);
      expect(minusNumber(-2, -3), 1);
    });

    test('timesNumber', () {
      expect(timesNumber(2, 1), 2);
      expect(timesNumber(2, 3), 6);
      expect(timesNumber(2.1, 10), 21);
      expect(timesNumber(2.11, 10), 21.1);
      expect(timesNumber(2.111, 10), 21.11);
      expect(timesNumber(2.111, 100), 211.1);
      expect(timesNumber(2.111, 1000), 2111);
      expect(timesNumber(2.11728132706, 2), 4.23456265412);
      expect(timesNumber(2.01, 100), 201);
      expect(timesNumber(2.1, 100), 210);
      expect(timesNumber(10, 0.5), 5);
      expect(timesNumber(10, 0.2), 2);
      expect(timesNumber(3, -2), -6);
      expect(timesNumber(-2, -3), 6);
      expect(timesNumber(-2.1, -3.2), 6.72);
    });

    test('divideNumber', () {
      expect(divideNumber(4, 2), 2);
      expect(divideNumber(6, 3), 2);
      expect(divideNumber(2.2, 2), 1.1);
      expect(divideNumber(4.234, 2), 2.117);
      expect(divideNumber(4.234562, 2), 2.117281);
      expect(divideNumber(4.23456265412, 2), 2.11728132706);
      expect(divideNumber(50, 10), 5);
      expect(divideNumber(50, 100), 0.5);
      expect(divideNumber(50, 1000), 0.05);
      expect(divideNumber(10, 0.5), 20);
      expect(divideNumber(10, 0.2), 50);
      expect(divideNumber(201, 100), 2.01);
      expect(divideNumber(168, 100), 1.68);
      expect(divideNumber(5000000, 100), 50000);
      expect(divideNumber(3, -2), -1.5);
      expect(divideNumber(-6, -3), 2);
      expect(divideNumber(-4.4, -2.2), 2);
    });

    test('truncateNumber', () {
      expect(truncateNumber(1.98321), '1');
      expect(truncateNumber(1.98321, decimals: 3), '1.983');
      expect(truncateNumber(1.98321, decimals: 2), '1.98');
      expect(truncateNumber(1.98321, decimals: 1), '1.9');
      expect(truncateNumber(1.98321, decimals: 0), '1');

      expect(truncateNumber(1234567.89, decimals: 2), '1234567.89');
      expect(truncateNumber(1234567.89, decimals: 1), '1234567.8');
      expect(truncateNumber(1234567.89, decimals: 3), '1234567.890');
    });

  });

  group('date', () {

    test('date_day', () {

      var ts = DateTime.parse('2020-10-10 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2020-10-10 00:00:00');
      expect(formatDateTime(startOfPrevDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2020-10-09 00:00:00');
      expect(formatDateTime(startOfNextDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2020-10-11 00:00:00');
      expect(formatDateTime(endOfDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2020-10-10 23:59:59');

      ts = DateTime.parse('2020-04-01 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfPrevDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2020-03-31 00:00:00');
      expect(formatDateTime(startOfNextDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2020-04-02 00:00:00');

      ts = DateTime.parse('2020-01-01 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfPrevDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2019-12-31 00:00:00');
      expect(formatDateTime(startOfNextDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2020-01-02 00:00:00');

      ts = DateTime.parse('2024-03-01 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfPrevDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2024-02-29 00:00:00');
      expect(formatDateTime(startOfNextDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2024-03-02 00:00:00');

      ts = DateTime.parse('2025-03-01 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfPrevDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-02-28 00:00:00');
      expect(formatDateTime(startOfNextDay(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-03-02 00:00:00');

    });

    test('date_week', () {

      var ts = DateTime.parse('2025-07-27 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-07-27 00:00:00');
      expect(formatDateTime(startOfPrevWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-07-20 00:00:00');
      expect(formatDateTime(startOfNextWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-08-03 00:00:00');
      expect(formatDateTime(endOfWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-08-02 23:59:59');

      ts = DateTime.parse('2025-07-29 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-07-27 00:00:00');
      expect(formatDateTime(endOfWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-08-02 23:59:59');

      ts = DateTime.parse('2025-08-01 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-07-27 00:00:00');
      expect(formatDateTime(endOfWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-08-02 23:59:59');

      ts = DateTime.parse('2025-08-02 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-07-27 00:00:00');
      expect(formatDateTime(endOfWeek(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-08-02 23:59:59');

    });

    test('date_month', () {

      var ts = DateTime.parse('2025-02-10 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-02-01 00:00:00');
      expect(formatDateTime(startOfPrevMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-01-01 00:00:00');
      expect(formatDateTime(startOfNextMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-03-01 00:00:00');
      expect(formatDateTime(endOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-02-28 23:59:59');

      ts = DateTime.parse('2025-06-29 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-06-01 00:00:00');
      expect(formatDateTime(startOfPrevMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-05-01 00:00:00');
      expect(formatDateTime(startOfNextMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-07-01 00:00:00');
      expect(formatDateTime(endOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-06-30 23:59:59');

      ts = DateTime.parse('2025-07-29 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-07-01 00:00:00');
      expect(formatDateTime(startOfPrevMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-06-01 00:00:00');
      expect(formatDateTime(startOfNextMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-08-01 00:00:00');
      expect(formatDateTime(endOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-07-31 23:59:59');

      ts = DateTime.parse('2025-12-19 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-12-01 00:00:00');
      expect(formatDateTime(startOfPrevMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-11-01 00:00:00');
      expect(formatDateTime(startOfNextMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2026-01-01 00:00:00');
      expect(formatDateTime(endOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-12-31 23:59:59');

      ts = DateTime.parse('2025-04-19 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-04-01 00:00:00');
      expect(formatDateTime(startOfPrevMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-03-01 00:00:00');
      expect(formatDateTime(startOfNextMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-05-01 00:00:00');
      expect(formatDateTime(endOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-04-30 23:59:59');

      ts = DateTime.parse('2025-01-19 10:01:01').millisecondsSinceEpoch;

      expect(formatDateTime(startOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-01-01 00:00:00');
      expect(formatDateTime(startOfPrevMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2024-12-01 00:00:00');
      expect(formatDateTime(startOfNextMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-02-01 00:00:00');
      expect(formatDateTime(endOfMonth(ts), format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND), '2025-01-31 23:59:59');

    });
  });

}