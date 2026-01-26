import 'package:hive_dart/src/constant/millisecond.dart';
import 'package:hive_dart/src/normalize/duration.dart';
import 'package:hive_dart/src/normalize/shelf_life.dart';
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

      data = normalizeDuration(MS_DAY + 2 * MS_HOUR + 3 * MS_MINUTE + 4 * MS_SECOND);
      expect(data.days, 1);
      expect(data.hours, 2);
      expect(data.minutes, 3);
      expect(data.seconds, 4);

    });

    test('normalizeShelfLife', () {

      var data = normalizeShelfLife(10);
      expect(data.years, 0);
      expect(data.months, 0);
      expect(data.days, 0);
      expect(data.hours, 10);

      data = normalizeShelfLife(24);
      expect(data.years, 0);
      expect(data.months, 0);
      expect(data.days, 1);
      expect(data.hours, 0);

      data = normalizeShelfLife(24 * 30);
      expect(data.years, 0);
      expect(data.months, 1);
      expect(data.days, 0);
      expect(data.hours, 0);

      data = normalizeShelfLife(24 * 365);
      expect(data.years, 1);
      expect(data.months, 0);
      expect(data.days, 0);

      data = normalizeShelfLife(24 * 365 + 24 * 31 + 1);
      expect(data.years, 1);
      expect(data.months, 1);
      expect(data.days, 1);
      expect(data.hours, 1);

    });

    test('normalizeVersion', () {
      expect(normalizeVersion('1.0.10').compareTo(normalizeVersion('1.0.9')), 1);   // >
      expect(normalizeVersion('1.0.09').compareTo(normalizeVersion('1.0.10')), -1); // <
      expect(normalizeVersion('1.0.09').compareTo(normalizeVersion('1.0.09')), 0);  // ==

      expect(normalizeVersion('1.0.09'), '000100000009');
    });

  });
}