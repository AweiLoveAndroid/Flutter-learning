import 'package:flutter/material.dart';

/// 交互
void main() {
  runApp(new MaterialApp(
    title: '交互',
    home: new Counter(),
  ));
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0; //计数

  void _increment() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('交互'),
      ),
      body: new Center(
        child: new Text('按钮点击 $_count 次}'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _increment,
        tooltip: '增加',
        child: new Icon(Icons.add),
      ),
    );
  }
}
