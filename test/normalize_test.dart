import 'package:hive_dart/src/constant/millisecond.dart';
import 'package:hive_dart/src/normalize/duration.dart';
import 'package:hive_dart/src/normalize/version.dart';
import 'package:test/test.dart';

void main() {

  group('normalize', () {

    test('normalizeDuration', () {

      var data = normalizeDuration(MS_SECOND);
      expect(data.days, 0);
      expect(data.hours, 0);
      expect(data.minutes, 0);
      expect(data.seconds, 1);

      data = normalizeDuration(MS_MINUTE);
      expect(data.days, 0);
      expect(data.hours, 0);
      expect(data.minutes, 1);
      expect(data.seconds, 0);

      data = normalizeDuration(MS_HOUR);
      expect(data.days, 0);
      expect(data.hours, 1);
      expect(data.minutes, 0);
      expect(data.seconds, 0);

      data = normalizeDuration(MS_DAY);
      expect(data.days, 1);
      expect(data.hours, 0);
      expect(data.minutes, 0);
      expect(data.seconds, 0);
      
    });

    test('normalizeVersion', () {
      expect(normalizeVersion('1.0.10').compareTo(normalizeVersion('1.0.9')), 1);   // >
      expect(normalizeVersion('1.0.09').compareTo(normalizeVersion('1.0.10')), -1); // <
      expect(normalizeVersion('1.0.09').compareTo(normalizeVersion('1.0.09')), 0);  // ==

      expect(normalizeVersion('1.0.09'), '000100000009');
    });

  });
}