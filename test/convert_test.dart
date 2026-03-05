import 'package:hive_dart/hive_dart.dart';
import 'package:test/test.dart';

void main() {
  group('convert', () {
    test('convertMoney', () {
      expect(moneyToDisplay(100), 1);
      expect(moneyToDisplay(100, unit: MONEY_YUAN_TO_CENT), 1);
      expect(moneyToDisplay(1000000, unit: MONEY_TEN_THOUSAND_YUAN_TO_CENT), 1);
      expect(
        moneyToDisplay(1100000, unit: MONEY_TEN_THOUSAND_YUAN_TO_CENT),
        1.1,
      );

      expect(moneyToBackend(1.01), 101);
      expect(moneyToBackend(1.01, unit: MONEY_YUAN_TO_CENT), 101);
      expect(
        moneyToBackend(1.01, unit: MONEY_TEN_THOUSAND_YUAN_TO_CENT),
        1010000,
      );
    });

    test('hexToRgbaString', () {
      expect(hexToRgbaString("#F00", 0.5), "rgba(255,0,0,0.5)");
      expect(hexToRgbaString("#FF0000", 0.5), "rgba(255,0,0,0.5)");
      expect(hexToRgbaString("#0F0", 0.7), "rgba(0,255,0,0.7)");
      expect(hexToRgbaString("#00FF00", 0.7), "rgba(0,255,0,0.7)");
      expect(hexToRgbaString("#00F", 0.9), "rgba(0,0,255,0.9)");
      expect(hexToRgbaString("#0000FF", 0.9), "rgba(0,0,255,0.9)");

      expect(darkenColor("#ff0000", 0.2), "#990000");
      expect(lightenColor("#ff0000", 0.2), "#ff6666");
      expect(lightenColor("#ff000000", 0.2), "#ff666600");
      expect(lightenColor("#ff0000FF", 0.2), "#ff6666");
    });

    test('convertDiscount', () {
      expect(discountToDisplay(8000), 8);
      expect(discountToDisplay(8800), 8.8);
      expect(discountToDisplay(8880), 8.8); // 保留一位小数

      expect(discountToBackend(8), 8000);
      expect(discountToBackend(8.8), 8800);
      expect(discountToBackend(8.88), 8800); // 保留一位小数
    });

    test('convertDistance', () {
      expect(distanceToDisplay(8000), 8);
      expect(distanceToDisplay(8800), 8.8);
      expect(distanceToDisplay(8880), 8.88);
      expect(distanceToDisplay(8888), 8.888);

      expect(distanceToBackend(8), 8000);
      expect(distanceToBackend(8.8), 8800);
      expect(distanceToBackend(8.88), 8880);
      expect(distanceToBackend(8.888), 8888);

      expect(
        calculateDistance(
          116.4074, // 北京经度
          39.9042, // 北京纬度
          121.4737, // 上海经度
          31.2304, // 上海纬度
        ),
        1067310,
      );
    });

    test('convertRate', () {
      expect(rateToDisplay(1015), 10.15);
      expect(rateToBackend(10.15), 1015);
      expect(calculateRate(10, 100), 1000);
      expect(calculateRate(5, 1), 50000);
      expect(calculateRate(5, 5), 10000);
      expect(calculateRate(5, 10), 5000);
      expect(calculateRate(5, 100), 500);
      expect(calculateRate(5, 1000), 50);
      expect(calculateRate(5, 10000), 5);
    });

    test('convertWeight', () {
      expect(weightToG(1), 0.001);
      expect(weightToG(10), 0.01);
      expect(weightToG(100), 0.1);
      expect(weightToG(1000), 1);
      expect(weightToG(10000), 10);

      expect(weightToKG(1), 0.000001);
      expect(weightToKG(10), 0.00001);
      expect(weightToKG(100), 0.0001);
      expect(weightToKG(1000), 0.001);
      expect(weightToKG(10000), 0.01);
      expect(weightToKG(100000), 0.1);
      expect(weightToKG(1000000), 1);
      expect(weightToKG(10000000), 10);

      expect(weightGToBackend(0.001), 1);
      expect(weightGToBackend(0.01), 10);
      expect(weightGToBackend(0.1), 100);
      expect(weightGToBackend(1), 1000);
      expect(weightGToBackend(10), 10000);

      expect(weightKGToBackend(0.001), 1000);
      expect(weightKGToBackend(0.01), 10000);
      expect(weightKGToBackend(0.1), 100000);
      expect(weightKGToBackend(1), 1000000);
      expect(weightKGToBackend(10), 10000000);
    });

    test('convertTime', () {
      final date = DateTime.now();
      final timestamp = date.millisecondsSinceEpoch;

      final timeField = timeToTimeField(date);
      final convertedTime = timeFieldToTime(timeField);
      expect(timeToTimestamp(convertedTime), timestamp);

      expect(timeToTimestamp(date), timestamp);
      expect(timestampToTime(timestamp).millisecondsSinceEpoch, timestamp);

      // 测试无效日期
      expect(timeToTimestamp(DateTime.fromMillisecondsSinceEpoch(0)), 0);
      expect(timeToTimestamp(timestampToTime(0)), 0);

      var time = stringToTime(
        '2020-10-01 10:00:00',
        DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
      );
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-01 10:00:00',
      );

      // 日期时间（不带秒）
      time = stringToTime(
        '2020-10-01 10:00',
        DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE,
      );
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE,
        ),
        '2020-10-01 10:00',
      );

      // 纯日期
      time = stringToTime('2020-10-01', DATE_YEAR_MONTH_DATE);
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_YEAR_MONTH_DATE,
        ),
        '2020-10-01',
      );

      time = stringToTime(
        '2020.10.01 10:00:00',
        DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND_DOT,
      );
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-01 10:00:00',
      );

      // 日期时间（不带秒）
      time = stringToTime(
        '2020.10.01 10:00',
        DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_DOT,
      );
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE,
        ),
        '2020-10-01 10:00',
      );

      // 纯日期
      time = stringToTime('2020.10.01', DATE_YEAR_MONTH_DATE_DOT);
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_YEAR_MONTH_DATE,
        ),
        '2020-10-01',
      );

      time = stringToTime(
        '2020/10/01 10:00:00',
        DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND_SLASH,
      );
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-01 10:00:00',
      );

      // 日期时间（不带秒）
      time = stringToTime(
        '2020/10/01 10:00',
        DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SLASH,
      );
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE,
        ),
        '2020-10-01 10:00',
      );

      // 纯日期
      time = stringToTime('2020/10/01', DATE_YEAR_MONTH_DATE_SLASH);
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_YEAR_MONTH_DATE,
        ),
        '2020-10-01',
      );
    });
  });
}
