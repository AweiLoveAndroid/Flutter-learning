import 'package:flutter/material.dart';

/// 实现一个MD风格的简单界面，包括有：AppBar + FloatingActionButton + Drawer
/// Drawer只是简单的写了一个Text，并没有写具体内容，后续会详细介绍
void main() {
  runApp(new MaterialApp(
    title: 'MaterialApp',
    theme: new ThemeData(
      primaryColor: Colors.red, //设置appbar主题
      primarySwatch: Colors.deepOrange, //设置全局主题
    ),
    home: new MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu), tooltip: '导航菜单', onPressed: null),
        title: new Text('这是标题'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search), tooltip: '搜索', onPressed: null),
          new IconButton(
              icon: new Icon(Icons.add), tooltip: '添加', onPressed: null),
          new IconButton(
              icon: new Icon(Icons.edit), tooltip: '编辑', onPressed: null),
        ],
      ),
      body: new Center(
        child: new Text('这是内容区域。。'),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        tooltip: 'FloatingActionButton',
        onPressed: null,
      ),
      drawer: new Drawer(
        child: new Text('Drawer'),
        semanticLabel: '这是 Drawer',
      ),
    );
  }
}
