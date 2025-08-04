import 'package:hive_dart/src/format/date.dart';
import 'package:hive_dart/src/format/date_time.dart';
import 'package:hive_dart/src/format/month.dart';
import 'package:hive_dart/src/format/number.dart';
import 'package:hive_dart/src/format/week.dart';
import 'package:test/test.dart';

void main() {

  group('format', () {
    test('formatNumberWithComma', () {
      expect(formatNumberWithComma(1234567.89), '1,234,567');
      expect(formatNumberWithComma(1234567.89, decimals: 0), '1,234,567');
      expect(formatNumberWithComma(1234567.89, decimals: 3), '1,234,567.890');
      expect(formatNumberWithComma(1234567.89, decimals: 5), '1,234,567.89000');
    });

    test('formatDate', () {
      expect(formatDate(DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch), '2020-10-01');
      expect(formatDateShortly(DateTime.parse('2025-10-01 00:00:00').millisecondsSinceEpoch), '10-01');
      expect(formatDateShortly(DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch), '2020-10-01');
    });

    test('formatDateTime', () {
      expect(formatDateTime(DateTime.parse('2020-10-01 10:01:02').millisecondsSinceEpoch), '2020-10-01 10:01');
      expect(formatDateTimeShortly(DateTime.parse('2020-10-01 10:01:02').millisecondsSinceEpoch), '2020-10-01 10:01');
      expect(formatDateTimeShortly(DateTime.parse('2025-10-01 10:01:02').millisecondsSinceEpoch), '10-01 10:01');
    });

    test('formatMonth', () {
      expect(formatMonth(DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch), '2020-10');
    });

    test('formatWeek', () {
      expect(formatWeek(DateTime.parse('2025-07-25 00:00:00').millisecondsSinceEpoch), '07-20 ~ 07-26');
    });
  });
}