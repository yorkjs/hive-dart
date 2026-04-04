/// 判断经纬度是否在中国的大致范围内
/// [longitude] 经度 (-180 到 180)
/// [latitude] 纬度 (-90 到 90)
/// 如果在中国范围内返回 true，否则返回 false
bool isLocationInChina(double longitude, double latitude) {
  // 定义中国疆域的近似包围盒
  return latitude >= 3.5 &&      // 最南端 (曾母暗沙附近)
         latitude <= 54.0 &&     // 最北端 (漠河附近，留一点余量)
         longitude >= 73.0 &&    // 最西端 (帕米尔高原附近)
         longitude <= 135.5;     // 最东端 (黑瞎子岛附近)
}