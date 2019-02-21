////// 重写运算符  ///////

void main() {
  final a = Testoperator(2, 3);
  final b = Testoperator(2, 2);
  var num1 = Testoperator(4, 5);
  var num2= Testoperator(0,1);
  print(a + b == num1); // true
  print(a - b == num2); // true

}

////// 重写+ 和 - 运算符  ///////
class Testoperator {
  final int x, y;

  Testoperator(this.x, this.y);

  Testoperator operator +(Testoperator o) => Testoperator(x + o.x, y + o.y);
  Testoperator operator -(Testoperator o) => Testoperator(x - o.x, y - o.y);

  // Operator == and hashCode not shown. For details, see note below.
  // ···

  // Override hashCode using strategy from Effective Java, Chapter 11.
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + x.hashCode;
    result = 37 * result + y.hashCode;
    return result;
  }

  // You should generally implement operator == if you override hashCode.
  @override
  bool operator ==(dynamic other) {
    if (other is! Testoperator) return false;
    Testoperator person = other;
    return (person.x == x && person.y == y);
  }
}