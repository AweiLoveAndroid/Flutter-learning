import 'package:flutter/material.dart';

//void main() {
//  runApp(
//    new MaterialApp(
//      title: 'ListView带分割线',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue, //设置全局主题
//      ),
//      home: new ListViewDividerDemo(),
//    ),
//  );
//}

class ListViewDividerDemo extends StatelessWidget {
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
          'ListView带分割线',
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

  // 简单的listview带分割线
  Widget buildListItem() {
    return new ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        buildContents('item1'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item2'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item3'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item4'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item4'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item5'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item6'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item7'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item8'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item9'),
        new Divider(height: 1.0, color: Colors.grey),
        buildContents('item10'),
      ],
    );
  }

  Widget buildContents(var text) {
    return new Container(
      alignment: Alignment.centerLeft,
      constraints: new BoxConstraints.expand(height: 56.0),
      child: new Text(text),
    );
  }
}
