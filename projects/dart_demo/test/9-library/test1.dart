// 普通导入库
// import 'libs/mylib.dart';

/////////////////////////////////////////

// test2.dart 和 test3.dart都有相同的hello()函数,这样写会报错
// import 'test2.dart';
// import 'test3.dart';
// 解决方案：给导入的库指定一个前缀 方便识别
// import 'test2.dart';
// import 'test3.dart' as test3;

/////////////////////////////////////////

// 仅导入mylib.dart里面的test2函数
// import 'libs/mylib.dart' show test2;

// 刚好和show相反 除了test2函数之外  其它的都导入
// import 'libs/mylib.dart' hide test2;
//我们想导入mylib库，但是不想用里面的otherLib这个库 可以这样写
// import 'libs/mylib.dart' hide otherLib;

/////////////////////////////////////////

// 延迟导入的前缀
// 当我们import一个库的时候，如果使用了as 不能同时使用deferred as
import 'libs/mylib.dart' deferred as tests;
import 'dart:async';

void main() {
  // hello();
  // test3.hello();

  hello();

}

// 延迟导入的函数 需要使用loadLibrary
Future hello() async {
  await tests.loadLibrary();
  tests.test2();
}
