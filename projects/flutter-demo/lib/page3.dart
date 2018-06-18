import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 本demo 来源于： https://blog.csdn.net/column/details/13593.html?&page=4
/// 事件的操作，另外这里引入了toast库
void main() {
  runApp(new MaterialApp(
    title: 'MaterialApp',
    theme: new ThemeData(
      primaryColor: Colors.red, //设置appbar主题
      primarySwatch: Colors.deepOrange, //设置全局主题
    ),
    home: new MyGestureDetector(),
  ));
}

/// 手势操作
class MyGestureDetector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton被监听了！');
        Fluttertoast.showToast(
          msg: "MyButton被监听了！ short toast",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.deepOrange,
        ),
        child: new Center(
          child: new Text('点击监听'),
        ),
      ),
    );
  }
}
