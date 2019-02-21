// 当看到用typedef定义函数别名的时候，不自觉的想到了函数指针

void main(){

	// 3. main函数里面使用Demo类，给mFunction参数传入一个函数

  int test(Object a, Object b) => 0;

  Demo demo = Demo(test);
  print(demo.funs is Function); // true
  print(demo.funs is Demo); // false

}


// 1.给Function取一个别名叫做TypedefFuns
typedef TypedefFuns = int Function(Object a, Object b);


// 2.  Demo类里的构造方法使用这个别名
class Demo {
  TypedefFuns funs;
  Demo(this.funs);
}




// Flutter源码FloatingActionButton里面的typedef使用
// final VoidCallback onPressed;

// class FloatingActionButton{
//     const FloatingActionButton({this.onPressed,String name});
// }

// get set可以不要
// VoidCallback get onMetricsChanged => _onMetricsChanged;
// VoidCallback _onMetricsChanged;

// set onMetricsChanged(VoidCallback callback) {
//   _onMetricsChanged = callback;
// }
