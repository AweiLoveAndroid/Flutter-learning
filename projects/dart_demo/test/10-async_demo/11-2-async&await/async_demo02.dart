import 'dart:async';

void main() {
  checkVersion();
}

Future checkVersion() async {
  try {
    var version = await lookUpVersion();
  } catch (e) {
    // 这里可以看到是什么错误。
  } finally {
    // 正确的解决方式写在这里
  }
}

void lookUpVersion() {
  // 逻辑...
}
