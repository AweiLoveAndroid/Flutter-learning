// 泛型 demo
// 限制参数类型
void main() {
  var someBaseClassFoo = Foo<SomeBaseClass>();
  var extenderFoo = Foo<Extender>();

   print(someBaseClassFoo.toString());// Instance of Foo<SomeBaseClass>
   print(extenderFoo.toString());// Instance of Foo<SomeBaseClass>

 // 不指定泛型参数也可以使用。
  var foo = Foo();
  print(foo); // Instance of 'Foo<SomeBaseClass>'
  //等同于print(foo.toString());
  print(foo.toString()); // Instance of 'Foo<SomeBaseClass>'

  // 如果指定任何非SomeBaseClass类型会导致错误。
  // var foo2 = Foo<Object>;


}

abstract class SomeBaseClass {
  // 其他操作
}

class Foo<T extends SomeBaseClass> {
  String toString() {
    return "Instance of Foo<$T>";
  }
}

class Extender extends SomeBaseClass {
  //其他操作
}
