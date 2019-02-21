import 'dart:async';

void main(){
  lookUpVersion();  // 输出结果：lookUpVersion()同步方法 返回值是：1.0.0
  lookUpVersion2(); // 输出结果：lookUpVersion2()异步方法 返回值是：1.0.0
  lookUpVersion3(); // 输出结果：lookUpVersion3()异步方法 没有返回值
}


String lookUpVersion() {
  print('lookUpVersion()同步方法 返回值是：1.0.0');
  return '1.0.0';
}

// 返回值Future<String>
Future<String> lookUpVersion2() async {
  print('lookUpVersion2()异步方法 返回值是：1.0.0');
  return '1.0.0';
}

// 返回值Future<void>
Future<void> lookUpVersion3() async {
  print('lookUpVersion3()异步方法 没有返回值');
}