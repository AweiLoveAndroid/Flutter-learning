// 泛型 demo
// 泛型集合及其包含的类型
void main() {
  var names = List<String>();
  names.addAll(['Seth', 'Kathy', 'Lars']);
  print(names is List<String>);// true
  print(names.runtimeType);// List<String>
}
