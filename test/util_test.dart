import 'dart:math';

import 'package:hive_dart/hive_dart.dart';
import 'package:test/test.dart';

void main() {
  group('color', () {
    test('hexToRgbaString', () {
      expect(hexToRgbaString("#F00", 0.5), "rgba(255,0,0,0.5)");
      expect(hexToRgbaString("#FF0000", 0.5), "rgba(255,0,0,0.5)");
      expect(hexToRgbaString("#f00", 0.5), "rgba(255,0,0,0.5)");
      expect(hexToRgbaString("#ff0000", 0.5), "rgba(255,0,0,0.5)");

      expect(hexToRgbaString("#0F0", 0.7), "rgba(0,255,0,0.7)");
      expect(hexToRgbaString("#00FF00", 0.7), "rgba(0,255,0,0.7)");
      expect(hexToRgbaString("#00F", 0.9), "rgba(0,0,255,0.9)");
      expect(hexToRgbaString("#0000FF", 0.9), "rgba(0,0,255,0.9)");

      expect(darkenColor("#ff0000", 0.2), "#990000");
      expect(lightenColor("#ff0000", 0.2), "#FF6666");
      expect(lightenColor("#ff000000", 0.2), "#FF666600");
      expect(lightenColor("#ff0000FF", 0.2), "#FF6666");
    });
  });

  group('distance', () {
    test('calculateDistance', () {
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
  });

  group('number', () {
    test('plusNumber', () {
      expect(plusNumber(1, 2), 3);
      expect(plusNumber(1.1, 2.1), 3.2);
      expect(plusNumber(1.12, 2.13), 3.25);
      expect(plusNumber(1.121, 2.131), 3.252);
      expect(plusNumber(1.121321, 2.3312213), 3.4525423);
      expect(plusNumber(1, -2), -1);
      expect(plusNumber(-2, -3), -5);
    });

    test('minusNumber', () {
      expect(minusNumber(2, 1), 1);
      expect(minusNumber(2.1, 1.1), 1);
      expect(minusNumber(2.32, 1.04), 1.28);
      expect(minusNumber(4.978672, 2.131231), 2.847441);
      expect(minusNumber(3, -1), 4);
      expect(minusNumber(-2, -3), 1);
    });

    test('timesNumber', () {
      expect(timesNumber(2, 1), 2);
      expect(timesNumber(2, 3), 6);
      expect(timesNumber(2.1, 10), 21);
      expect(timesNumber(2.11, 10), 21.1);
      expect(timesNumber(2.111, 10), 21.11);
      expect(timesNumber(2.111, 100), 211.1);
      expect(timesNumber(2.111, 1000), 2111);
      expect(timesNumber(2.11728132706, 2), 4.23456265412);
      expect(timesNumber(2.01, 100), 201);
      expect(timesNumber(2.1, 100), 210);
      expect(timesNumber(10, 0.5), 5);
      expect(timesNumber(10, 0.2), 2);
      expect(timesNumber(3, -2), -6);
      expect(timesNumber(-2, -3), 6);
      expect(timesNumber(-2.1, -3.2), 6.72);
    });

    test('divideNumber', () {
      expect(divideNumber(4, 2), 2);
      expect(divideNumber(6, 3), 2);
      expect(divideNumber(2.2, 2), 1.1);
      expect(divideNumber(4.234, 2), 2.117);
      expect(divideNumber(4.234562, 2), 2.117281);
      expect(divideNumber(4.23456265412, 2), 2.11728132706);
      expect(divideNumber(50, 10), 5);
      expect(divideNumber(50, 100), 0.5);
      expect(divideNumber(50, 1000), 0.05);
      expect(divideNumber(10, 0.5), 20);
      expect(divideNumber(10, 0.2), 50);
      expect(divideNumber(201, 100), 2.01);
      expect(divideNumber(168, 100), 1.68);
      expect(divideNumber(5000000, 100), 50000);
      expect(divideNumber(3, -2), -1.5);
      expect(divideNumber(-6, -3), 2);
      expect(divideNumber(-4.4, -2.2), 2);
    });

    test('truncateNumber', () {
      expect(truncateNumber(1), '1');
      expect(truncateNumber(1.98321), '1');
      expect(truncateNumber(1.98321, decimals: 3), '1.983');
      expect(truncateNumber(1.98321, decimals: 2), '1.98');
      expect(truncateNumber(1.98321, decimals: 1), '1.9');
      expect(truncateNumber(1.98321, decimals: 0), '1');

      expect(truncateNumber(1234567.89, decimals: 2), '1234567.89');
      expect(truncateNumber(1234567.89, decimals: 1), '1234567.8');
      expect(truncateNumber(1234567.89, decimals: 3), '1234567.890');
    });

    test('parseInteger', () {

      expect(parseInteger(' 123'), 123);
      expect(parseInteger('123 '), 123);
      expect(parseInteger(' 123 '), 123);
      expect(parseInteger('123'), 123);
      expect(parseInteger('-123'), -123);
      expect(parseInteger('+123'), 123);
      expect(parseInteger('123px'), 123);
      expect(parseInteger('px123'), null);
      expect(parseInteger('123.456'), 123);
      expect(parseInteger('123.456px'), 123);

      expect(parseInteger('101'), 101);
      expect(parseInteger('101', 2), 5);
      expect(parseInteger('101a'), 101);
      expect(parseInteger('101a', 2), 5);

      expect(parseInteger('0XFF'), 255);
      expect(parseInteger('0XFF', 16), 255);
      expect(parseInteger('0xFF'), 255);
      expect(parseInteger('0xFF', 16), 255);

    });

    test('parseNumber', () {

      expect(parseNumber(' 123'), 123);
      expect(parseNumber('123 '), 123);
      expect(parseNumber(' 123 '), 123);
      expect(parseNumber('123'), 123);
      expect(parseNumber('-123'), -123);
      expect(parseNumber('+123'), 123);
      expect(parseNumber('123px'), 123);
      expect(parseNumber('px123'), null);
      expect(parseNumber('123.456'), 123.456);
      expect(parseNumber('123.456px'), 123.456);

      expect(parseNumber('0xFF'), 0);
      expect(parseNumber('0XFF'), 0);

    });

    test('hasDecimal', () {
      expect(hasDecimal(1), false);
      expect(hasDecimal(1.0), false);
      expect(hasDecimal(1.1), true);
    });
  });

  group('random', () {
    test('randomStringByLength', () {
      for (var i = 5; i < 100; i++) {
        expect(randomStringByLength(i).length, i);
        expect(randomStringByLength(i) != randomStringByLength(i), true);
      }
    });
    test('randomIntegerByLength', () {
      for (var i = 2; i < 15; i++) {
        expect(randomIntegerByLength(i).toString().length, i);
        expect(randomIntegerByLength(i) != randomIntegerByLength(i), true);
      }
    });
    test('randomIntegerByRange', () {
      for (int i = 2; i < 10; i++) {
        // 计算最小值和最大值
        final min = pow(10, i - 1).toInt();
        final max = pow(10, i).toInt() - 1;

        // 生成随机数
        final random = randomIntegerByRange(min, max);

        expect(random >= min, true);
        expect(random < max, true);
      }
    });
    test('randomStringByCurrentTime', () {
      expect(randomStringByCurrentTime(-1).length, 17);
      expect(randomStringByCurrentTime(0).length, 17);
      expect(randomStringByCurrentTime(3).length, 20);
      expect(RegExp(r'^\d+$').hasMatch(randomStringByCurrentTime(3)), true);
      final currentYear = DateTime.now().year.toString();
      expect(randomStringByCurrentTime(3).startsWith(currentYear), true);
    });
  });

  group('rate', () {
    test('calculateRate', () {
      expect(calculateRate(10, 100), 1000);
      expect(calculateRate(5, 1), 50000);
      expect(calculateRate(5, 5), 10000);
      expect(calculateRate(5, 10), 5000);
      expect(calculateRate(5, 100), 500);
      expect(calculateRate(5, 1000), 50);
      expect(calculateRate(5, 10000), 5);
    });
    test('applyRateFloor', () {
      expect(applyRateFloor(1000, 0), 0);
      expect(applyRateFloor(1000, 1000), 100);
      expect(applyRateFloor(1000, 10000), 1000);
      expect(applyRateFloor(1000, 245), 24);
    });
    test('applyRateCeil', () {
      expect(applyRateCeil(1000, 0), 0);
      expect(applyRateCeil(1000, 1000), 100);
      expect(applyRateCeil(1000, 10000), 1000);
      expect(applyRateCeil(1000, 245), 25);
    });
    test('applyRateRound', () {
      expect(applyRateRound(1000, 0), 0);
      expect(applyRateRound(1000, 1000), 100);
      expect(applyRateRound(1000, 10000), 1000);
      expect(applyRateRound(1000, 245), 25);
      expect(applyRateRound(1000, 244), 24);
    });
  });

  group('string', () {
    test('getStringLength', () {
      expect(getStringLength("1234"), equals(4));
      expect(getStringLength("1234你"), equals(5));
      expect(getStringLength("1234你好"), equals(6));
    });
    test('getStringWidth', () {
      expect(getStringWidth("12"), 2);
      expect(getStringWidth("12A"), 3);
      expect(getStringWidth("12Aa"), 4);
      expect(getStringWidth("12Aa啊"), 6);
      expect(getStringWidth("12Aa啊_"), 7);
      expect(getStringWidth("12Aa啊_，"), 9);
      expect(getStringWidth("12Aa啊_，。"), 11);
    });
    test('trimString', () {
      expect(trimString("\t1234"), equals('1234'));
      expect(trimString(" 1234"), equals('1234'));
      expect(trimString("\t 1234"), equals('1234'));

      expect(trimString("1234\t"), equals('1234'));
      expect(trimString("1234 "), equals('1234'));
      expect(trimString("1234\t "), equals('1234'));

      expect(trimString("\t1234\t "), equals('1234'));
      expect(trimString("\t1234\n    "), equals('1234'));
      expect(trimString("\n    1234\n    "), equals('1234'));
    });
    test('sliceString', () {
      expect(sliceString("12345678", 4, 6), equals('56'));
      expect(sliceString("1234你好", 3, 5), equals('4你'));
      expect(sliceString("1234你好5", 5, 7), equals('好5'));
      expect(sliceString("1234你好", 4, 6), equals('你好'));
    });
    test('truncateString', () {
      expect(truncateString("123456789", 5), '12...');
      expect(truncateString("ABCDEFGHI", 5), 'AB...');
      expect(truncateString("ABC你好呀", 5), 'AB...');
      expect(truncateString("你好呀ABC", 5), '你好...');
      expect(truncateString("你是谁你在干什么你想吃什么", 9), '你是谁你在干...');
      expect(truncateString("你是谁你在干ABC想吃什么", 9), '你是谁你在干...');
    });
    test('renderStringTemplate', () {
      expect(
        renderStringTemplate('你好，\${name}', {'name': '张三'}),
        equals('你好，张三'),
      );
      expect(
        renderStringTemplate('你好，\${name1}，\${name2}', {
          'name1': '张三',
          'name2': '李四',
        }),
        equals('你好，张三，李四'),
      );
      expect(
        renderStringTemplate('你好，\${name1}，\${name3}。', {'name1': '张三'}),
        equals('你好，张三，\${name3}。'),
      );
      expect(
        renderStringTemplate('你好，\${value}。', {'value': 10}),
        equals('你好，10。'),
      );
      expect(
        renderStringTemplate('你好，\${value}。', {'value': 10.11}),
        equals('你好，10.11。'),
      );
      expect(
        renderStringTemplate('你好，\${value}。', {'value': true}),
        equals('你好，true。'),
      );
      expect(
        renderStringTemplate('你好，\${value}。', {'value': false}),
        equals('你好，false。'),
      );
      expect(
        renderStringTemplate('你好，\${value}。', {'value': null}),
        equals('你好，\${value}。'),
      );
      expect(
        renderStringTemplate('值：\${int}，\${double}，\${negative}', {
          'int': 42,
          'double': 3.14159,
          'negative': -100,
        }),
        equals('值：42，3.14159，-100'),
      );
    });
    test('padStringStart', () {
      expect(padStringStart('1', 3), '001');
      expect(padStringStart('12', 3), '012');
      expect(padStringStart('123', 3), '123');
    });
    test('hasSpecialCharacter', () {
      expect(hasSpecialCharacter('abc,[1]23. 你好，【世界】！'), false);
      expect(hasSpecialCharacter('abc,123. \t\n'), true);
      expect(hasSpecialCharacter('abc,123.☺️'), true);
      expect(hasSpecialCharacter(' abc,  123. '), false);
    });

    test('removeSpecialCharacter', () {
      expect(
        removeSpecialCharacter('abc,[1]23. 你好，【世界】！'),
        'abc,[1]23. 你好，【世界】！',
      );
      expect(removeSpecialCharacter('abc,123.\t\n'), 'abc,123.');
      expect(removeSpecialCharacter('a☺️bc,☺️123.^456☺️%'), 'abc,123.456%');
      expect(removeSpecialCharacter('a☺️bc，123。☺️'), 'abc，123。');
      expect(removeSpecialCharacter(' abc,  123. '), ' abc,  123. ');
    });
  });

  group('time', () {
    test('parse', () {

      var time = parseTime(
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
      time = parseTime(
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
      time = parseTime('2020-10-01', DATE_YEAR_MONTH_DATE);
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_YEAR_MONTH_DATE,
        ),
        '2020-10-01',
      );

      time = parseTime(
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
      time = parseTime(
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
      time = parseTime('2020.10.01', DATE_YEAR_MONTH_DATE_DOT);
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_YEAR_MONTH_DATE,
        ),
        '2020-10-01',
      );

      time = parseTime(
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
      time = parseTime(
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
      time = parseTime('2020/10/01', DATE_YEAR_MONTH_DATE_SLASH);
      expect(
        formatDateTime(
          time!.millisecondsSinceEpoch,
          format: DATE_YEAR_MONTH_DATE,
        ),
        '2020-10-01',
      );
    });
    test('hour', () {
      var ts = DateTime.parse('2020-10-10 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfHour(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-10 10:00:00',
      );
      expect(
        formatDateTime(
          startOfPrevHour(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-10 09:00:00',
      );
      expect(
        formatDateTime(
          startOfNextHour(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-10 11:00:00',
      );
      expect(
        formatDateTime(
          endOfHour(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-10 10:59:59',
      );
    });
    test('day', () {
      var ts = DateTime.parse('2020-10-10 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-10 00:00:00',
      );
      expect(
        formatDateTime(
          startOfPrevDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-09 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-11 00:00:00',
      );
      expect(
        formatDateTime(
          endOfDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-10-10 23:59:59',
      );

      ts = DateTime.parse('2020-04-01 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfPrevDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-03-31 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-04-02 00:00:00',
      );

      ts = DateTime.parse('2020-01-01 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfPrevDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2019-12-31 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2020-01-02 00:00:00',
      );

      ts = DateTime.parse('2024-03-01 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfPrevDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2024-02-29 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2024-03-02 00:00:00',
      );

      ts = DateTime.parse('2025-03-01 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfPrevDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-02-28 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextDay(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-03-02 00:00:00',
      );
    });

    test('week', () {
      var ts = DateTime.parse('2025-07-27 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-07-27 00:00:00',
      );
      expect(
        formatDateTime(
          startOfPrevWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-07-20 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-08-03 00:00:00',
      );
      expect(
        formatDateTime(
          endOfWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-08-02 23:59:59',
      );

      ts = DateTime.parse('2025-07-29 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-07-27 00:00:00',
      );
      expect(
        formatDateTime(
          endOfWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-08-02 23:59:59',
      );

      ts = DateTime.parse('2025-08-01 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-07-27 00:00:00',
      );
      expect(
        formatDateTime(
          endOfWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-08-02 23:59:59',
      );

      ts = DateTime.parse('2025-08-02 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-07-27 00:00:00',
      );
      expect(
        formatDateTime(
          endOfWeek(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-08-02 23:59:59',
      );
    });

    test('month', () {
      var ts = DateTime.parse('2025-02-10 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-02-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfPrevMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-01-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-03-01 00:00:00',
      );
      expect(
        formatDateTime(
          endOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-02-28 23:59:59',
      );

      ts = DateTime.parse('2025-06-29 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-06-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfPrevMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-05-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-07-01 00:00:00',
      );
      expect(
        formatDateTime(
          endOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-06-30 23:59:59',
      );

      ts = DateTime.parse('2025-07-29 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-07-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfPrevMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-06-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-08-01 00:00:00',
      );
      expect(
        formatDateTime(
          endOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-07-31 23:59:59',
      );

      ts = DateTime.parse('2025-12-19 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-12-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfPrevMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-11-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2026-01-01 00:00:00',
      );
      expect(
        formatDateTime(
          endOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-12-31 23:59:59',
      );

      ts = DateTime.parse('2025-04-19 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-04-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfPrevMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-03-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-05-01 00:00:00',
      );
      expect(
        formatDateTime(
          endOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-04-30 23:59:59',
      );

      ts = DateTime.parse('2025-01-19 10:01:01').millisecondsSinceEpoch;

      expect(
        formatDateTime(
          startOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-01-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfPrevMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2024-12-01 00:00:00',
      );
      expect(
        formatDateTime(
          startOfNextMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-02-01 00:00:00',
      );
      expect(
        formatDateTime(
          endOfMonth(ts),
          format: DATE_TIME_YEAR_MONTH_DATE_HOUR_MINUTE_SECOND,
        ),
        '2025-01-31 23:59:59',
      );
    });

    test('time_range_optimize', () {
      // isHour
      var date = DateTime.utc(2025, 2, 10, 10, 1, 1);
      var startTime = startOfHour(date.millisecondsSinceEpoch);
      var endTime = endOfHour(date.millisecondsSinceEpoch);
      var isHour = false;
      var isDay = false;
      var isWeek = false;
      var isMonth = false;
      var isRange = false;

      optimizeTimeRange(
        startTime,
        endTime,
        ITimeRangeOptimizer(
          isHour: (hour) {
            isHour = true;
            expect(hour, startTime);
          },
          isDay: (day) {
            isDay = true;
          },
          isWeek: (week) {
            isWeek = true;
          },
          isMonth: (month) {
            isMonth = true;
          },
          isRange: (start, end) {
            isRange = true;
          },
        ),
      );

      expect(isHour, true);
      expect(isDay, false);
      expect(isWeek, false);
      expect(isMonth, false);
      expect(isRange, false);

      // isHour 但是不传 isHour 函数

      startTime = startOfHour(date.millisecondsSinceEpoch);
      endTime = endOfHour(date.millisecondsSinceEpoch);
      isHour = false;
      isDay = false;
      isWeek = false;
      isMonth = false;
      isRange = false;

      optimizeTimeRange(
        startTime,
        endTime,
        ITimeRangeOptimizer(
          isDay: (day) {
            isDay = true;
          },
          isWeek: (week) {
            isWeek = true;
          },
          isMonth: (month) {
            isMonth = true;
          },
          isRange: (start, end) {
            isRange = true;
            expect(start, startTime);
            expect(end, endTime);
          },
        ),
      );

      expect(isHour, false);
      expect(isDay, false);
      expect(isWeek, false);
      expect(isMonth, false);
      expect(isRange, true);

      // isDay 但是不传 isDay 函数

      startTime = startOfDay(date.millisecondsSinceEpoch);
      endTime = endOfDay(date.millisecondsSinceEpoch);
      isHour = false;
      isDay = false;
      isWeek = false;
      isMonth = false;
      isRange = false;

      optimizeTimeRange(
        startTime,
        endTime,
        ITimeRangeOptimizer(
          isHour: (hour) {
            isHour = true;
          },
          isDay: (day) {
            isDay = true;
            expect(day, startTime);
          },
          isWeek: (week) {
            isWeek = true;
          },
          isMonth: (month) {
            isMonth = true;
          },
          isRange: (start, end) {
            isRange = true;
          },
        ),
      );

      expect(isHour, false);
      expect(isDay, true);
      expect(isWeek, false);
      expect(isMonth, false);
      expect(isRange, false);

      // isDay 但是不传 isDay 函数
      startTime = startOfDay(date.millisecondsSinceEpoch);
      endTime = endOfDay(date.millisecondsSinceEpoch);
      isDay = false;
      isWeek = false;
      isMonth = false;
      isRange = false;

      optimizeTimeRange(
        startTime,
        endTime,
        ITimeRangeOptimizer(
          isWeek: (week) {
            isWeek = true;
          },
          isMonth: (month) {
            isMonth = true;
          },
          isRange: (start, end) {
            isRange = true;
            expect(start, startTime);
            expect(end, endTime);
          },
        ),
      );

      expect(isDay, false);
      expect(isWeek, false);
      expect(isMonth, false);
      expect(isRange, true);

      // 截取日期中间的一段时间
      startTime = DateTime.utc(2025, 10, 10, 10, 0, 0).millisecondsSinceEpoch;
      endTime = DateTime.utc(2025, 10, 10, 12, 0, 0).millisecondsSinceEpoch;
      isHour = false;
      isDay = false;
      isWeek = false;
      isMonth = false;
      isRange = false;

      optimizeTimeRange(
        startTime,
        endTime,
        ITimeRangeOptimizer(
          isDay: (day) {
            isDay = true;
          },
          isWeek: (week) {
            isWeek = true;
          },
          isMonth: (month) {
            isMonth = true;
          },
          isRange: (start, end) {
            isRange = true;
            expect(start, startTime);
            expect(end, endTime);
          },
        ),
      );

      expect(isDay, false);
      expect(isWeek, false);
      expect(isMonth, false);
      expect(isRange, true);

      // 跨天
      startTime = startOfDay(
        DateTime.utc(2025, 10, 10, 10, 0, 0).millisecondsSinceEpoch,
      );
      endTime = endOfDay(
        DateTime.utc(2025, 10, 12, 12, 0, 0).millisecondsSinceEpoch,
      );
      isDay = false;
      isWeek = false;
      isMonth = false;
      isRange = false;

      optimizeTimeRange(
        startTime,
        endTime,
        ITimeRangeOptimizer(
          isDay: (day) {
            isDay = true;
          },
          isWeek: (week) {
            isWeek = true;
          },
          isMonth: (month) {
            isMonth = true;
          },
          isRange: (start, end) {
            isRange = true;
            expect(start, startTime);
            expect(end, endTime);
          },
        ),
      );

      expect(isDay, false);
      expect(isWeek, false);
      expect(isMonth, false);
      expect(isRange, true);

      // isWeek
      startTime = startOfDay(
        DateTime.utc(2026, 1, 4, 10, 0, 0).millisecondsSinceEpoch,
      );
      endTime = endOfDay(
        DateTime.utc(2026, 1, 10, 12, 0, 0).millisecondsSinceEpoch,
      );
      isDay = false;
      isWeek = false;
      isMonth = false;
      isRange = false;

      // 这里需要根据实际的 optimizeTimeRange 逻辑调整
      // 假设我们直接调用 isWeek 回调
      optimizeTimeRange(
        startTime,
        endTime,
        ITimeRangeOptimizer(
          isDay: (day) {
            isDay = true;
          },
          isWeek: (week) {
            isWeek = true;
            expect(week, startTime);
          },
          isMonth: (month) {
            isMonth = true;
          },
          isRange: (start, end) {
            isRange = true;
          },
        ),
      );

      expect(isDay, false);
      expect(isWeek, true);
      expect(isMonth, false);
      expect(isRange, false);

      // isMonth
      startTime = startOfDay(
        DateTime.utc(2026, 1, 1, 10, 0, 0).millisecondsSinceEpoch,
      );
      endTime = endOfDay(
        DateTime.utc(2026, 1, 31, 12, 0, 0).millisecondsSinceEpoch,
      );
      isDay = false;
      isWeek = false;
      isMonth = false;
      isRange = false;

      // 这里需要根据实际的 optimizeTimeRange 逻辑调整
      // 假设我们直接调用 isMonth 回调
      optimizeTimeRange(
        startTime,
        endTime,
        ITimeRangeOptimizer(
          isDay: (day) {
            isDay = true;
          },
          isWeek: (week) {
            isWeek = true;
          },
          isMonth: (month) {
            isMonth = true;
            expect(month, startTime);
          },
          isRange: (start, end) {
            isRange = true;
          },
        ),
      );

      expect(isDay, false);
      expect(isWeek, false);
      expect(isMonth, true);
      expect(isRange, false);
    });
  });

  group('url', () {
    test('encodeUriComponent', () {
      expect(
        encodeUriComponent("key=123 啊啊+-*/_.!~()'"),
        "key%3D123%20%E5%95%8A%E5%95%8A%2B-*%2F_.!~()'",
      );
    });
    test('decodeUriComponent', () {
      expect(
        decodeUriComponent("key%3D123%20%E5%95%8A%E5%95%8A%2B-*%2F_.!~()'"),
        "key=123 啊啊+-*/_.!~()'",
      );
    });
    test('toHttpProtocolUrl', () {
      expect(toHttpProtocolUrl('http://example.com'), 'http://example.com');
      expect(toHttpProtocolUrl('https://example.com'), 'https://example.com');
      expect(toHttpProtocolUrl('//example.com'), 'https://example.com');
      expect(toHttpProtocolUrl('example.com'), 'https://example.com');
    });

    test('toRelativeProtocolUrl', () {
      expect(toRelativeProtocolUrl('http://example.com'), '//example.com');
      expect(toRelativeProtocolUrl('https://example.com'), '//example.com');
      expect(toRelativeProtocolUrl('//example.com'), '//example.com');
      expect(toRelativeProtocolUrl('example.com'), '//example.com');
    });
  });
}
