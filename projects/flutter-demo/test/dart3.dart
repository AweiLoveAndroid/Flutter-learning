import 'dart:math';

main() {
  print(new Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(new Rectangle(origin: const Point(10, 10)));
  print(new Rectangle(width: 200));
  print(new Rectangle());

  /// 输出结果：
  /// Origin: (10, 20), width: 100, height: 200
  /// Origin: (10, 10), width: 0, height: 0
  /// Origin: (0, 0), width: 200, height: 0
  /// Origin: (0, 0), width: 0, height: 0
}

/// Java支持重载构造函数，但是Dart不支持重载函数，Dart只有可选参数

class Rectangle {
  int width;
  int height;
  Point origin;

  /// 被const修饰的 是编译时常量
  /// this.origin，this.width并且this.height是可选的命名参数。命名参数用大括号{}括起来
  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}
