// bool示例
void main() {
  test();
}

void test() {

  // 检查是否为空字符串
  var emptyStr = '';
  assert(emptyStr.isEmpty);

  // 检查是否为0
  var numberStr = 0;
  assert(numberStr <= 0);

  // 检查是否为null
  var nullStr;
  assert(nullStr == null);

  // 检查是否为NaN
  var value = 0 / 0;
  assert(value.isNaN);
}
