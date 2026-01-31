/// 截断字符串，最多显示 maxLength 个字符，超过部分用省略号表示
String truncateString(String str, int maxLength) {
    if (str.length <= maxLength) {
        return str;
    }

    if (maxLength <= 3) {
        return str.substring(0, maxLength);
    }

    return str.substring(0, maxLength - 3) + '...';
}