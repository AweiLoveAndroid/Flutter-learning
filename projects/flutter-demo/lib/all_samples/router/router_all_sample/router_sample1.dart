import 'package:flutter/material.dart';

// 使用Navigator.push实现发送路由，Navigator.pop返回上一个页面。
void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter 路由Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter 路由Demo')),
      body: new RaisedButton(
        color: Colors.teal,
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new MyApp(),
            ),
          );
        },
        child: new Text(
          '跳转到下一个页面',
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter 路由Demo'),
      ),
      body: new RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: new Text('返回上一个页面'),
      ),
    );
  }
}
