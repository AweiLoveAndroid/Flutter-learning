import 'package:flutter/material.dart';

/// 堆叠视图
void main() {
  runApp(new MaterialApp(
    title: '',
    theme: new ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: new StackDemo(),
  ));
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: new Center(
        child: new Stack(
          children: <Widget>[
            new Image.network(
              'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
              scale: 2.0,
            ),
            new Positioned(
              left: 10.0,
              right: 10.0,
              top: 10.0,
              child: new Text(
                '这是上层的布局',
                style: new TextStyle(
                  fontSize: 35.0,
                  color: Colors.deepOrange,
                  fontFamily: 'serif',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
