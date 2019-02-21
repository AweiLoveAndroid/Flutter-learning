// 对象类型
void main(){
  var a = 10;
  var b = 10.0;
  var c = '10';
  var d = true;
  var e = [12.5,13.1];
  var f = {3:'5',5:'11'};
  var t = new Test();
  print('a 的类型是： ${a.runtimeType}'); // a 的类型是： int
  print('b 的类型是： ${b.runtimeType}'); // b 的类型是： double
  print('c 的类型是： ${c.runtimeType}'); // c 的类型是： String
  print('d 的类型是： ${d.runtimeType}'); // d 的类型是： bool
  print('e 的类型是： ${e.runtimeType}'); // e 的类型是： List<double>
  print('f 的类型是： ${f.runtimeType}'); // f 的类型是： _InternalLinkedHashMap<int, String>
  print('t 的类型是： ${t.runtimeType}'); // t 的类型是： Test

}
class Test{
}