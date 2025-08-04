import 'package:hive_dart/src/normalize/version.dart';
import 'package:test/test.dart';

void main() {

  group('normalize', () {

    test('normalizeVersion', () {
      expect(normalizeVersion('1.0.10').compareTo(normalizeVersion('1.0.9')), 1);   // >
      expect(normalizeVersion('1.0.09').compareTo(normalizeVersion('1.0.10')), -1); // <
      expect(normalizeVersion('1.0.09').compareTo(normalizeVersion('1.0.09')), 0);  // ==

      expect(normalizeVersion('1.0.09'), '000100000009');
    });

  });
}