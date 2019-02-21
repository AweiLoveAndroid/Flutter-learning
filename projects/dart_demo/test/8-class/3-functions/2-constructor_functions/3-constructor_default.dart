// 空参构造
void main() {
  new Test();
}

class Test {

  // 如果不写 默认就是空参构造
  Test() {
    print('默认构造函数');
  }

}
