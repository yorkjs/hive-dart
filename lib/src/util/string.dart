/// 获取字符串字符数量
///
/// 注意：中文和英文都算 1 个字符
int getStringLength(String str) {
  return str.length;
}

/// 获取字符串宽度，此函数常用于排版辅助计算
///
/// 注意：中文算 2 个单位，英文数字算 1 个单位
int getStringWidth(String str) {
  if (str.isEmpty) {
    return 0;
  }

  int wideCount = 0;
  for (int i = 0; i < str.length; i++) {
    final codeUnit = str.codeUnitAt(i);
    // 判断是否为宽字符（非 ASCII 或全角字符）
    if (codeUnit > 0xFF || (codeUnit >= 0xFF61 && codeUnit <= 0xFF9F)) {
      wideCount++;
    }
  }

  return wideCount * 2 + (str.length - wideCount);
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

/// 补全字符串开头，不足 length 个字符用 0 填充
///
/// [str] 要补全的字符串
/// [length] 目标长度
/// 返回补全后的字符串
String padStringStart(String str, int length) {
  return str.padLeft(length, '0');
}

/// 判断字符串是否包含特殊字符
///
/// [str] 目标字符串
/// 返回是否包含特殊字符
bool hasSpecialCharacter(String str) {
  if (str.isEmpty) {
    return false;
  }
  final pattern = RegExp(
    r'''[^ \u4e00-\u9fa5a-zA-Z0-9，。、；：！“”‘’（）【】《》？～·—…\.,;:!?"'()\[\]{}<>@#&%￥$_\-]''',
  );
  return pattern.hasMatch(str);
}

/// 移除字符串中的特殊字符
///
/// [str] 目标字符串
/// 返回清理后的字符串
String removeSpecialCharacter(String str) {
  if (str.isEmpty) {
    return '';
  }
  final pattern = RegExp(
    r'''[^ \u4e00-\u9fa5a-zA-Z0-9，。、；：！“”‘’（）【】《》？～·—…\.,;:!?"'()\[\]{}<>@#&%￥$_\-]''',
  );
  return str.replaceAll(pattern, '');
}
