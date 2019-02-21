import 'dart:async';

void main(){
  checkVersion();
}

Future checkVersion() async {
  var version = await lookUpVersion();
  // 其他操作
}

void lookUpVersion(){
  // 逻辑...
}