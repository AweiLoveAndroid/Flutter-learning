// 可调用的类（Callable Class）
void main() {
    var test = new Test();
    var result = test(166.6665,"Flutter真好玩",672);
print("$result");// 666.666 Flutter真好玩 666
}
class Test {
    // 必须是call函数
    call(double a, String b, int c) => '${a*4} ${b} ${c-6}';
}