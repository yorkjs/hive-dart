/// 验证网址格式
bool isUrl(String value) {
  try {
    final uri = Uri.parse(value);
    return uri.isScheme('http') || uri.isScheme('https');
  } catch (err) {
    return false;
  }
}
