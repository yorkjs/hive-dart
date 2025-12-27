import 'package:hive_dart/hive_dart.dart';
import 'package:test/test.dart';

void main() {

  group('parse', () {

    test('parseAuthCode', () {
      expect(parseAuthCode('133619858964803511'), AUTH_CODE_WECHAT);
      expect(parseAuthCode('283654147086344711'), AUTH_CODE_ALIPAY);
      expect(parseAuthCode('583654147086344711'), -1);
      expect(parseAuthCode('C69241878121'), -1);
    });

    test('parsePhoneNumber', () {

      expect(parsePhoneNumber('15812347890'), PHONE_NUMBER_MOBILE);
      expect(parsePhoneNumber('01088427865'), PHONE_NUMBER_LANDLINE);
      expect(parsePhoneNumber('010-88427865'), PHONE_NUMBER_LANDLINE);
      expect(parsePhoneNumber('091288427865'), PHONE_NUMBER_LANDLINE);
      expect(parsePhoneNumber('0912-87654321'), PHONE_NUMBER_LANDLINE);
      expect(parsePhoneNumber('4008997651'), PHONE_NUMBER_400);
      expect(parsePhoneNumber('400-899-7651'), PHONE_NUMBER_400);
      expect(parsePhoneNumber('40089976512'), -1);
      expect(parsePhoneNumber('C69241878121'), -1);

    });

  });
}