import 'package:hive_dart/src/normalize/shelf_life.dart';

String formatShelfLife(int value) {

  final List<String> result = [];
  final data = normalizeShelfLife(value);

  if (data.years > 0) {
    result.add('${data.years}年');
  }
  if (data.months > 0) {
    result.add('${data.months}个月');
  }
  if (data.days > 0) {
    result.add('${data.days}天');
  }
  if (data.hours > 0) {
    result.add('${data.hours}小时');
  }

  return result.join('');

}