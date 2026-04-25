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

    test('isHexColor', () {
      expect(isHexColor('#666'), true);
      expect(isHexColor('#616161'), true);
      expect(isHexColor('#6'), false);
      expect(isHexColor('#66'), false);
      expect(isHexColor('#6666'), true); // rgba
      expect(isHexColor('#66666'), false);
      expect(isHexColor('#6666666'), false);
      expect(isHexColor('#66666666'), true); // rgba
      expect(isHexColor('#666666666'), false);

      expect(isHexColor('666'), false);
      expect(isHexColor('666666'), false);
    });

    test('isBankCardNumber', () {
      expect(isBankCardNumber(''), false);
      expect(isBankCardNumber('1'), false);
      expect(isBankCardNumber('12'), false);
      expect(isBankCardNumber('6228480012345678'), false);
      expect(isBankCardNumber('1234567890123'), false);
    });

    test('isCorporateAccountNumber', () {

      expect(isCorporateAccountNumber(''), false);
      expect(isCorporateAccountNumber('1'), false);
      expect(isCorporateAccountNumber('12'), false);
      expect(isCorporateAccountNumber('6228480012123123123123123345678'), false);
      expect(isCorporateAccountNumber('1234567890123'), true);
      expect(isCorporateAccountNumber('asdasdasdasd'), false);

    });

    test('isLocationInChina', () {

      expect(isLocationInChina(116.4074, 39.9042), true);
      expect(isLocationInChina(121.4874, 31.2242), true);
      expect(isLocationInChina(160.4874, 31.2242), false);
      expect(isLocationInChina(121.4874, 80), false);
      expect(isLocationInChina(0, 0), false);
      expect(isLocationInChina(-120, -30), false);

    });

    test('isMobile', () {

      expect(isMobile('13512345678'), true);
      expect(isMobile('1351234567'), false);
      expect(isMobile('135123456789'), false);
      expect(isMobile(' 13512345678'), false);
      expect(isMobile('13512345678 '), false);
      expect(isMobile(' 13512345678 '), false);
      expect(isMobile(''), false);

    });

    test('isIdentityCardNumber', () {
      expect(isIdentityCardNumber(''), false);
      expect(isIdentityCardNumber('1'), false);
      expect(isIdentityCardNumber('12'), false);
      expect(isIdentityCardNumber('464561561561651'), false);
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
