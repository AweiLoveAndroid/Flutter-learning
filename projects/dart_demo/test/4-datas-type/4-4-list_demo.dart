void main() {
  test();
  test2();
}

void test() {
  //创建一个int类型的list
  List list = [10, 7, 23];
  print(list); // 输出结果  [10, 7, 23]

  // 要创建一个编译时常量const的list
  List constantList = const [10, 3, 15];
  print(constantList); // 输出结果  [10, 3, 15]
}

void test2() {
  //把数字1添加到list中，默认是添加到末尾
  List list = [10, 7, 23];
  list.add(1);
  print(list); // 输出结果  [10, 7, 23, 1]

  //移除数字1
  list.remove(1);
  print(list); // 输出结果  [10, 7, 23]

  //在索引为0的地方插入数字5
  list.insert(0, 5);
  print(list); // 输出结果  [5, 10, 7, 23]

  //查找10在list中的索引
  int value = list.indexOf(10);
  print(value); // 输出结果 1

  //查找list中是否包含数字5
  bool result = list.contains(5);
  print(result);// 输出结果  true

}
