import 'package:flutter/material.dart';

// 使用命名路由进行导航
void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter 路由Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(),
      initialRoute: '/page_one',
      routes: {
        '/page_one': (context) => new MyHomePage(),
        '/jump_page_two': (context) => new MyApp(),
      },
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
          Navigator.pushNamed(context, '/jump_page_two');
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
