// 泛型 demo
void main() {
  var names = List<String>();
  names.addAll(['Seth', 'Kathy', 'Lars']);
  // 报错 The argument type 'int' can't be assigned to the parameter type 'String'.
  // names.add(42);

  // 使用泛型以前的调用方式
  print(new Test1().getByKey('123'));
  print(new Test2().getByKey('456'));
  // 使用泛型之后的调用方式
}

// 使用泛型以前
abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

class Test1 extends ObjectCache {
  @override
  Object getByKey(String key) {
    return 'object cache';
  }

  @override
  void setByKey(String key, Object value) {
    return null;
  }
}

class Test2 extends StringCache {
  @override
  String getByKey(String key) {
    return 'String cache';
  }

  @override
  void setByKey(String key, String value) {
    return null;
  }
}

// 使用泛型来减少代码重复
abstract class Cache<T> {
  T getByKey(T key);
}

class Test3 extends Cache<String> {
  @override
  String getByKey(String key) {
    // TODO: implement getByKey
    return null;
  }
}
