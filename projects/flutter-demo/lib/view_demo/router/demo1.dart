import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Demo1',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Demo1(),
    ),
  );
}

class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: new Text('Demo1'),
      ),
      body: new Center(
        child: new Text('hello world'),
      ),
    );
  }
}
