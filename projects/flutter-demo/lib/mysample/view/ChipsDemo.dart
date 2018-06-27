import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'main3',
      theme: new ThemeData(
        primarySwatch: Colors.blue, //蓝色主题
      ),
      //主要内容是什么。。。
      home: new ChipsDemo(),
    );
  }
}

class ChipsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('标题'),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          buildChoiceChip(),
          buildActionChip(),
          buildFilterChip(),
          buildChip(),
          buildInputChip(),
          buildRawChip(),
        ],
      ),
    );
  }
}

Widget buildChoiceChip() {
  return new ChoiceChip(
    label: new Container(
      width: 130.0,
      child: new Row(
        children: <Widget>[
          new Text(
            'ChoiceChip示例',
            style: new TextStyle(color: Colors.white),
          ),
          new SizedBox(
            width: 5.0,
          ),
          new CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 10.0,
            child: new Icon(
              Icons.close,
              color: Colors.white,
              size: 10.0,
            ),
          ),
        ],
      ),
    ),
//    labelStyle: new TextStyle(color: Colors.white),
    avatar: new CircleAvatar(
      backgroundColor: Colors.deepOrange,
      child: new Text('哈'),
    ),
    selected: true,
    onSelected: (bool) {
      print('点击了ChoiceChip');
    },
    selectedColor: Colors.blue,
  );
}

Widget buildActionChip() {
  return new ActionChip(
      label: new Text('ActionChip示例'),
      avatar: new CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent,
        child: new Text('哈'),
      ),
      onPressed: () {
        print('选择了XXX');
      });
}

Widget buildFilterChip() {
  return new FilterChip(
      label: new Text('FilterChip示例'),
      avatar: new CircleAvatar(
        backgroundColor: Colors.lime,
        child: new Text('哈'),
      ),
      onSelected: (bool) {
        print(bool);
      });
}

Widget buildChip() {
  return new Chip(
    label: new Text('Chip示例'),
    avatar: new CircleAvatar(
      backgroundColor: Colors.teal,
      child: new Text('哈哈'),
    ),
  );
}

Widget buildInputChip() {
  return new InputChip(
    label: new Text('InputChip示例'),
    avatar: new CircleAvatar(
      backgroundColor: Colors.tealAccent,
      child: new Text('哈'),
    ),
  );
}

Widget buildRawChip() {
  return new RawChip(
    label: new Text('RawChip示例'),
    avatar: new CircleAvatar(
      backgroundColor: Colors.pinkAccent,
      child: new Text('哈'),
    ),
  );
}
