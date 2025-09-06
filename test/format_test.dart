import 'package:hive_dart/src/format/area.dart';
import 'package:hive_dart/src/format/date.dart';
import 'package:hive_dart/src/format/date_time.dart';
import 'package:hive_dart/src/format/month.dart';
import 'package:hive_dart/src/format/number.dart';
import 'package:hive_dart/src/format/week.dart';
import 'package:test/test.dart';

void main() {

  group('format', () {
    test('formatArea', () {
      expect(formatArea(AreaModel(
        country: NodeModel(id: 0, name: '中国'),
        province: NodeModel(id: 0, name: '北京市'),
        city: NodeModel(id: 0, name: '市辖区'),
        district: NodeModel(id: 0, name: '海淀区'),
      )), '北京 海淀区');

      expect(formatArea(AreaModel(
        country: NodeModel(id: 0, name: '中国'),
        province: NodeModel(id: 0, name: '北京市'),
        city: NodeModel(id: 0, name: '市辖区'),
        district: NodeModel(id: 0, name: '海淀区'),
      ), simplify: false), '北京市海淀区');

      expect(formatArea(AreaModel(
        country: NodeModel(id: 0, name: '中国'),
        province: NodeModel(id: 0, name: '河南省'),
        city: NodeModel(id: 0, name: '郑州市'),
        district: NodeModel(id: 0, name: '管城回族区'),
      )), '河南 郑州 管城回族区');

      expect(formatArea(AreaModel(
        country: NodeModel(id: 0, name: '中国'),
        province: NodeModel(id: 0, name: '河南省'),
        city: NodeModel(id: 0, name: '郑州市'),
        district: NodeModel(id: 0, name: '管城回族区'),
      ), simplify: false), '河南省郑州市管城回族区');

      expect(formatArea(AreaModel(
        country: NodeModel(id: 0, name: '中国香港'),
      )), '中国香港');

      expect(formatArea(AreaModel(
        country: NodeModel(id: 0, name: '中国澳门'),
      )), '中国澳门');

      expect(formatArea(AreaModel(
        country: NodeModel(id: 0, name: '中国台湾'),
      )), '中国台湾');
    });
    test('formatNumberWithComma', () {
      expect(formatNumberWithComma(-228.80, decimals: 2), '-228.80');
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