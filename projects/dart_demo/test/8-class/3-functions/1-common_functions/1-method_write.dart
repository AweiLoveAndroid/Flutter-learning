// 函数的简写

// 1.对于只有一个表达式的函数，可以简写
// 操作前：
// void main(){
//   runApp(new MyApp());
// }
// 操作后：（main.dart文件里面默认使用的是==>箭头符号）
// 箭头符号
// void main() => runApp(new MyApp());

// 2. 返回值为void时，可以省略void关键字
void main() {

  // 函数属于Funtion类型
  assert(_incrementCounter() is Function);
}

// 省略前
// void _incrementCounter() {
     //TODO:...
// }

// 省略后
_incrementCounter() {
  //TODO:...
}


