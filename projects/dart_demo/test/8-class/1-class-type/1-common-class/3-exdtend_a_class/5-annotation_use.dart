import '4-annotation_demo.dart';

void main(){
  doSomething();
}

// 以下是使用@todo注释的示例：
@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}