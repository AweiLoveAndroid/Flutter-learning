/// 创建一个简单的Dart类
void main() {
  // 创建Bicycle对象 在Dart2中 new关键字可以省略
  /// 如果一个变量的值不会改变，你可以使用final而不是var
  var bike = new Bicycle(2, 100, 1);
  print(bike); //打印结果 Bicycle: 100 km/h
}

/// 在Dart中，您可以在类之外定义代码。变量，函数，getter和setter都可以写在类之外
/// Java使用private标记声明私有实例变量，Dart不需要
/// Dart所有的标识符默认都是公开的，Dart没有为关键字public，private或protected
/// Dart使用2个字符的缩进，而不是4个
class Bicycle {
  // 定义成员变量
  int cadence;
  int speed;
  int gear;

  // 构造方法
  /// 这个构造函数没有方法体的，它在Dart中是有效的
  /// 在构造函数中的参数列表使用this能够更方便便捷的对实例变量赋值
  Bicycle(this.cadence, this.speed, this.gear);

  /// 这个构造方法是有方法体的，等同于上面那个构造方法
//  Bicycle(int cadence, int speed, int gear) {
//    this.cadence = cadence;
//    this.speed = speed;
//    this.gear = gear;
//  }

  /// Dart在指定字符串时支持单引号或双引号
  /// 使用字符串插值将表达式的值放入字符串文字中：${expression}
  /// 如果表达式是标识符，则可以跳过大括号：$variableName
  /// 使用胖箭头 => 符号缩短单行函数或方法
  @override
  String toString() => 'Bicycle speed: $speed km/h';
}
