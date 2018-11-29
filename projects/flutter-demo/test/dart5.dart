import 'dart:math';

/// 实现一个接口

main() {
  final circle = new Shape('circle');
  final square = new Shape('square');
  print(circle.area);
  print(square.area);
}

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return new Circle(2);
    if (type == 'square') return new Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

/// 添加一个扩展Circle类的CircleMock类.
/// 必须定义area和radius实例变量，如果不定义，会报“缺少具体实现”错误
class CircleMock implements Circle {
  num area;
  num radius;
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}
