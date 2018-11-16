import 'package:flutter/material.dart';

// 发送路由，并接收从其他页面返回数据
void main() {
  runApp(
    MaterialApp(
      title: 'Flutter发送路由并返回数据Demo',
      home: HomePage(),
    ),
  );
}

// 页面A
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter发送路由并返回数据Demo',
          style: new TextStyle(fontSize: 15),
        ),
      ),
      body: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.teal,
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('跳转到下一个页面'),
    );
  }

  // 封装函数用来发送路由和接收路由返回的数据
  _navigateAndDisplaySelection(BuildContext context) async {
    // 获取路由返回的数据
    final result = await Navigator.push(
      context,
      // 通过路由把数据发给另一个页面
      MaterialPageRoute(builder: (context) => MyApp()),
    );

    // 把收到的数据用SnackBar显示出来
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
  }
}

// 页面B
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "页面2",
          style: new TextStyle(fontSize: 15),
        ),
      ),
      body: new RaisedButton(
        onPressed: () {
          Navigator.pop(context, '这是页面B给页面A发的数据');
        },
        child: Text('点击返回到页面A'),
      ),
    );
  }
}
