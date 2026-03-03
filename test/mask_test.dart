import 'package:hive_dart/hive_dart.dart';
import 'package:test/test.dart';

void main() {
  group('mask', () {
    test('maskMobile', () {
      expect(maskMobile(''), "");
      expect(maskMobile('你'), "你");
      expect(maskMobile('13812345678'), "138****5678");
      expect(maskMobile('1234567890'), '1234567890');
      expect(maskMobile('12345'), '12345');
      expect(maskMobile('138-0013-8000'), '138-0013-8000');
    });
    test('maskName', () {
      expect(maskName(''), "***");
      expect(maskName('你'), "***");
      expect(maskName('你好'), "***好");
      expect(maskName('你好呀'), "***呀");
      expect(maskName('你好呀123'), "***3");
    });
  });
}
