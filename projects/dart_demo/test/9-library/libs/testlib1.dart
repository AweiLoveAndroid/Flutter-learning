// 关于part  和 part of
// 1. 不能同时使用library和part of，它们用于指定属于库的内容。
// 1. B库是A库的一部分表示：part of A库名称
// 2. 如果B库声明A库的一部分，同时A库也想声明它的一部分是B库，正确写法：
//    必须是A库写了part 'B库的路径'  同时B库声明part of A库名称。
//    这种情况下，某一边没有声明的话，就会报错。


// 第1个库：
library testlib1;

// 可以不写
part 'testlib2.dart';


void run() {
  print('testlib1库 ： run()函数');
}
