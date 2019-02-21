// 工厂构造函数
void main() {
  //Test('abc').test();

  var a = new Test('abc');
  var b = new Test('abc');

  // 检查两个是否引用的相同的对象
  print(identical(a, b)); // true

  new Test('abc').test();

  print(new Singleton() == new Singleton());
  print(identical(new Singleton(), new Singleton()));

  // Cat cat = new Animal('cat');
  // Dog dog = new Animal('dog');
  // Animal animal = new Animal('haha');
}

class Test {
  final String name;
  static Map<String, Test> _cache = new Map<String, Test>();

  factory Test(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final symbol = new Test._internal(name);
      _cache[name] = symbol;
      return symbol;
    }
  }

  Test._internal(this.name);

  void test(){
    print('调用了test()');
  }
}


/////////////  factory实现的单例  /////////////
class Singleton {
  factory Singleton() => const Singleton._internal_();
  const Singleton._internal_();
}


/////////////  实际开发可能这么使用  /////////////////////////

abstract class Animal {
  factory Animal(String type) {
    switch (type) {
      case "cat":
        return new Cat();
      case "dog":
        return new Dog();
      default:
        throw Exception("输入的类型： '$type' 不是动物");
    }
  }
}

class Cat implements Animal {
  Cat() {
    print('猫');
  }
}

class Dog implements Animal {
  Dog() {
    print('狗');
  }
}
