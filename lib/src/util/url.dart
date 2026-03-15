/// 编码 URI 组件
///
/// [str] 要编码的字符串
/// 返回编码后的字符串
String encodeUriComponent(String str) {
  return Uri.encodeComponent(str);
}

/// 解码 URI 组件
///
/// [str] 要解码的字符串
/// 返回解码后的字符串
String decodeUriComponent(String str) {
  return Uri.decodeComponent(str);
}

final _httpProtocolPattern = RegExp(r'^https?://', caseSensitive: false);

/// 标准化 URL：确保包含协议部分
String toHttpProtocolUrl(String url) {
  if (url.isEmpty) {
    return '';
  }

  if (_httpProtocolPattern.hasMatch(url)) {
    return url;
  }

  if (url.startsWith('//')) {
    return 'https:$url';
  }

  return 'https://$url';
}

/// 将 URL 转换为协议相对路径（以 // 开头）
String toRelativeProtocolUrl(String url) {
  if (url.isEmpty) {
    return '';
  }

  if (_httpProtocolPattern.hasMatch(url)) {
    return url.replaceFirst(_httpProtocolPattern, '//');
  }

  if (!url.startsWith('//')) {
    return '//$url';
  }

  return url;
}
