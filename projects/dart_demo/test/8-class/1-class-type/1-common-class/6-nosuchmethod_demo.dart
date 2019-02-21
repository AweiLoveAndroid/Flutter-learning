/////////// 重写 noSuchMethod    ////////////////

void main() {
  TestMethod test = new TestMethod();
  dynamic f = test.foo;
  // Invokes `Object.noSuchMethod`, not `TestMethod.noSuchMethod`, so it throws.
  f(42);
}


class TestMethod {
  // 除非你重写noSuchMethod，否则使用不存在的成员会导致NoSuchMethodError
  @override
  dynamic noSuchMethod(Invocation i) {
    print('You tried to use a non-existent member: ' +
        '${i.memberName}');
  }

  dynamic foo();
}