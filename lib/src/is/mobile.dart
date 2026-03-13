
import 'package:hive_dart/src/constant/phone_number.dart';
import 'package:hive_dart/src/parse/phone_number.dart';

/// 是否为手机号码
///
/// [value] 手机号码
/// 返回是否为手机
bool isMobile(String value) {
  return parsePhoneNumber(value) == PHONE_NUMBER_MOBILE;
}