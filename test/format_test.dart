import 'package:hive_dart/hive_dart.dart';
import 'package:hive_dart/src/format/bank_card.dart';
import 'package:hive_dart/src/format/count.dart';
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
        address: '测试地址',
      )), '河南 郑州 管城回族区 测试地址');

      expect(formatArea(IArea(
        country: INode(id: 0, name: '中国'),
        province: INode(id: 0, name: '河南省'),
        city: INode(id: 0, name: '郑州市'),
        district: INode(id: 0, name: '管城回族区'),
      ), simplify: false), '河南省郑州市管城回族区');

      expect(formatArea(IArea(
        country: INode(id: 0, name: '中国'),
        province: INode(id: 0, name: '河南省'),
        city: INode(id: 0, name: '郑州市'),
        district: INode(id: 0, name: '管城回族区'),
        address: '测试地址',
      ), simplify: false), '河南省郑州市管城回族区测试地址');

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

    test('formatCategory', () {
      expect(formatCategory(ICategory()), '');
      expect(formatCategory(ICategory(
        category1: INode(id: 0, name: '美食餐饮'),
      )), '美食餐饮');
      expect(formatCategory(ICategory(
        category1: INode(id: 0, name: '美食餐饮'),
        category2: INode(id: 0, name: '中餐'),
      )), '美食餐饮/中餐');
      expect(formatCategory(ICategory(
        category1: INode(id: 0, name: '美食餐饮'),
        category2: INode(id: 0, name: '中餐'),
        category3: INode(id: 0, name: '烤鸭'),
      )), '美食餐饮/中餐/烤鸭');
    });


    test('formatNumberWithComma', () {
      expect(formatNumberWithComma(-228.80, decimals: 2), '-228.80');
      expect(formatNumberWithComma(1234567.89), '1,234,567');
      expect(formatNumberWithComma(1234567.89, decimals: 0), '1,234,567');
      expect(formatNumberWithComma(1234567.89, decimals: 3), '1,234,567.890');
      expect(formatNumberWithComma(1234567.89, decimals: 5), '1,234,567.89000');
    });

    test('formatBankCardNumber', () {
      expect(formatBankCardNumber('9879764467646788'), '**** **** **** 6788');
      expect(formatBankCardNumber('98797644676467881'), '**** **** **** **** 1');
      expect(formatBankCardNumber('987976446764678812'), '**** **** **** **** 12');
      expect(formatBankCardNumber('9879764467646788123'), '**** **** **** **** 123');
      expect(formatBankCardNumber('98797644676467881234'), '**** **** **** **** 1234');
      expect(formatBankCardNumber('987976446764678812345'), '**** **** **** **** **** 5');

      expect(formatBankCardNumber('9879764467646788', masked: false), '9879 7644 6764 6788');
      expect(formatBankCardNumber('98797644676467881', masked: false), '9879 7644 6764 6788 1');
      expect(formatBankCardNumber('987976446764678812', masked: false), '9879 7644 6764 6788 12');
      expect(formatBankCardNumber('9879764467646788123', masked: false), '9879 7644 6764 6788 123');
      expect(formatBankCardNumber('98797644676467881234', masked: false), '9879 7644 6764 6788 1234');
      expect(formatBankCardNumber('987976446764678812345', masked: false), '9879 7644 6764 6788 1234 5');
    });

    test('formatDate', () {
      expect(formatDate(DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch), '2020-10-01');

      expect(formatDate(DateTime.parse('2020-11-11 00:00:00').millisecondsSinceEpoch), '2020-11-11');
      expect(formatDate(DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch), '2020-10-01');
      expect(formatDate(DateTime.parse('2020-01-10 00:00:00').millisecondsSinceEpoch), '2020-01-10');
      expect(formatDate(DateTime.parse('2020-01-01 00:00:00').millisecondsSinceEpoch), '2020-01-01');

      expect(formatDate(DateTime.parse('2020-11-11 00:00:00').millisecondsSinceEpoch, format: DATE_YEAR_MONTH_DATE_SLASH), '2020/11/11');
      expect(formatDate(DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch, format: DATE_YEAR_MONTH_DATE_SLASH), '2020/10/01');
      expect(formatDate(DateTime.parse('2020-01-10 00:00:00').millisecondsSinceEpoch, format: DATE_YEAR_MONTH_DATE_SLASH), '2020/01/10');
      expect(formatDate(DateTime.parse('2020-01-01 00:00:00').millisecondsSinceEpoch, format: DATE_YEAR_MONTH_DATE_SLASH), '2020/01/01');

      expect(formatDate(DateTime.parse('2020-11-11 00:00:00').millisecondsSinceEpoch, format: DATE_YEAR_MONTH_DATE_CHINESE), '2020年11月11日');
      expect(formatDate(DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch, format: DATE_YEAR_MONTH_DATE_CHINESE), '2020年10月1日');
      expect(formatDate(DateTime.parse('2020-01-10 00:00:00').millisecondsSinceEpoch, format: DATE_YEAR_MONTH_DATE_CHINESE), '2020年1月10日');
      expect(formatDate(DateTime.parse('2020-01-01 00:00:00').millisecondsSinceEpoch, format: DATE_YEAR_MONTH_DATE_CHINESE), '2020年1月1日');

      expect(formatDateShortly(DateTime.parse('2026-10-01 00:00:00').millisecondsSinceEpoch), '10-01');
      expect(formatDateShortly(DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch), '2020-10-01');

      expect(formatDateRange(
        DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch,
        DateTime.parse('2020-10-02 08:10:00').millisecondsSinceEpoch
      ), '2020-10-01 至 2020-10-02');

    });

    test('formatDateTime', () {

      expect(formatDateTime(DateTime.parse('2020-11-11 10:01:02').millisecondsSinceEpoch), '2020-11-11 10:01');
      expect(formatDateTime(DateTime.parse('2020-10-01 01:01:02').millisecondsSinceEpoch), '2020-10-01 01:01');
      expect(formatDateTime(DateTime.parse('2020-01-10 10:10:02').millisecondsSinceEpoch), '2020-01-10 10:10');
      expect(formatDateTime(DateTime.parse('2020-01-01 10:10:02').millisecondsSinceEpoch), '2020-01-01 10:10');

      expect(formatDateTime(DateTime.parse('2020-11-11 10:01:02').millisecondsSinceEpoch, format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SLASH), '2020/11/11 10:01');
      expect(formatDateTime(DateTime.parse('2020-10-01 01:01:02').millisecondsSinceEpoch, format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SLASH), '2020/10/01 01:01');
      expect(formatDateTime(DateTime.parse('2020-01-10 10:10:02').millisecondsSinceEpoch, format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SLASH), '2020/01/10 10:10');
      expect(formatDateTime(DateTime.parse('2020-01-01 10:10:02').millisecondsSinceEpoch, format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SLASH), '2020/01/01 10:10');

      expect(formatDateTime(DateTime.parse('2020-11-11 10:01:02').millisecondsSinceEpoch, format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_CHINESE), '2020年11月11日 10:01');
      expect(formatDateTime(DateTime.parse('2020-10-01 01:01:02').millisecondsSinceEpoch, format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_CHINESE), '2020年10月1日 01:01');
      expect(formatDateTime(DateTime.parse('2020-01-10 10:10:02').millisecondsSinceEpoch, format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_CHINESE), '2020年1月10日 10:10');
      expect(formatDateTime(DateTime.parse('2020-01-01 10:10:02').millisecondsSinceEpoch, format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_CHINESE), '2020年1月1日 10:10');


      expect(formatDateTime(DateTime.parse('2020-10-01 10:01:02').millisecondsSinceEpoch), '2020-10-01 10:01');
      expect(formatDateTimeShortly(DateTime.parse('2020-10-01 10:01:02').millisecondsSinceEpoch), '2020-10-01 10:01');
      expect(formatDateTimeShortly(DateTime.parse('2026-10-01 10:01:02').millisecondsSinceEpoch), '10-01 10:01');

      expect(formatDateTimeRange(
        DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch,
        DateTime.parse('2020-10-02 08:10:00').millisecondsSinceEpoch
      ), '2020-10-01 00:00 至 2020-10-02 08:10');
    });

    test('formatMonth', () {
      expect(formatMonth(DateTime.parse('2020-10-01 00:00:00').millisecondsSinceEpoch), '2020-10');
    });

    test('formatWeek', () {
      expect(formatWeek(DateTime.parse('2025-07-25 00:00:00').millisecondsSinceEpoch), '2025-07-20 至 2025-07-26');
      expect(formatWeek(DateTime.parse('2026-02-14 00:00:00').millisecondsSinceEpoch), '02-08 至 02-14');
    });

    test('formatAmount', () {

      expect(formatAmount(1000), '10.00元');
      expect(formatAmount(1230), '12.30元');
      expect(formatAmount(1234), '12.34元');

      expect(formatAmountShortly(100000000000000), '1万亿元');
      expect(formatAmountShortly(110000000000000), '1.1万亿元');
      expect(formatAmountShortly(111000000000000), '1.1万亿元');
      expect(formatAmountShortly(100000000000), '10亿元');
      expect(formatAmountShortly(10000000000), '1亿元');
      expect(formatAmountShortly(11000000000), '1.1亿元');
      expect(formatAmountShortly(11100000000), '1.1亿元');
      expect(formatAmountShortly(10000000), '10万元');
      expect(formatAmountShortly(1000000), '1万元');
      expect(formatAmountShortly(1100000), '1.1万元');
      expect(formatAmountShortly(1110000), '1.1万元');
      expect(formatAmountShortly(1000), '10.00元');
      expect(formatAmountShortly(1000, unit: ''), '10.00');

    });

    test('formatPenny', () {

      expect(formatPenny(80), '0.080元');
      expect(formatPenny(81), '0.081元');
      expect(formatPenny(181), '0.181元');

    });

    test('formatDiscount', () {
      expect(formatDiscount(8000), '8折');
      expect(formatDiscount(8800), '8.8折');
      expect(formatDiscount(8880), '8.8折'); // 保留一位小数
    });

    test('formatDistance', () {
      expect(formatDistance(8000), '8公里');
      expect(formatDistance(8800), '8.8公里');
      expect(formatDistance(8880), '8.88公里');
      expect(formatDistance(8888), '8.888公里');
    });

    test('formatRatePercent', () {
      expect(formatRatePercent(1000), '10%');
      expect(formatRatePercent(1230), '12.3%');
      expect(formatRatePercent(1234), '12.34%');
    });

    test('formatCount', () {

      expect(formatCount(100), '100');
      expect(formatCount(1000), '1,000');
      expect(formatCount(10000), '10,000');

      expect(formatCount(100, unit: '份'), '100份');
      expect(formatCount(1000, unit: ''), '1,000');
      expect(formatCount(10000, unit: '个'), '10,000个');

      expect(formatCountShortly(1000000000000, unit: '个'), '1万亿个');
      expect(formatCountShortly(1100000000000, unit: '个'), '1.1万亿个');
      expect(formatCountShortly(1110000000000, unit: '个'), '1.1万亿个');
      expect(formatCountShortly(1000000000, unit: '个'), '10亿个');
      expect(formatCountShortly(100000000, unit: '个'), '1亿个');
      expect(formatCountShortly(110000000, unit: '个'), '1.1亿个');
      expect(formatCountShortly(111000000, unit: '个'), '1.1亿个');
      expect(formatCountShortly(100000, unit: '个'), '10万个');
      expect(formatCountShortly(10000, unit: '个'), '1万个');
      expect(formatCountShortly(11000, unit: '个'), '1.1万个');
      expect(formatCountShortly(11100, unit: '个'), '1.1万个');
      expect(formatCountShortly(1000, unit: '个'), '1000个');
      expect(formatCountShortly(1000), '1000');

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

    test('formatDuration', () {
      expect(formatDuration(0), '');
      expect(formatDuration(MS_SECOND), '1秒');
      expect(formatDuration(MS_MINUTE), '1分钟');
      expect(formatDuration(MS_HOUR), '1小时');
      expect(formatDuration(MS_DAY), '1天');
    });

    test('formatBusinessTimes', () {
      expect(formatBusinessTimes([]), '');
      expect(formatBusinessTimes([0]), '');
      expect(formatBusinessTimes([0, 1440]), '全天');
      expect(formatBusinessTimes([0, 1440, 1440, 2880]), '全天、全天');
      expect(formatBusinessTimes([540, 960, 1200, 1560]), '09:00-16:00、20:00-次日02:00');
    });
  });
}