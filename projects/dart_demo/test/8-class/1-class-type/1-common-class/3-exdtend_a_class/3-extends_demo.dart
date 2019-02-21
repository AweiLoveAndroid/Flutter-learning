// 继承一个类 示例代码
class Test {
  void test() {
    print('Test ==> test()');
  }
  // ···
}

class TestChild extends Test {
  // @override标注在test()函数上面 表示test()函数是重写父类的
  @override
  void test() {
    super.test();
    print('TestChild ==> test()');
  }
  // ···
}

// @deprecated的使用 表示过时方法
class Television {
  @deprecated
  void activate() {
    turnOn();
  }

  void turnOn() {
    //...
  }
}