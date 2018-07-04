import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: '横向ListView',
      theme: new ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: new ListViewHorizontalDemo(),
    ),
  );
}

class ListViewHorizontalDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: new Text(
          '横向ListView',
          style: new TextStyle(fontSize: 17.0),
        ),
      ),
      body: new GestureDetector(
          onTap: () {
            print('点击了item！');
          },
          child: buildListItem()),
    );
  }

// 横向的ListView
  Widget buildListItem() {
    return new ListView(
      // 水平方向排列
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        // 如果每一个item的宽度为屏幕的宽，就可以做出类似于Gallery的效果
        // 但是要控制好滑动的速度
        new Container(
          width: 480.0,
          color: Colors.red,
        ),
        new Container(
          width: 480.0,
          color: Colors.blue,
        ),
        new Container(
          width: 480.0,
          color: Colors.green,
        ),
        new Container(
          width: 480.0,
          color: Colors.yellow,
        ),
        new Container(
          width: 480.0,
          color: Colors.orange,
        ),
      ],
    );
  }
}
