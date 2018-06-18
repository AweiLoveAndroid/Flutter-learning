/// Dart支持函数式编程中，可以执行以下操作：
/// 传递函数作为参数。
/// 为变量分配一个函数。
/// 解构一个函数，该函数将多个参数放入一系列函数中，每个函数采用一个参数（也称为currying）。
/// 创建一个可以用作常量值的无名函数（也称为lambda表达式）。
/// 在Dart中，甚至函数都是对象并且有一个类型Function。即：函数可以分配给变量或作为参数传递给其他函数。
main() {
  final values = [1, 2, 3, 5, 10, 50];
  for (var length in values) {
    print(scream(length));
  }

  /// for循环
  values.map(scream).forEach(print);

  /// 来自于dart:collection包里面的 List and Iterable, 有fold, where, join, skip等函数。
  /// Dart 同样也有 Map 和 Set
  // skip(1)跳过values列表文字中的第一个值1
  // take(3)获取values列表文字中的下3个值（2,3和5）。
  // 剩余的值被跳过
  values.skip(1).take(3).map(scream).forEach(print);
}

String scream(int length) => "A${'a' * length}h!";
