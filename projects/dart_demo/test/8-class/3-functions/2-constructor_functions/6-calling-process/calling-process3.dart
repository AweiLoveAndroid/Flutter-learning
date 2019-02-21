// 超类构造参数不能使用this关键字
class Test {
  num width;
  num height;
  num area;

  // 必须加上空参构造，如果注释掉 它的子类会报错
  Test() {
    print('Test 空参构造');
  }

  Test.area(width, height)
        : width = width,
          height = height,
          area = width * height {
  print('Test 有参构造');
  }

  // 超类构造参数不能使用this关键字
  // Test.area(this.width, this.height)
  //       : width = width,
  //         height = height,
  //         area = width * height {
  // print('Test 命名构造');
  // }

}

class TestChild extends Test {

  num width;
  num height;
  num area;

  TestChild() {
    print('TestChild 空参构造');
  }

  TestChild.area(num width, num height)
    : area = (width * height)/2 {
    print('TestChild 有参构造');
  }
}