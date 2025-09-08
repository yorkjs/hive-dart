import 'package:hive_dart/hive_dart.dart';
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

    test('isPayAuthCode', () {
      expect(isPayAuthCode('133619858964803511'), true);
      expect(isPayAuthCode('283654147086344711'), true);
      expect(isPayAuthCode('C69241878121'), false);
      expect(isPayAuthCode('C692418781212'), false);
    });

    test('isStandardBarcode', () {

      expect(isInteger(1), true);
      expect(isInteger(1.0), true);
      expect(isInteger(1.1), false);

    });

  });
}