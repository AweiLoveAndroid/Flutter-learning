import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Demo3',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new Demo3(),
    ),
  );
}

class Demo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent,
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              Navigator.of(context).pop();
            }),
        title: new Text('Demo3'),
      ),
      body: new Center(
        child: new Text('hello world  3'),
      ),
    );
  }
}
