/// 是否为对公账户号码
///
/// [value] 对公账户号码
/// 返回是否为对公账户
bool isCorporateAccountNumber(String value) {
  return RegExp(r'^\d{9,22}$').hasMatch(value);
}