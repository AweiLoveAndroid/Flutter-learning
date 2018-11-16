import 'package:flutter/material.dart';

// 发送路由并接收返回的数据
void main() {
  runApp(
    MaterialApp(
      title: 'Flutter发送路由并返回数据Demo',
      home: HomePage(),
    ),
  );
}

// 页面A
// 我们去掉MyHomePage 直接在body属性里面声明具体组件，看看效果
class HomePage extends StatelessWidget {
  // 要发送出去的数据源
  final List<String> datas = ["橘子", "苹果", "香蕉", "柚子"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter发送路由并返回数据Demo',
          style: new TextStyle(fontSize: 15),
        ),
      ),
      body: new RaisedButton(
        color: Colors.teal,
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
        child: Text('跳转到下一个页面'),
      ),
    );
  }

  // 封装函数用来发送路由和接收路由返回的数据
  _navigateAndDisplaySelection(BuildContext context) async {
    // 获取路由返回的数据
    final result = await Navigator.push(
      context,
      // 通过路由把数据发给另一个页面
      MaterialPageRoute(builder: (context) => MyApp(data: datas)),
    );

    // 把收到的数据用SnackBar显示出来
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
  }
}

// 页面A
//class MyHomePage extends StatelessWidget {
//  // 要发送出去的数据源
//  final List<String> datas = ["橘子", "苹果", "香蕉", "柚子"];
//
//  @override
//  Widget build(BuildContext context) {
//    return RaisedButton(
//      color: Colors.teal,
//      onPressed: () {
//        _navigateAndDisplaySelection(context);
//      },
//      child: Text('跳转到下一个页面'),
//    );
//  }
//
//  // 封装函数用来发送路由和接收路由返回的数据
//  _navigateAndDisplaySelection(BuildContext context) async {
//    // 获取路由返回的数据
//    final result = await Navigator.push(
//      context,
//      // 通过路由把数据发给另一个页面
//      MaterialPageRoute(builder: (context) => MyApp(data: datas)),
//    );
//
//    // 把收到的数据用SnackBar显示出来
//    Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
//  }
//}

// 页面B
class MyApp extends StatelessWidget {
  final List<String> data;

  MyApp({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tempData = "";

    data.forEach((String data) {
      tempData += data;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "来自于页面A的数据：$tempData",
          style: new TextStyle(fontSize: 15),
        ),
      ),
      body: new RaisedButton(
        onPressed: () {
          Navigator.pop(context, 'Tips：页面B返回的数据');
        },
        child: Text('点击返回并传递数据给页面A'),
      ),
    );
  }
}
