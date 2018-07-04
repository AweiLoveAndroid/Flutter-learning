import 'package:flutter/material.dart';

//void main() {
//  runApp(
//    new MaterialApp(
//      title: '可折叠的AppBar+ListView',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue, //设置全局主题
//      ),
//      home: new ListViewSliverDemo(),
//    ),
//  );
//}

class ListViewSliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: buildListItem(context));
  }

  Widget buildListItem(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          // 返回按钮
          leading: new IconButton(
              icon: new Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                // 返回上一个页面
                Navigator.of(context).pop();
              }),
          // 标题
          title: new Text(
            '可折叠的appbar + listview',
            style: new TextStyle(
              fontSize: 17.0,
            ),
          ),
          // 右边的按钮
          actions: <Widget>[
            new Icon(Icons.search),
            new Icon(Icons.add),
            new Icon(Icons.menu),
          ],
          backgroundColor: Colors.lime,
          automaticallyImplyLeading: false,
          // 相当于安卓里面的fitSystem属性
          primary: true,
          pinned: true,
          floating: true,
          snap: false,
          expandedHeight: 300.0,
          // 可折叠的appbar
          flexibleSpace: new FlexibleSpaceBar(
            title: new Text('Demo'),
            // 折叠布局的标题是否居中
            centerTitle: true,
            // 背景图片
            background: new Image.asset(
              'images/demo.png',
              // 填充
              fit: BoxFit.fill,
            ),
          ),
        ),
        //可以折叠的Grid列表
        new SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 8)],
                child: new Text('item $index'),
              );
            },
            childCount: 8,
          ),
        ),
        // 可以折叠的List列表
        new SliverFixedExtentList(
          // 可以理解为item的高度
          itemExtent: 50.0,
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 10)],
                child: new Text('list item $index'),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
