import '../convert/discount.dart';

/// 把万分比格式化为百分比
String formatDiscount(int value) {
  return '${discountToDisplay(value)}折';
}