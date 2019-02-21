
// 所有实例变量都生成一个隐式getter方法
// 非final实例变量也会生成隐式setter方法
void main() {
    var point = Point();
    point.x = 4; // Use the setter method for x.
    assert(point.x == 4); // Use the getter method for x.
    assert(point.y == null); // Values default to null.

    var point2 = Point2();
    point2.x = 4; // 
}


class Point {
    num x;
    num y;
}

class Point2 {
  num x = 10;
  num y = 5;
  Point2 p = new Point2();//p在构造函数之前执行
  Point2(){}
}
