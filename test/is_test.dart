import 'package:hive_dart/hive_dart.dart';
import 'package:test/test.dart';

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

    test('isStandardBarcode', () {

      expect(isInteger(1), true);
      expect(isInteger(1.0), true);
      expect(isInteger(1.1), false);

    });

  });
}