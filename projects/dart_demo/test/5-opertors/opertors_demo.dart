// 运算符使用示例
void main() {
  basicDemo();

  specialDemo();
}

// 通用的运算符的使用
void basicDemo() {
  // 声明几个变量
  int a = 5;
  var b = 6.0;
  bool flag = false;
  bool flag2 = true;

  Test demo = new Test(); // 这里会调用Test构造函数
  Test2 demo2 = new Test2(); // 这里会先调用Test构造函数，再调用Test2构造函数

  print(a++); // 5
  print(b--); // 6.0
  // 构造函数 Test
  // Instance of 'Test'
  print(new Test());
  var c = const [1, 2];
  print(c); // [1, 2]
  print(Test.fun()); // Test fun函数

  print(5 - 2); // 3
  print(!flag); // true
  print(~a); // -7
  print(++a); // 7
  print(--b); // 4.0

  print(5 * 2); // 10
  print(5 / 2); // 2.5
  print(5 % 2); // 1

  print(5 + 2); // 7
  print(5 - 2); // 3

  print(5 >> 2); // 1
  print(5 << 2); // 20

  print(5 ^ 2); // 7
  print(5 & 2); // 0

  print(5 | 2); // 7

  print((5 > 2) && (5 < 2)); // false
  print((5 > 2) || (5 < 2)); // true

  print(5 >= 2); // true
  print(5 > 2); // true
  print(5 <= 2); // false
  print(5 < 2); // false

  print(5 == 2); // false
  print(5 != 2); // true

  print(a == 3 ? 3 : 2); // 2

  a = 3;
  print(a); // 3
  a *= 3;
  print('a *=3 : ${a *= 3}'); // 27
  b /= 3;
  print('a /=3 : ${b /= 3}'); // 0.6666666666666666
  a ~/= 3;
  print('a  ~/=3 : ${a ~/= 3}'); // 3
  a %= 3;
  print('a %=3 : ${a %= 3}'); // 0
  a += 3;
  print('a +=3 : ${a += 3}'); // 6
  a -= 3;
  print('a -=3 : ${a -= 3}'); // 0
  a <<= 3;
  print('a <<=3 : ${a <<= 3}'); // 0
  a >>= 3;
  print('a >>=3 : ${a >>= 3}'); // 0
  a &= 3;
  print('a &=3 : ${a &= 3}'); // 0
  a ^= 3;
  print('a ^=3 : ${a ^= 3}'); // 0
  a |= 3;
  print('a |=3 : ${a |= 3}'); // 3
}

// Dart里面比较有代表性的以及有特点的一些运算符相关用法
void specialDemo() {
  Test test = new Test(); // 这里会调用Test构造函数
  Test2 test2 = new Test2(); // 这里会先调用Test构造函数，再调用Test2构造函数

  print(Test?.funs); // 先打印null 再打印5

  String s = (new StringBuffer()
        ..write('test1 ')
        ..write('test2 ')
        ..write('test3 ')
        ..write('test4 ')
        ..write('test5'))
      .toString();
  print(s); // test1 test2 test3 test4 test5

  int a = 10;
  //普通三元运算符
  // var values = a > 5 ? a : 0;
  //??操作符
  print('a??3 : 结果是 ${a??3}'); // a ??3 结果是 10

  var values = (a != 0) ? a : 0;
  print('values=${values}'); // values=10

  var result2 = 5 / 2;
  print(result2); //结果是：2.5
  var result3 = 5 ~/ 2;
  print(result3); //结果是：2

  print(test2 is Test); // true
  print(test is! Test2); // true

  (test2 as Test2).fun(); // Test2 fun函数
  // 相当于
  // if (test2 is Test) {
  //   test2.fun();
  // }
}

class Test {
  static int funs = 5;

  Test() {
    print('构造函数 Test');
  }
  static fun() {
    print('Test fun函数');
  }
}

class Test2 extends Test {
  Test2() {
    print('构造函数 Test2');
  }
  void fun() {
    print('Test2 fun函数');
  }
}
