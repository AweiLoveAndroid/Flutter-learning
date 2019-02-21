// 如果没有更多实际操作内容，可以简写。
void main() {
 new Test1(4, 3);

  new Test2.withAssert(5, 10);
}

// 有参构造使用assert校验参数：

class Test1 {
  var x, y;

  //如果没有更多实际操作内容 可以这样简写：
  Test1(var x, var y) : assert(x >= 0);

}

// 命名构造使用assert校验参数：

class Test2 {
  var x, y;
  Test2.withAssert(this.x, this.y) : assert(x >= 0);
}