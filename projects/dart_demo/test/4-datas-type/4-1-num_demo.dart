void main() {
  test1();
  test2();
}

// int 示例
void test1() {
  int intNum1 = 10;
  print(intNum1); //结果是10
  int intNum2 = 0xDEADBEEF;
  print(intNum2); //结果是3735928559

  // bitLength 返回存储此int整数所需的最小位数
  int a1 = 1; // 占了1个bit     相当于二进制数字 00000000 00000001
  int a2 = 12; // 占了4个bit    相当于二进制数字 00000000 00001100
  int a3 = 123; // 占了7个bit   相当于二进制数字 00000000 01111011
  int a4 = 1234; // 占了11个bit 相当于二进制数字 00000100 11010010
  print('${a1.bitLength}'); //  1
  print('${a2.bitLength}'); // 4
  print('${a3.bitLength}'); // 7
  print('${a4.bitLength}'); // 11
}

// double示例
void test2() {
  double doubleNum1 = 1.1;
  print(doubleNum1); //结果是1.1
  double doubleNum2 = 1.42e5;
  print(doubleNum2); //结果是142000.0

  // int自动转double
  double test = 12; //打印结果是12.0
  print(test); //打印结果是12.0

  // 使用int的api转double
  int test2 = 10;
  print(test2.toDouble()); // 结果是： 10.0

  // double转int
  double test3 = 15.1;
  double test4 = 15.1234;
  print(test3.toInt()); // 结果是15
  print(test4.toInt()); // 结果是15
}
