// 泛型 demo
// 使用带有构造函数的参数化类型
void main() {
  var names = List<String>();
  names.addAll(['Seth', 'Kathy', 'Lars']);

  // Set类带有一个泛型 from是一个工厂函数
  // abstract class Set<E> extends EfficientLengthIterable<E>
  // factory Set.from(Iterable elements) = LinkedHashSet<E>.from;
  var nameSet = Set<String>.from(names);
}
