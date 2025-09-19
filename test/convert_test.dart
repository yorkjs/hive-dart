import 'package:hive_dart/src/constant/money.dart';
import 'package:hive_dart/src/convert/discount.dart';
import 'package:hive_dart/src/convert/money.dart';
import 'package:hive_dart/src/convert/rate.dart';
import 'package:hive_dart/src/convert/weight.dart';
import 'package:test/test.dart';

void main() {

  group('convert', () {

    test('convertMoney', () {
      expect(moneyToDisplay(100), 1);
      expect(moneyToDisplay(100, unit: MONEY_YUAN_TO_CENT), 1);
      expect(moneyToDisplay(1000000, unit: MONEY_TEN_THOUSAND_YUAN_TO_CENT), 1);
      expect(moneyToDisplay(1100000, unit: MONEY_TEN_THOUSAND_YUAN_TO_CENT), 1.1);

      expect(moneyToBackend(1.01), 101);
      expect(moneyToBackend(1.01, unit: MONEY_YUAN_TO_CENT), 101);
      expect(moneyToBackend(1.01, unit: MONEY_TEN_THOUSAND_YUAN_TO_CENT), 1010000);
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

  });
}
