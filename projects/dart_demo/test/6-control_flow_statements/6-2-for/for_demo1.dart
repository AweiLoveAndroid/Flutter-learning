void main() {
  for (int i = 0; i < 10; i++) {
    print(i);
  }

// for循环内部的闭包获取索引的值。
  var array = [];
  for (var i = 0; i < 10; i++) {
    array.add(() => print(i));
  }
}
