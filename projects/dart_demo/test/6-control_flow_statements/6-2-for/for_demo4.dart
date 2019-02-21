import 'dart:math';

void main() {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
}

test1() {
  // 返回具有最小总和的内部列表（正整数）。
  /// Returns the inner list (of positive integers) with the smallest sum.
  List<int> smallestSumList(List<List<int>> lists) {
    var smallestSum = 0xFFFFFFFF; //已知list的总和较小。
    var smallestList = null;
    outer: // 这就是标记
    for (var innerList in lists) {
      var sum = 0;
      for (var element in innerList) {
        assert(element >= 0);
        sum += element;
        // 无需继续迭代内部列表。它的总和已经太高了。
        if (sum > smallestSum) continue outer; // continue 跳出到标记处(outer)
      }
      smallestSum = sum;
      smallestList = innerList;
    }
    return smallestList;
  }
}

test2() {
  // 计算第一个非空list
  List<int> firstListWithNullValueList(List<List<int>> lists) {
    var firstListWithNullValues = null;
    outer:
    for (var innerList in lists) {
      for (var element in innerList) {
        if (element == null) {
          firstListWithNullValues = innerList;
          break outer; // break 返回到标记处
        }
      }
    }
    // 现在继续正常的工作流程
    if (firstListWithNullValues != null) {
      // ...
    }
    return firstListWithNullValues;
  }
}

test3() {
  void doSomethingWithA(A a) {
    errorChecks:
    {
      if (a.hasEntries) {
        for (var entry in a.entries) {
          if (entry is Bad) break errorChecks; // 跳出代码块
        }
      }
      if (a.hasB) {
        var b = new A.b();
        if (b.inSomeBadState()) break errorChecks; // 跳出代码块
      }
      // 一些看起来都正常
      use(a);
      return;
    }
    // 错误的情况，执行这里的代码：
    print("something bad happened");
  }
}

// 这两者是对等的
test4() {
  // 使用 continue
  for (int i = 0; i < 10; i++) {
    if (i.isEven) continue;
    print(i);
  }

// 使用 break.
  for (int i = 0; i < 10; i++) {
    labels:
    {
      // isEven 当且仅当该整数为偶数时才返回true
      if (i.isEven) break labels;
      print(i);
    }
  }
}

test5() {
  void switchExample(int foo) {
    switch (foo) {
      case 0:
        print("foo is 0");
        break;
      case 1:
        print("foo is 1");
        continue shared; // Continue使用在被标记为shared的子句中
      shared:
      case 2:
        print("foo is either 1 or 2");
        break;
    }
  }
}

test6() {
  int age = 0;
  int hungry = 0;
  int tired = 0;

  bool seesSquirrel() => new Random().nextDouble() < 0.1;
  bool seesMailman() => new Random().nextDouble() < 0.1;

  switch (1) {
    start:
    case 0:
      print("dog 方法已经开始");
      print('case 0 ==> age: $age');
      print('case 0 ==> hungry: $hungry');
      print('case 0 ==> tired: $tired');
      continue doDogThings;

    sleep:
    case 1:
      print("sleeping");
      tired = 0;
      age++;
      if (age > 20) break;
      print('case 1 ==> age: $age');
      print('case 1 ==> hungry: $hungry');
      print('case 1 ==> tired: $tired');
      continue doDogThings;

    doDogThings:
    case 2:
      if (hungry > 2) continue eat;
      if (tired > 3) continue sleep;
      if (seesSquirrel()) continue chase;
      if (seesMailman()) continue bark;
      print('case 2 ==> age: $age');
      print('case 2 ==> hungry: $hungry');
      print('case 2 ==> tired: $tired');
      continue play;

    chase:
    case 3:
      print("chasing");
      hungry++;
      tired++;
      print('case 3 ==> age: $age');
      print('case 3 ==> hungry: $hungry');
      print('case 3 ==> tired: $tired');
      continue doDogThings;

    eat:
    case 4:
      print("eating");
      hungry = 0;
      print('case 4 ==> age: $age');
      print('case 4 ==> hungry: $hungry');
      print('case 4 ==> tired: $tired');
      continue doDogThings;

    bark:
    case 5:
      print("barking");
      tired++;
      print('case 5 ==> age: $age');
      print('case 5 ==> hungry: $hungry');
      print('case 5 ==> tired: $tired');
      continue doDogThings;

    play:
    case 6:
      print("playing");
      tired++;
      hungry++;
      print('case 6 ==> age: $age');
      print('case 6 ==> hungry: $hungry');
      print('case 6 ==> tired: $tired');
      continue doDogThings;
  }
}

class A {
  bool hasEntries = false;
  bool hasB = true;
  List<Bad> entries = [new Bad2(), new Bad2()];
  A.b() {}

  bool inSomeBadState() {
    return false;
  }
}

void use(A a) {}

abstract class Bad {}

class Bad1 extends Bad {}

class Bad2 extends Bad {}
