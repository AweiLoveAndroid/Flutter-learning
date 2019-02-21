import 'dart:math';

// 常量构造函数
void main() {
  var result = new Test(4, 10);
  print('x：${result.x}, y: ${result.y}');
}

class Test {
  static final Test origin = const Test(0, 0);
  final num x, y;
  const Test(this.x, this.y);
}