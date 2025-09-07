import 'package:hive_dart/src/constant/shelf_life.dart';
import 'package:hive_dart/src/format/area.dart';
import 'package:hive_dart/src/format/date.dart';
import 'package:hive_dart/src/format/date_time.dart';
import 'package:hive_dart/src/format/month.dart';
import 'package:hive_dart/src/format/number.dart';
import 'package:hive_dart/src/format/rate.dart';
import 'package:hive_dart/src/format/shelf_life.dart';
import 'package:hive_dart/src/format/size.dart';
import 'package:hive_dart/src/format/week.dart';
import 'package:test/test.dart';

void main() {

  group('format', () {
    test('formatArea', () {
      expect(formatArea(IArea(
        country: INode(id: 0, name: '中国'),
        province: INode(id: 0, name: '北京市'),
        city: INode(id: 0, name: '市辖区'),
        district: INode(id: 0, name: '海淀区'),
      )), '北京 海淀区');

      expect(formatArea(IArea(
        country: INode(id: 0, name: '中国'),
        province: INode(id: 0, name: '北京市'),
        city: INode(id: 0, name: '市辖区'),
        district: INode(id: 0, name: '海淀区'),
      ), simplify: false), '北京市海淀区');

      expect(formatArea(IArea(
        country: INode(id: 0, name: '中国'),
        province: INode(id: 0, name: '河南省'),
        city: INode(id: 0, name: '郑州市'),
        district: INode(id: 0, name: '管城回族区'),
      )), '河南 郑州 管城回族区');

      expect(formatArea(IArea(
        country: INode(id: 0, name: '中国'),
        province: INode(id: 0, name: '河南省'),
        city: INode(id: 0, name: '郑州市'),
        district: INode(id: 0, name: '管城回族区'),
      ), simplify: false), '河南省郑州市管城回族区');

      expect(formatArea(IArea(
        country: INode(id: 0, name: '中国香港'),
      )), '中国香港');

      expect(formatArea(IArea(
        country: INode(id: 0, name: '中国澳门'),
      )), '中国澳门');

      expect(formatArea(IArea(
        country: INode(id: 0, name: '中国台湾'),
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

    test('formatRatePercent', () {
      expect(formatRatePercent(1000), '10%');
      expect(formatRatePercent(1230), '12.3%');
      expect(formatRatePercent(1234), '12.34%');
    });

    test('formatSize', () {
      expect(formatSize(500), '500B');
      expect(formatSize(1024), '1KB');
      expect(formatSize(1536), '1.50KB');
      expect(formatSize(8.0 * 1024), '8KB');
      expect(formatSize(1048576), '1MB');
      expect(formatSize(1572864), '1.50MB');
      expect(formatSize(1073741824), '1GB');
    });

    test('formatShelfLife', () {
      expect(formatShelfLife(5), '5小时');
      expect(formatShelfLife(24), '1天');
      expect(formatShelfLife(30), '1天6小时');
      expect(formatShelfLife(SHELF_LIFE_MONTH), '1个月');
      expect(formatShelfLife(35 * SHELF_LIFE_DAY), '1个月5天');
      expect(formatShelfLife(365 * SHELF_LIFE_DAY), '1年');
      expect(formatShelfLife(SHELF_LIFE_YEAR + 6 * SHELF_LIFE_MONTH), '1年6个月');
    });
  });
}