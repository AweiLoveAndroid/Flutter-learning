import 'dart:math';

// 常量上下文中的const构造函数
void main() {
// 这里有很多const关键字
  const pointAndLine = const {
    'point': const [const ImmutablePoint(0, 0)],
    'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
  };

// 只有一个const, 它建立了常量上下文
  const pointAndLine2 = {
    'point': [ImmutablePoint(0, 0)],
    'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
  };

  var a = const ImmutablePoint(1, 1); //创建一个常量
  var b = ImmutablePoint(1, 1); // 不创建常量
  assert(!identical(a, b)); // 不是同一个实例
}

class ImmutablePoint{
  const ImmutablePoint(int a, int b);
}