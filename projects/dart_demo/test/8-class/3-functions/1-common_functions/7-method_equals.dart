//函数也是对象

void topMethod() {} // 一个顶级函数

class Demo {
  static void staticMethod() {} //一个静态方法
  void caseMethod() {} //实例方法
}

void main() {
  var compareVar;

  // 比较顶级的函数
  compareVar = topMethod;
  print(topMethod == compareVar);

  // 比较静态方法
  compareVar = Demo.staticMethod;  
  print(Demo.staticMethod == compareVar);

  // 比较实例方法
  var demo1 = Demo(); // Demo类的实例1
  var demo2 = Demo(); // Demo类的实例2
  var y = demo2;
  compareVar = demo2.caseMethod;

  //这些闭包指向同一个实例demo2，所以它们相等。
  print(y.caseMethod == compareVar);

  //这些闭包是指不同的实例，所以他们不平等。
  print(demo1.caseMethod != demo2.caseMethod);
}