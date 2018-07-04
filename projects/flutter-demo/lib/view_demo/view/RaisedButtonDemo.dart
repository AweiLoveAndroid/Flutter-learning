import 'package:flutter/material.dart';

/// RaisedButton 的基本使用
void main() {
  runApp(new MaterialApp(
    title: 'RaisedButton',
    theme: new ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: new RaisedButtonDemo(),
  ));
}

class RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RaisedButton'),
      ),
      body: new Center(
        //使子控件在其内部水平和垂直居中
        child: new Container(
          width: 300.0,
          height: 200.0,
          decoration: new BoxDecoration(
            color: Colors.pink,
            border: new Border.all(
              //设置Border属性给容器添加边框
              color: const Color(0xff6d9eeb), //为边框添加颜色
              width: 8.0, //边框宽度
            ),
          ),
          child: new RaisedButton(
            onPressed: null,
          ),
        ),
      ),
    );
  }
}
