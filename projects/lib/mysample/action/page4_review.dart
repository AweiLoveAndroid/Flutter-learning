import 'package:flutter/material.dart';

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
      body: new CounterDiaplay(count: _count),
      floatingActionButton: new CounterIncrementer(
        onPressed: _increment,
      ),
    );
  }
}

// 简单的封装  计数显示
class CounterDiaplay extends StatelessWidget {
  CounterDiaplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('按钮点击 $count 次}'),
    );
  }
}

// 简单的封装  计数改变
class CounterIncrementer extends StatelessWidget {
  CounterIncrementer({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: onPressed,
      tooltip: '增加',
      child: new Icon(Icons.add),
    );
  }
}
