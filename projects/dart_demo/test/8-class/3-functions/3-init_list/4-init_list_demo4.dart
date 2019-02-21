// 把构造的初始化和assert校验同时使用
void main() {
  new Test1(5, 10);
}

class Test1 {
  var x, y;
  Test1(var x, var y) : assert(x > 0) {
    this.x = x;
    this.y = y;
    print('Test1 有参构造初始化');
  }
}
