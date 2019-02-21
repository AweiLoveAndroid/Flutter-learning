// 借鉴js的闭包的5种方式  来聊聊闭包在Dart中的使用
void main() {
  var result = test();
  print(result(2.0));
  // 变量作用域为函数内部，外部无法访问
  // print(result.PI);

  //外部要访问方法内部的变量，可以使用闭包
  var result2 = test2();
  print(result2());
}

//js闭包写法
// var Circle = new Function(
//   "this.PI = 3.14;
//   this.area = function( r ) {
//     return r*r*this.PI;
//     }"
// );

// 转换成Dart语言就是这样的：
// 内部函数为有参数的匿名函数示例：
Function test() {
  const PI = 3.14;
  return (double r) => r * r * PI;
}

// 内部函数为无参数的匿名函数示例：
Function test2() {
  const PI = 3.14;
  return () => PI;
}

