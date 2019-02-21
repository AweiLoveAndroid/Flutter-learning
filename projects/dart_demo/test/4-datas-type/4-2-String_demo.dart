// String示例
void main() {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
}

void test1() {
  String str1 = '单引号基本使用demo.';
  String str2 = "双引号基本使用demo.";
}

void test2() {
  //单引号里面嵌套单引号，必须在前面加反斜杠
  String str3 = '双引号里面有单引号it\'s，必须在前面加反斜杠.';
  //双引号里面嵌套单引号（正常使用）
  String str4 = "双引号里面有单引号it's.";
  //单引号里面嵌套双引号（正常使用）
  String str5 = '单引号里面有双引号，"hello world"';
  //双引号里面嵌套双引号，必须在前面加反斜杠
  String str6 = "双引号里面有双引号，\"hello world\"";

  print(str3); // 双引号里面有单引号it's，必须在前面加反斜杠.
  print(str4); // 双引号里面有单引号it's.
  print(str5); // 单引号里面有双引号，hello world"
  print(str6); //双引号里面有双引号，"hello world"
}

void test3() {
  // 这个会报错
  //String blankStr1 = 'hello''''world';
  // 这两个运行正常
  String blankStr2 = 'hello' ' ' 'world'; //结果： hello world
  String blankStr3 = 'hello' '_' 'world'; //结果： hello_world

  // 这个会报错
  //String blankStr4 = "hello""""world";
  // 这两个运行正常
  String blankStr5 = "hello" " " "world"; //结果： hello world
  String blankStr6 = "hello" "_" "world"; //结果： hello_world

  //单引号里面有双引号，混合使用运行正常
  String blankStr7 = 'hello""""world'; //结果： hello""""world
  String blankStr8 = 'hello"" ""world'; //结果： hello"" ""world
  String blankStr9 = 'hello""_""world'; //结果： hello""_""world

  //双引号里面有单引号，混合使用运行正常
  String blankStr10 = "hello''''world"; //结果： hello''''world
  String blankStr11 = "hello'' ''world"; //结果： hello'' ''world
  String blankStr12 = "hello''_''world"; //结果： hello''_''world
}

// 字符串拼接
void test4() {
  String connectionStr1 = '字符串连接' '甚至可以在' '换行的时候进行。';
  print(connectionStr1); // 字符串连接甚至可以在换行的时候进行。

  String connectionStr2 = '字符串连接' + '甚至可以在' + '换行的时候进行。';
  print(connectionStr2); // 字符串连接甚至可以在换行的时候进行。

  String connectionStr3 = ''' 
    这是用单引号创建的
    多行字符串。
    ''';
  print(connectionStr3);

  String connectionStr4 = """这是用双引号创建的
    多行字符串。""";
  print(connectionStr4);
}

// 转义字符
void test5() {
  print(r"换行符：\n"); //这个结果是 换行符：\n
  print("换行符：\\n"); //这个结果是 换行符：\n
  print("换行符：\n"); //这个结果是 换行符
}

void test6() {
  var height = 48.0;
  print('当前标题的高度是$height'); //当前标题的高度是48.0

  String name = "张三";
  print("$name" + "是我们的部门经理"); // 张三是我们的部门经理

  String replaceStr = 'Android Studio';
  assert('你知道' + '${replaceStr.toUpperCase()}' 
      + '最新版本是多少吗？' ==
      '你知道ANDROID STUDIO最新版本是多少吗？');
}
