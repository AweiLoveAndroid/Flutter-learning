// 构造不能被继承
void main() {
  // 先执行Test类的空参构造， 再执行TestChild类的空参构造。
  // 这是 Test 类的空参构造
  // 这是 TestChild 类的空参构造
  new TestChild();

  // 调用时会报错
  // new TestChild.help();
}

class Test{
  var x, y;
  Test(){
    print('这是 Test 类的空参构造');
  }
// 命名构造不能被继承
  Test.help(){
    x = 5;
    y = 10;
    print('Test.help() 命名函数 x=${x}, y = ${y}');
  }
}

class TestChild extends Test{
  var x, y;
  TestChild(){
    print('这是 TestChild 类的空参构造');
  }
  // 加上与父类相同的命名构造就不会错 注释了就会报错
  // TestChild.help(){
  //   x = 3;
  //   y = 2;
  //   print('TestChild.help() 命名函数 x=${x}, y = ${y}');
  // }
}
