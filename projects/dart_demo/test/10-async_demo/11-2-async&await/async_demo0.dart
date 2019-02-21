import 'dart:async';

// async延迟功能
main() {
  foo(499).then(print);
  print("after foo call");
}


Future<int> foo(x) async {
  print(x);
  return x + 1;
}

