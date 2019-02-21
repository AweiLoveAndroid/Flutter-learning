// 泛型 demo
// 泛型方法：使用在类和方法上
void main() {
  List<String> data = ["张三","李四","王五"];
  var result = first(data);
  print(result);
}

// 在以下几个地方使用类型参数T:
// 返回类型T, 参数类型List<T>, 局部变量的类型T tmp
T first<T>(List<T> data) {
  // 做一些初始工作或错误检查...
  T tmp = data[0];
  // 做一些额外的检查或处理...
  return tmp;
}

class Test {
  static int first<M, N>(int x) => 3;
  int second<M, N>(int y) => 5;
}

void functionTypedParameter<T>(T callback){}

void  localFunction(){
   T itself<T>(T thing) => thing;
}

void functionExpression(){
   var lambda =  <T>(T thing) => thing;
}
