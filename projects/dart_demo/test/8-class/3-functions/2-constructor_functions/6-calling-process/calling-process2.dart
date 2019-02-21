void main(){
  // Test.area 命名函数，data: TestChild的数据 getDefaultData
  // TestChild 空参函数 调用父类的命名构造
  new TestChild();
}

class Test{
  static String data;
  Test() {
    print('Test 空参构造，data: $data');
  }

  Test.area(String datas) {
    print('Test.area 命名函数，data: $datas');
  }
}

class TestChild extends Test {
  // 参数可以是一个表达式
  TestChild() : super.area(getDefaultData()) {
    print('TestChild 空参函数 调用父类的命名构造');
  }

  static String getDefaultData(){
    return 'TestChild的数据 getDefaultData';
  }
}