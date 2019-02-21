
// 静态变量和方法
void main() {
  assert(Test. a == 16);
  print(Point.area(5, 4));
}

// 静态变量
class Test {
  static const num a = 16;
  // ···
}


// 静态方法
class Point {
  static num area(num x, num y) {
    return (x * y)/2;
  }
}