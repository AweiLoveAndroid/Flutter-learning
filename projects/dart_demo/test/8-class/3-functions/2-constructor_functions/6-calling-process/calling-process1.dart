// 构造函数调用流程
void main() {
  // Test 空参构造
  // TestChild 有参构造
  // 面积为：6.0
  var result = new TestChild.area(3, 4);
  print('面积为：${result.area}');
}

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