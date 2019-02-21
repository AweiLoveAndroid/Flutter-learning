// 第2个库
// 不能同时声明library 和 part of 冲突了。
// library testlib2;

// part of 表示这个库是testlib库的一部分
part of testlib1;


class testLib2 {

}

void start() {
  print('testlib2库 ： start()函数');
}
