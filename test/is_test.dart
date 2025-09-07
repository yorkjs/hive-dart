import 'package:test/test.dart';
import 'package:hive_dart/src/is/barcode.dart';

void main() {

  group('is', () {

    test('isStandardBarcode', () {
      expect(isStandardBarcode('6924187812697'), true);
      expect(isStandardBarcode('C6924187812697'), false);
    });

    test('isCustomBarcode', () {
      expect(isCustomBarcode('6924187812697'), false);
      expect(isCustomBarcode('C6924187812'), true);
      expect(isCustomBarcode('C69241878121'), true);
      expect(isCustomBarcode('C692418781212'), true);
    });

    test('isPayAuthBarcode', () {
      expect(isPayAuthBarcode('133619858964803511'), true);
      expect(isPayAuthBarcode('283654147086344711'), true);
      expect(isPayAuthBarcode('C69241878121'), false);
      expect(isPayAuthBarcode('C692418781212'), false);
    });

  });
}