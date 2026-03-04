/// 脱敏邮箱
String maskEmail(String email) {
  final atIndex = email.indexOf('@');
  if (atIndex <= 0) {
    return email;
  }

  final username = email.substring(0, atIndex);
  final domain = email.substring(atIndex);

  if (username.length <= 1) {
    return '***$domain';
  }

  return '***${username[username.length - 1]}$domain';
}
