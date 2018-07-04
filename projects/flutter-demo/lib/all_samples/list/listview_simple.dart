import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '简单ListViewDemo',
    theme: new ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: new ListViewSimpleDemo(),
  ));
}

class ListViewSimpleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '简单ListViewDemo',
          style: new TextStyle(fontSize: 17.0),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new Text(
              '\nListView Introduction',
              style: new TextStyle(
                fontFamily: 'serif',
                fontSize: 26.0,
              ),
            ),
          ),
          new Center(
              child: new Text(
            '这是文字内容，看看效果如何？\n ListView is the most commonly used scrolling widget.It displays its children one after another in the scroll direction.In the cross axis, the children are required to fill the ListView.If non-null, the itemExtent forces the children to have the given extent in the scroll direction. Specifying an itemExtent is more efficient than letting the children determine their own extent because the scrolling machinery can make use of the foreknowledge of the children\'s extent to save work, for example when the scroll position changes drastically.',
            style: new TextStyle(
              fontFamily: 'Monospace',
              fontSize: 23.0,
            ),
          )),
        ],
      ),
    );
  }
}
