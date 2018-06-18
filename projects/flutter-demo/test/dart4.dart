import 'dart:math';

/// 如何在Dart中创建工厂类

main() {
  /// 方式1：
  final circle = shapeFactory('circle');
  final square = shapeFactory('square');

  /// 方式2：
//  final circle = new Shape('circle');
//  final square = new Shape('square');
  print(circle.area);
  print(square.area);
}

/// Dart可以在一个文件中定义多个类
abstract class Shape {
  /// 方式2：使用Dart的factory关键字来创建工厂构造函数。
  factory Shape(String type) {
    if (type == 'circle') return new Circle(2);
    if (type == 'square') return new Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}

/// dart.math是Dart的核心图书馆之一。
/// 其他核心库包括dart：core，dart：async，dart：convert和dart：collection。
/// 在Dart2 中，核心库常量是小写字母
class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

/// 方式1：工厂类
Shape shapeFactory(String type) {
  if (type == 'circle') return new Circle(10);
  if (type == 'square') return new Square(5);
  throw 'Can\'t create $type.'; // 抛异常
}
