import '../constant/auth_code.dart';

/// 解析付款码
int parseAuthCode(String value) {

  // 微信支付通常以 10-15 开头、18 位纯数字
  if (RegExp(r'^1[0-5]').hasMatch(value)
    && RegExp(r'^\d{18}$').hasMatch(value)
  ) {
    return AUTH_CODE_WECHAT;
  }

  // 支付宝通常以 25-30 开头、18-25 位纯数字
  if ((RegExp(r'^2[5-9]').hasMatch(value) || RegExp(r'^30').hasMatch(value))
    && RegExp(r'^\d{18,25}$').hasMatch(value)
  ) {
    return AUTH_CODE_ALIPAY;
  }

  return -1;
}