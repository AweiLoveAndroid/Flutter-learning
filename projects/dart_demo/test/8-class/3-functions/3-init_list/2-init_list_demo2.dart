// 使用assert在初始化列表用来校验输入参数
void main() {
  new Test1(4, 3);

  new Test2.withAssert(5, 10);
}

// 有参构造使用assert校验参数：

class Test1 {
  var x, y;

  Test1(var x, var y) : assert(x >= 0) {
    print('Test5(): ($x, $y)');
  }
}

// 命名构造使用assert校验参数：

class Test2 {
  var x, y;
  Test2.withAssert(this.x, this.y) : assert(x >= 0) {
    print('Test2.withAssert(): ($x, $y)');
  }
}
