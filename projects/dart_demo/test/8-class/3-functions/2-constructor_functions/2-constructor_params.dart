// Dart具有语法糖，可以将构造函数参数赋值给实例变量
void main() {
  new Test1(3, 4); // x:3, y:4
}

class Test1 {
  num x, y;

  // 构造函数运行之前设置x和y
  Test1(this.x, this.y) {
    print('x:$x, y:$y');
  }

  // 没有内容体  可以简写
  // Test1(num x, num y);
}

class Test2 {
  num x, y;

  // 没有内容体  可以简写
  Test2(num x, num y);
}
