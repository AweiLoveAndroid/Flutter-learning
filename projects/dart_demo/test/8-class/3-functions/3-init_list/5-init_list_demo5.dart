import 'dart:math';

// 设置final字段，初始化程序时更方便

void main() {
  var p = new Test1(4, 3);
  print('长方形的对角线长度：${p.hypotenuse}');
}

class Test1 {
  final num width;
  final num height;
  final num hypotenuse;

  Test1(width, height)
      : width = width,
        height = height,
        hypotenuse = sqrt(width * width + height * height);
}
