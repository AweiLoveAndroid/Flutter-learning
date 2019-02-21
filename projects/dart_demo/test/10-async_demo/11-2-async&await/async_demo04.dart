import 'dart:async';

// 要在应用程序的main()函数中使用await，main()方法必须标记为async

// 结果：
// checkVersion()
// lookUpVersion()
// lookUpVersion()
// In main: version is 版本号：v1.0
Future main() async {
  checkVersion();
  print('In main: version is ${await lookUpVersion()}');
}

Future checkVersion() async {
  print('checkVersion()');
  var version = await lookUpVersion();
}

Future<String> lookUpVersion() async{
  print('lookUpVersion()');
  return '版本号：v1.0';
}