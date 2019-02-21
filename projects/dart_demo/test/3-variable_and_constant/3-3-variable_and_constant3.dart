// 3. final 和  const  示例
void main() {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
}

void test1() {
  //可以省略类型声明
  final name1 = "张三";
  //final String name1  = "张三";
  const name2 = "李四";
  //const String name2 = "李四"
}

void test2() {
  //这样写都会报错
  //final var name1 = "张三";
  //const var name2 = "李四";
}

void test3() {
  final name1 = "张三";
  // 如果这样写，编译器提示：a final variable, can only be set once
  // 一个final变量，只能被设置一次。
  //name1 = "zhangsan";

  const name2 = "李四";
  // 这样写，编译器提示：Constant variables can't be assigned a value
  // const常量不能赋值
  // name2 = "lisi";
}

// 运算
void test4() {
  const units = 60; //（单位: s/min）
  const seconds1 = units * 20; //秒数=60*分钟数 结果为：1200

  const minutes = 20; //20分钟
  const seconds2 = units * minutes; //秒数=60*分钟数 结果为：1200

  final speed1 = 100; //速度（km/h）
  final double distance1 = speed1 * 2.5; // 距离 = 速度*时间，结果为：250.0

  double time = 2.5;
  final double distance2 = speed1 * time; // 距离 = 速度*时间，结果为：250.0
}

// const更多用法
void test5() {
  // const[]创建一个空的、不可变的列表（EIL）
  var varList = const []; // varList 当前是一个EIL
  final finalList = const []; // finalList一直是EIL
  const constList = const []; // constList 是一个编译时常量的EIL

  varList = ["haha"];

  // 不能更改final变量或const变量的值
  // 这样写，编译器提示：a final variable, can only be set once
  // finalList = ["haha"];

  // 这样写，编译器提示：Constant variables can't be assigned a value
  // constList = ["haha"];
}

// 常量字符串
void test6() {
  // 这些是常量字符串
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = '常量字符串';

  const validConstString = '$aConstNum $aConstBool $aConstString null';

  // 这些不是常量字符串
  var aNum = 0;
  var aBool = true;
  var aString = '这是String字符串';
  const aConstList = const [1, 2, 3];

  // const常量必须用const类型的值初始化。
  //这样用就会报错：Const variables must be initialized with a constant value
  // const invalidConstString = '$aNum $aBool $aString $aConstList';
}
