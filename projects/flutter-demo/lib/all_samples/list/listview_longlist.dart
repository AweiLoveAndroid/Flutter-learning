import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'ListView.builder构建长列表',
      theme: new ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: new ListViewLongListDemo(),
    ),
  );
}

class ListViewLongListDemo extends StatelessWidget {
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
          'ListView.builder构建长列表',
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

  // 长文本
  final items = new List<String>.generate(10000, (i) => "Item $i");

  // 通过ListView.builder 构建一个长列表
  Widget buildListItem() {
    return new ListView.builder(
//      padding: new EdgeInsets.all(8.0),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
//          title: new Text('${items[index]}'),//不加分割线
          title: buildItems(context, index), //添加分割线
        );
      },
    );
  }

  Widget buildItems(BuildContext context, int index) {
    return new Column(
      children: <Widget>[
        new Container(
          child: Text('${items[index]}'),
        ),
        new Divider(
            height: 1.0, indent: 0.0, color: Theme.of(context).accentColor),
      ],
    );
  }
}
