// 匿名函数
void main() {
  void _incrementCounter() {
    //setState函数就用到了匿名函数
//   setState(() {
//     _counter++;
//   });
  }

  //
  List list = [10, 7, 23];
  list.forEach((item) {
    print('$item');
  });

  list.forEach((item) => print('$item'));
}