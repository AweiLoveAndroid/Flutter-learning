void main() {
  test1();
  test2();
}

// 创建
void test1() {
  // 直接声明
  Map companys = {'first': '阿里巴巴', 'second': '腾讯', 'fifth': '百度'};
  print(companys); //打印结果 {first: 阿里巴巴, second: 腾讯, fifth: 百度}

  Map companys1 = new Map();
  companys1['first'] = '阿里巴巴';
  companys1['second'] = '腾讯';
  companys1['fifth'] = '百度';
  print(companys1); //打印结果 {first: 阿里巴巴, second: 腾讯, fifth: 百度}

  final fruitConstantMap = const {2: 'apple', 10: 'orange', 18: 'banana'};
  print(fruitConstantMap); // {2: apple, 10: orange, 18: banana}
}

// 增删改查
void test2() {
  Map companys = {'first': '阿里巴巴', 'second': '腾讯', 'fifth': '百度'};

  //添加一个新的元素，key为“5”，value为“华为”
  companys[5] = '华为';
  print(companys); //打印结果 {first: 阿里巴巴, second: 腾讯, fifth: 百度, 5: 华为}

  // 修改元素
  companys['first'] = 'alibaba';
  print(companys); //打印结果 {first: alibaba, second: 腾讯, fifth: 百度, 5: 华为}

  // 查询元素
  bool mapKey = companys.containsKey('second');
  bool mapValue = companys.containsValue('百度');
  print(mapKey); //结果为：true
  print(mapValue); //结果为：true

  // 删除元素
  companys.remove('first'); // 移除key为“first”的元素。
  print(companys); // 打印结果{second: 腾讯, fifth: 百度, 5: 华为}

  companys.clear(); // 清空map集合的数据。
  print(companys); // 打印结果{}
}
