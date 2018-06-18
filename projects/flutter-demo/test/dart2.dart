void main() {
  var bike = new Bicycle(2, 1);
  bike.cadence = 10; // 给公有的成员变量赋值
  bike.gear = 20;
  bike.speedUp(50); // 调用公有的方法
  print(bike);
}

/// 默认情况下，Dart为所有公共实例变量提供隐式getter和setter。
/// 除非要强制执行只读或只写变量，计算或验证值或在其他位置更新值，
/// 否则不需要定义自己的getter / setter
class Bicycle {
  int cadence;

  /// Dart里面所有的私有属性 变量 方法等都是在前面加下划线
  int _speed = 50;
  int gear;

  Bicycle(this.cadence, this.gear);

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() => 'Bicycle: $_speed km/h';
}
