import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// TODO
void main() {
  runApp(new MaterialApp(
    title: 'PopMenuButtonDemo',
    theme: new ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: new PopMenuButtonDemo(),
  ));
}

class PopMenuButtonDemo extends StatefulWidget {
  @override
  _PopMenuButtonDemoState createState() => new _PopMenuButtonDemoState();
}

class _PopMenuButtonDemoState extends State<PopMenuButtonDemo> {
  String _bodyStr = '显示菜单的点击';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PopMenuButtonDemo'),
        actions: <Widget>[
          new PopupMenuButton(
            itemBuilder: (BuildContext context) => list(),
            tooltip: "提示",
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            onSelected: (String value) {
              setState(() {
                _bodyStr = value == null ? null : value;
                //弹吐司
                Fluttertoast.showToast(
                  msg: "点击了： ${value}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              });
            },
          )
        ],
      ),
      body: new Center(
        child: new Text(
          _bodyStr,
          style: new TextStyle(
            color: Colors.red[500],
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

List<PopupMenuItem<String>> list() {
  List<PopupMenuItem<String>> list = <PopupMenuItem<String>>[
    new PopupMenuItem<String>(value: '选项一', child: new Text('选项一')),
    new PopupMenuItem<String>(value: '选项二', child: new Text('选项二')),
  ];
  return list;
}
