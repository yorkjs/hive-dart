import '../constant/phone_number.dart';

/// 解析电话号码
int parsePhoneNumber(String value) {
  // 手机号码
  if (RegExp(r'^1\d{10}$').hasMatch(value)) {
    return PHONE_NUMBER_MOBILE;
  }

  // 固定电话
  if (RegExp(r'^0\d{9,11}$').hasMatch(value) ||
      RegExp(r'^0\d{2,3}-\d{7,8}$').hasMatch(value)) {
    return PHONE_NUMBER_LANDLINE;
  }

  // 400 电话
  if (RegExp(r'^400\d{7}$').hasMatch(value) ||
      RegExp(r'^400-\d{3}-\d{4}$').hasMatch(value)) {
    return PHONE_NUMBER_400;
  }

  return -1;
}