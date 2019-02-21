// 命名构造
void main() {
  new Test.help();
}

class Test{
  var x, y;
  Test(){
    print('这是 Test 类的空参构造');//Test.help() 命名函数 x=5, y = 10
  }
  // 命名构造
  Test.help(){
    x = 5;
    y = 10;
    print('Test.help() 命名函数 x=${x}, y = ${y}');
  }
}
