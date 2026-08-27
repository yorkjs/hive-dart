import './string.dart';

/// 计算短信的预估字符数和短信条数。
///
/// 返回：[字符数, 短信条数]
List<int> calculateSmsCount(
  String signatureName,
  String templateContent,
  int perSmsCharCount,
) {
  var charCount = getStringLength(templateContent);

  if (signatureName.isNotEmpty) {
    // 【签名】
    charCount += getStringLength(signatureName) + 2;
  }

  if (charCount == 0 || perSmsCharCount <= 0) {
    return [charCount, 0];
  }

  final smsCount = (charCount + perSmsCharCount - 1) ~/ perSmsCharCount;

  return [charCount, smsCount];
}