import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Demo4',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: new Demo4(),
    ),
  );
}

class Demo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple,
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              Navigator.of(context).pop();
            }),
        title: new Text('Demo4'),
      ),
      body: new Center(
        child: new Text('hello world  4'),
      ),
    );
  }
}
