void main() {
  test1('a123');
  test2();
  test3();
  misbehave();
  test4();

  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}

void test1(String num) {
  if (num.startsWith('a')) {
    print(num);
  } else {
    throw FormatException('格式化错误');
  }
}

void test2() => throw FormatException('格式化错误');

test3() {
//    try {
//     breedMoreLlamas();
// } on Exception {
//     buyMoreLlamas();
// }

// 也可以两个参数的catch
  try {
    // ···
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  }
}

breedMoreLlamas() {}
buyMoreLlamas() {}
cleanLlamaStalls() {}

void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // 运行时异常
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // 允许调用者查看exception.
  }
}

test4() {
  try {
    breedMoreLlamas();
  } finally {
    // 即使抛出异常  也会执行这句代码.
    cleanLlamaStalls();
  }
// 该finally子句在任何匹配的catch子句之后运行：
  try {
    breedMoreLlamas();
  } catch (e) {
    // 首先会处理异常
    print('Error: $e');
  } finally {
    // 然后执行这句语句
    cleanLlamaStalls();
  }
}
