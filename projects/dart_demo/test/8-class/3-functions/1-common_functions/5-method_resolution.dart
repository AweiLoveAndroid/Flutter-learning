// 语法作用域

bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      print('topLevel\r');
      print(topLevel);
      print('insideMain\r');
      print(insideMain);
      print('insideFunction\r');
      print(insideFunction);
      print('insideNestedFunction\r');
      print(insideNestedFunction);
    }

    // print('topLevel\r');
    // print(topLevel);
    // print('insideMain\r');
    // print(insideMain);
    // print('insideFunction\r');
    // print(insideFunction);

    // 调用函数nestedFunction
    nestedFunction();

  }

  // 调用函数myFunction
  myFunction();

  // print('topLevel\r');
  // print(topLevel);
  // print('insideMain\r');
  // print(insideMain);
}

//函数只能打印它的外层以及它里面的变量，前提是要被调用
// main函数里面可以输出topLevel和insideMain的值。
// myFunction函数里面可以输出topLevel、insideMain和insideFunction的值。
// nestedFunction函数里面可以输出topLevel、insideMain、insideFunction和insideNestedFunction的值。