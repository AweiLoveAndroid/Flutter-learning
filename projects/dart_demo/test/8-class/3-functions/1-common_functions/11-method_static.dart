// 静态方法
void main() {
  print(Point.area(5, 4)); // 10
}

class Point {
  static num area(num x, num y) {
    return (x * y) / 2;
  }
}
