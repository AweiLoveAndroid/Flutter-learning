void main() {
  new Test1(4, 3);
  Map<String, num> json = {
    'a': 1,
    'b': 5,
    'c': 12,
  };

  new Test2.from(json);
}


// 有参构造初始化
class Test1 {
  var x, y;
  Test1(var x, var y)
      : x = x,
        y = y {
    print('Test1 有参构造初始化');
  }
}

// 命名构造的初始化
class Test2 {
  var x, y;

  Test2.from(Map<String, num> json)
      : x = json['x'],
        y = json['y'] {
    print('Test2.from(): ($x, $y)');
  }
}