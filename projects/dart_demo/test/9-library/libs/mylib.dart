// 这是一个库 命名为mylib
library mylib;

// 希望使用mylib的时候 自动使用otherlib.dart  可以使用export关键字引入其他库
export 'otherlib.dart';
// 导入otherlib2.dart
export 'otherlib2.dart';

class MyLib {
  void test() {
    print('mylib.dart： MyLib ： test()函数');
  }
}

void test2() {
  print('mylib.dart： test2()函数');
}
