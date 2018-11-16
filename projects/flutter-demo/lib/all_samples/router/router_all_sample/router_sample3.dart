import 'package:flutter/material.dart';

// 通过路由将数据传递给另一个页面
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
  final List<String> datas = ["橘子", "苹果", "香蕉", "柚子"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter 路由Demo')),
      body: new RaisedButton(
        color: Colors.teal,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              // 路由跳转 并向新页面传递数组
              builder: (context) => MyApp(data: datas),
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
  final List<String> data;

  MyApp({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tempData = "";

    data.forEach((String data) {
      tempData += data;
    });

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(tempData),
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
