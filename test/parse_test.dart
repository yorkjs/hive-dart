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

  });
}