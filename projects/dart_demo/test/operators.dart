/// 运算符的使用
void main() {
  suanshu();
  fuzhi();
  guanxi();
  luoji();
  wei();
  weiyi();
  sanyuan();
  qita();
}

/// 算数运算符
void suanshu() {
  print('\n==============');

  print(13 + 3); //16
  print(13 - 3); //10
  print(13 * 3); //39

  print('==============');

  print(13 / 3); //4.333333333333333
  print(13 / -3); //-4.333333333333333
  print(-13 / 3); //-4.333333333333333
  print(-13 / -3); //4.333333333333333

  print('==============');

  print(13 ~/ 3); //4
  print(13 ~/ -3); //-4
  print(-13 ~/ 3); //-4
  print(-13 ~/ -3); //4

  print('==============');

  print(13 % 3); //1
  print(13 % -3); //1
  print(-13 % 3); //2
  print(-13 % -3); //2

  print('==============');

  print(-1); //-1 “-”表示负数的符号

  print('==============');

  //  i++ ：先引用后增加，i--同理
  //  ++i ：先增加后引用，--i同理

  int i = 1;
  int x = 1;
  x = i++; //先让x变成i的值1，再让i加1
  print(x); //输出的x为1
  print(i); //输出的i为2

  print('==============');

  int a = 1;
  int b = 1;
  b = ++a; //先让a加1, 再让b变成a的值2
  print(a); //输出的b为2
  print(b); //输出的a为2
}

/// 赋值运算符
void fuzhi() {
  print('\n==================');

  print('a初始值全部为2.0');
  double a1 = 2.0;
  a1 += 2;
  print("a1+= 2 结果是  $a1"); //4.0

  double a2 = 2.0;
  a2 -= 2;
  print("a2-= 2 结果是  $a2"); //0.0

  double a3 = 2.0;
  a3 *= 2;
  print("a3*=2 结果是  $a3"); //4.0

  double a4 = 2.0;
  a4 %= 2;
  print("a4%=2 结果是  $a4"); //0.0

  double a5 = 2.0;
  a5 = a5 / 2;
  print("a5/=2 结果是  $a5"); //1.0

  print('b初始值全部为16');

  int b1 = 16;
  b1 ~/= 2;
  print("b1~/=2 结果是  $b1"); //8

  int b2 = 16;
  b2 &= 2;
  print("b2&=2 结果是  $b2"); //0

  int b3 = 16;
  b3 |= 2;
  print("b3|=2 结果是  $b3"); //18

  int b4 = 16;
  b4 ^= 2;
  print("b4~=2 结果是  $b4"); //18

  int b5 = 16;
  b5 >>= 2;
  print("b5>>=2 结果是：  $b5"); //4

  int b6 = 16;
  b6 <<= 2;
  print("b6<<=2 结果是：  $b6"); //64

  print('==================');

  /// /=不能用在int值上面，因为int除以一个数结果是double值
  /// ~/=  &=   |=   ^= 2  >>= 2  <<= 2这些不能用在double值上面，因为结果是int值
}

/// 关系运算符
void guanxi() {
  print('\n==================');

  int a = 1;

  print(a == 1); // true
  print(a != 1); // false
  print(a > 1); // false
  print(a < 1); // false
  print(a >= 1); // true
  print(a <= 1); // true

  print('==================');
}

/// 逻辑运算符
void luoji() {
  print('\n==================');

  //  !expr	反转表达式（将false更改为true，反之亦然）
  //  ||	逻辑双或
  //  &&
  //  |	没有 逻辑或
  //  &	没有 逻辑与
  bool done = true;
  int col = 1;
  if (done && (col == 0 || col == 3)) {
    // ...Do something...
    print('OK');
  } else {
    print('不满足条件');
  }

  print('==================');
}

/// 位运算符
void wei() {
//      &  位与   有0则0
//      |  位或   有1则1
//      ^  位异或 相同为0，不同为1
//  ~expr  按位取反（包括符号位）

  print('\n==================');

  final value = 4;
  final bitmask = 2;

  // 4 二进制是 100   2 二进制是 10   ~2 二进制是101

  // 4 & 2 就是
  //      100
  //   &  010
  //结果：000

  // 4 & ~2 就是
  //      100
  //   &  101
  //结果：100

  // 4 | 2 就是
  //     100
  //   | 010
  //结果：110

  // 4 ^ 2 就是
  //     100
  //   ^ 010
  //结果：110

  print((value & bitmask)); //0  &是有0则0，结果是000，换算成10进制是0
  print((value & ~bitmask)); // 4 结果是100，换算成10进制是4
  print((value | bitmask)); // 6 结果是110，换算成10进制是6
  print((value ^ bitmask)); // 6 结果是110，换算成10进制是6

  print('==================');
}

/// 位移运算符
void weiyi() {
  //  << 向左移动	左边最高位丢弃，左边补齐0
  //  >> 向右移动	最高位是0，左边补齐0；最高位是1，左边补齐1

  print('\n==================');

  int value = 4;
  print(value << 2); // 16 相当于 4 *（2的平方）
  print(value >> 2); // 1 相当于 4 /（2的平方）

  print('==================');
}

/// 三元运算符
void sanyuan() {
  bool isPublic;
  String visibility = isPublic ? 'public' : 'private';

  String playerName(String name) => name ?? 'Guest';
  //相当于 String playerName(String name) => name != null ? name : 'Guest';
}

/// 其他运算符
void qita() {}
