import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Demo2',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Demo2(),
    ),
  );
}

class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              Navigator.of(context).pop();
            }),
        title: new Text('Demo2'),
      ),
      body: new Center(
        child: new Text('hello world  2'),
      ),
    );
  }
}
