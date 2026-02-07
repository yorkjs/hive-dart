/// 验证验证码格式，6 位数字
bool isVerifyCode(String value) {
  return value.contains(RegExp(r'^\d{6}$'));
}
