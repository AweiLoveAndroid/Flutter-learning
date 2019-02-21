import 'dart:math';

// 重定向构造函数
void main() {
  var result = new Test(4, true, '数字', 10);
  // abcd分别是：4,true,数字,10
  print('abcd分别是：${result.a},${result.b},${result.c},${result.d}');
}

class Test {
  num a;
  bool b;
  String c;
  num d;
  // 主构造函数
  Test(this.a, this.b, this.c, this.d);

  // 委托给主构造函数
  Test.test1(num x,bool y) : this(x, y,'', 0);
  Test.test2(num a,bool b, String c) : this(a, b, c, 0);
  Test.test3(num a,bool b, String c,num d) : this(a, b, c, d);
}