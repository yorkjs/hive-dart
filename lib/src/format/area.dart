import 'package:hive_dart/src/type.dart';

final Map<String, String> provinceMap = {
  '北京市': '北京',
  '上海市': '上海',
  '天津市': '天津',
  '重庆市': '重庆',
};

// 城市映射
final Map<String, String> cityMap = {
  '省直辖县级行政区划': '省直辖',
  '自治区直辖县级行政区划': '省直辖',

  // 云南
  '楚雄彝族自治州': '楚雄',
  '红河哈尼族彝族自治州': '红河',
  '文山壮族苗族自治州': '文山',
  '西双版纳傣族自治州': '西双版纳',
  '大理白族自治州': '大理',
  '德宏傣族景颇族自治州': '德宏',
  '怒江傈僳族自治州': '怒江',
  '迪庆藏族自治州': '迪庆',

  // 湖北
  '恩施土家族苗族自治州': '恩施',

  // 湖南
  '湘西土家族苗族自治州': '湘西',

  // 甘肃
  '临夏回族自治州': '临夏',
  '甘南藏族自治州': '甘南',

  // 内蒙古
  '兴安盟': '兴安',
  '锡林郭勒盟': '锡林郭勒',
  '阿拉善盟': '阿拉善',

  // 青海
  '海北藏族自治州': '海北',
  '黄南藏族自治州': '黄南',
  '海南藏族自治州': '海南州',
  '果洛藏族自治州': '果洛',
  '玉树藏族自治州': '玉树',
  '海西蒙古族藏族自治州': '海西',

  // 吉林
  '延边朝鲜族自治州': '延边',

  // 四川
  '阿坝藏族羌族自治州': '阿坝',
  '甘孜藏族自治州': '甘孜',
  '凉山彝族自治州': '凉山',

  // 新疆
  '昌吉回族自治州': '昌吉',
  '博尔塔拉蒙古自治州': '博尔塔拉',
  '巴音郭楞蒙古自治州': '巴音郭楞',
  '阿克苏地区': '阿克苏',
  '克孜勒苏柯尔克孜自治州': '克孜勒苏柯尔克孜',
  '喀什地区': '喀什',
  '和田地区': '和田',
  '伊犁哈萨克自治州': '伊犁',
  '塔城地区': '塔城',
  '阿勒泰地区': '阿勒泰',

  // 贵州
  '黔西南布依族苗族自治州': '黔西南',
  '黔东南苗族侗族自治州': '黔东南',
  '黔南布依族苗族自治州': '黔南',
};

class IArea {
  INode? country;
  INode? province;
  INode? city;
  INode? district;
  String? address;

  IArea({
    this.country,
    this.province,
    this.city,
    this.district,
    this.address,
  });
}

// 格式化地区信息
String formatArea(IArea area, {bool simplify = true}) {

  final country = area.country;
  final province = area.province;
  final city = area.city;
  final district = area.district;
  final address = area.address;

  final List<String> list = [];
  String prevItem = '';

  void appendItem(String item) {
    list.add(item);
    prevItem = item;
  }

  var isChina = false;
  final isSimplify = simplify;
  final separator = isSimplify ? ' ' : '';

  if (country != null) {
    final item = country.name;
    appendItem(item);
    if (item == '中国') {
      isChina = true;
    }
  }

  if (province != null) {
    appendItem(
      isSimplify ? formatProvince(province.name) : province.name
    );
  }

  if (city != null) {
    final item = isSimplify ? formatCity(city.name) : city.name;
    if (item.isNotEmpty && item != '市辖区' && item != '县'
        && item != '省直辖' && item != prevItem) {
      appendItem(item);
    }
  }

  if (district != null) {
    final item = isSimplify ? formatDistrict(district.name) : district.name;
    if (item.isNotEmpty) {
      appendItem(item);
    }
  }
  if (address != null && address.isNotEmpty) {
    appendItem(address);
  }

  if (list.length > 1 && isChina) {
    // 删掉中国
    list.removeAt(0);
  }

  return list.join(separator);
}

String formatProvince(String name) {
  if (provinceMap.containsKey(name)) {
    return provinceMap[name]!;
  }
  if (name.endsWith('省') || name.endsWith('州')) {
    return name.substring(0, name.length - 1);
  }
  if (name.startsWith('新疆')
      || name.startsWith('西藏')
      || name.startsWith('宁夏')
      || name.startsWith('广西')
      || name.startsWith('香港')
      || name.startsWith('澳门')) {
    return name.substring(0, 2);
  }
  if (name.startsWith('内蒙古')) {
    return name.substring(0, 3);
  }
  return name;
}

String formatCity(String name) {
  // 有时候会把港澳台放到城市这级显示
  if (name.startsWith('中国')) {
    name = name.substring(2);
  }

  if (cityMap.containsKey(name)) {
    return cityMap[name]!;
  }

  if (name.endsWith('市')) {
    return name.substring(0, name.length - 1);
  }
  if (name.endsWith('地区')) {
    return name.substring(0, name.length - 2);
  }
  if (name.endsWith('自治州')) {
    return name.substring(0, name.length - 3);
  }
  return name;
}

String formatDistrict(String name) {
  if (name == '市辖区') {
    return '';
  }
  // 不要处理区，会影响有效信息展示
  return name;
}