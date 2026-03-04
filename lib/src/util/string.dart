import 'dart:math';
import 'dart:convert';

/// 获取字符串长度
///
/// 注意：中文算 1 个字符
int getStringLength(String str) {
  return str.length;
}

/// 移除字符串开头和结尾的空白符
String trimString(String str) {
  return str.trim();
}

/// 截取字符串
String sliceString(String str, int start, int end) {
  return str.substring(start, end);
}

/// 截断字符串，最多显示 maxLength 个字符，超过部分用省略号表示
String truncateString(String str, int maxLength) {
  if (str.length <= maxLength) {
    return str;
  }

  if (maxLength <= 3) {
    return str.substring(0, maxLength);
  }

  return '${str.substring(0, maxLength - 3)}...';
}

/// 补全字符串开头，不足 length 个字符用 0 填充
///
/// [str] 要补全的字符串
/// [length] 目标长度
/// 返回补全后的字符串
String padStringStart(String str, int length) {
  return str.padLeft(length, '0');
}

/// 渲染字符串模板
///
/// [str] 字符串模板，例如：'你好，${name}'
/// [data] 数据对象，例如：{'name': '张三'}
/// 返回渲染后的字符串，例如：'你好，张三'
String renderStringTemplate(String str, Map<String, dynamic> data) {
  final RegExp regex = RegExp(r'\${(.*?)}');

  return str.replaceAllMapped(regex, (match) {
    // 获取变量名并去除两端空白
    final key = match.group(1)?.trim() ?? '';
    // 获取对应的值
    final value = data[key];
    // 如果找不到对应的值，返回原占位符
    return value != null ? value.toString() : match.group(0)!;
  });
}

/// 编码 URI 组件
///
/// [str] 要编码的字符串
/// 返回编码后的字符串
String encodeURIComponent(String str) {
  return Uri.encodeComponent(str);
}

/// 解码 URI 组件
///
/// [str] 要解码的字符串
/// 返回解码后的字符串
String decodeURIComponent(String str) {
  return Uri.decodeComponent(str);
}
