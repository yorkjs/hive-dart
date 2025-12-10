import '../constant/auth_code.dart';

/// 解析付款码
int parseAuthCode(String value) {
  // 微信    133619858964803511
  // 支付宝  283654147086344711
  final length = value.length;
  if (length == 18 || length == 19 || length == 20) {
    if (value.startsWith('1')) {
      return AUTH_CODE_WECHAT;
    }
    if (value.startsWith('2')) {
      return AUTH_CODE_ALIPAY;
    }
  }
  return -1;
}