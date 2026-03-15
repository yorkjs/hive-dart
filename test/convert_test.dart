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

    test('convertDiscount', () {
      expect(discountToDisplay(8000), 8);
      expect(discountToDisplay(8800), 8.8);
      expect(discountToDisplay(8880), 8.8); // 保留一位小数

      expect(discountToBackend(8), 8000);
      expect(discountToBackend(8.8), 8800);
      expect(discountToBackend(8.88), 8800); // 保留一位小数
    });

    test('convertRate', () {
      expect(rateToDisplay(1015), 10.15);
      expect(rateToBackend(10.15), 1015);
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
    });
  });
}
