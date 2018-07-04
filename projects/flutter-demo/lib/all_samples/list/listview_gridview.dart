import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'CustomScrollView创建一个列表',
      theme: new ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: new ListViewGridViewDemo(),
    ),
  );
}

class ListViewGridViewDemo extends StatelessWidget {
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
          '创建GridView列表',
          style: new TextStyle(fontSize: 17.0),
        ),
      ),
      body: new GestureDetector(
          onTap: () {
            print('点击了item！');
          },
          child: buildGridListItem(context)),
    );
  }

// grid列表
  Widget buildGridListItem(BuildContext context) {
    return new GridView.count(
      // 创建4列
      crossAxisCount: 4,
      // Axis.horizontal表示横向滑动，scrollDirection: Axis.vertical表示纵向滑动
      scrollDirection: Axis.vertical,
      // 列之间的间距
      crossAxisSpacing: 5.0,
      // 行之间的间距
      mainAxisSpacing: 5.0,
      // 默认false 是否根据子孩子的宽高自动包裹item自身
      shrinkWrap: false,
      // true表示数据倒序排列 false表示顺序排列
      // reverse: true,
      // 子孩子的比例
      childAspectRatio: 2.0,

      // 生成100个item展示在列表中
      children: new List.generate(100, (index) {
        return new Container(
          // margin外边距，这里是上边距为2.0像素，下边距为2.0像素
          // margin: new EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
          decoration: new BoxDecoration(color: Colors.teal),
          child: buildGridItem(context, index),
        );
      }),
    );
  }

  Widget buildGridItem(BuildContext context, int index) {
    return new Column(
      children: <Widget>[
        new Icon(
          Icons.share,
          color: Colors.white,
        ),
        new Text(
          'Item $index',
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
