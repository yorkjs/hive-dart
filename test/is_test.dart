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

    test('isEmail', () {
      expect(isEmail('abc@xxx.com'), true);
      expect(isEmail('a@163.com'), true);
      expect(isEmail('abc@qq.com'), true);
      expect(isEmail('abc@qq.cn'), true);
      expect(isEmail('abc@qq.com.cn'), true);
      expect(isEmail('abc@qq.net'), true);
      expect(isEmail('abc-123@qq.net'), true);
      expect(isEmail('abc-123qq.net'), false);
      expect(isEmail('abc-123@qq'), false);
      expect(isEmail('@qq'), false);
      expect(isEmail('@qq.com'), false);
      expect(isEmail('中文@qq.com'), false);
    });

    test('isPrice', () {
      expect(isPrice('0'), true);
      expect(isPrice('1'), true);
      expect(isPrice('1.0'), true);
      expect(isPrice('1.1'), true);
      expect(isPrice('1.12'), true);
      expect(isPrice('123.12'), true);
      expect(isPrice('1.123'), false);
      expect(isPrice('+1'), false);
      expect(isPrice('-1'), false);
      expect(isPrice('abc'), false);
      expect(isPrice('1.'), false);
      expect(isPrice(''), false);
    });

    test('isUrl', () {
      expect(isUrl(''), false);
      expect(isUrl('https://www.baidu.com'), true);
      expect(isUrl('http://www.baidu.com'), true);
      expect(isUrl('htt://www.baidu.com'), false);
      expect(isUrl('ftp://www.baidu.com'), false);
      expect(isUrl('https://www.baidu.com/'), true);
      expect(isUrl('https://www.baidu.com/a'), true);
      expect(isUrl('https://www.baidu.com/a/b'), true);
      expect(isUrl('https://www.baidu.com/a/b/c'), true);
      expect(isUrl('https://www.baidu.com/a/b/c?a=1'), true);
      expect(isUrl('https://www.baidu.com/a/b/c?a=1&b=2'), true);
      expect(isUrl('https://www.baidu.com/a/b/c?a=1&b=2#hash'), true);
    });

    test('isVerifyCode', () {
      expect(isVerifyCode('111222'), true);
      expect(isVerifyCode('11122'), false);
      expect(isVerifyCode('1112222'), false);
      expect(isVerifyCode('11122a'), false);
      expect(isVerifyCode('aaaaaa'), false);
      expect(isVerifyCode(''), false);
    });
  });
}
