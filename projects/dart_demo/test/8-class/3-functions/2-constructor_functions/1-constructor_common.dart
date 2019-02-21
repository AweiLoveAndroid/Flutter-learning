
// 最常见的构造函数形式
void main(){
  new Test(3, 4); // x:3, y:4
}

class Test {
  num x, y;

  Test(num x, num y) {
    this.x = x;//this.x指向的是当前Test类里面的变量num x
    this.y = y;
    print('x:$x, y:$y');
  }
}