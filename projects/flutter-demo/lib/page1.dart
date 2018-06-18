import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'flutter learning',
    home: new MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text('AppBar标题  flutter learning',
                style: Theme.of(context).primaryTextTheme.title),
          ),
          new Expanded(
              child: new Center(
            child: new Text('你好 世界！'),
          )),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu), tooltip: '导航菜单', onPressed: null),
          new Expanded(child: title),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: '搜索',
            onPressed: null,
          )
        ],
      ),
    );
  }
}
