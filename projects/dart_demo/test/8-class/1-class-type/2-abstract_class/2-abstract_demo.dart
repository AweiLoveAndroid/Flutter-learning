// 隐式接口
void main() {
  print(sayHello(Person('李四'))); // 你好 张三. 我是 李四.
  print(sayHello(PersonImpl())); // 你好 张三  你知道我是谁吗？
}

// Person类 隐式接口包含hello()
class Person {
  // 在接口中，但是仅在此库中可见。
  final _name;

  // 不在接口中,因为这是一个构造函数
  Person(this._name);

  // 在接口中
  String hello(String who) => '你好 $who. 我是 $_name.';
}

// Person接口的实现
class PersonImpl implements Person {
  get _name => '';

  String hello(String name) => '你好 $name  你知道我是谁吗？';
}

String sayHello(Person person) => person.hello('张三'); 

// 一个类也可以实现多个接口，例如：
class ZhangSan implements Run,Life {
  //...
}
class Run {}
class Life {}