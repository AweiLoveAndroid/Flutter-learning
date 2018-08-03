import 'package:flutter/material.dart';

// SliverGrid 和 GridView 的对比
// 1.SliverGrid只能在有slivers属性的列表控件里面使用，GridView可以单独使用。
// 2.SliverGrid根据设置的maxCrossAxisExtent自动判断创建几列，而GridView需要协商crossAxisCount属性
// 3.SliverGrid和GridView大体功能基本一致，可以创建相同的UI效果。
void main() {
  runApp(
    new MaterialApp(
      title: 'SliverGrid和GridView对比',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SliverGridVSGridView(),
    ),
  );
}

class SliverGridVSGridView extends StatelessWidget {
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
        title: new Text('SliverGrid和GridView对比'),
      ),
//      body: buildSliverGridItem(),
      body: buildGridViewItem(),
    );
  }

  // 使用SliverGrid创建列表
  Widget buildSliverGridItem() {
    return new CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        new SliverGrid(
          // 设置grid的宽高、间距属性
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            // 可以理解为：每一个item的宽（或高）的最大值
            maxCrossAxisExtent: 100.0,
            // 行之间的间距
            mainAxisSpacing: 10.0,
            // 列之间的间距
            crossAxisSpacing: 10.0,
            // 子孩子的宽高比例，即：宽度/高度的值
            childAspectRatio: 1.0,
          ),
          // 设置每一个item的布局
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 10)],
                child: new Text('grid item $index'),
              );
            },
            childCount: 30,
          ),
        )
      ],
    );
  }

  // 使用SliverGrid创建列表
  Widget buildGridViewItem() {
    return new GridView.count(
      // 创建4列
      crossAxisCount: 4,
      // Axis.horizontal表示横向滑动，scrollDirection: Axis.vertical表示纵向滑动
      scrollDirection: Axis.vertical,
      // 列之间的间距
      crossAxisSpacing: 10.0,
      // 行之间的间距
      mainAxisSpacing: 10.0,
      // 默认false 是否根据子孩子的宽高自动包裹item自身
      shrinkWrap: false,
      // 子孩子的比例
      childAspectRatio: 1.0,

      // 生成30个item展示在列表中
      children: new List.generate(30, (index) {
        return new Container(
          alignment: Alignment.center,
          color: Colors.teal[100 * (index % 10)],
          child: new Text('grid item $index'),
        );
      }),
    );
  }
}
