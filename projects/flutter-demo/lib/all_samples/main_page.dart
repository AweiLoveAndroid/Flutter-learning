import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'list/list_demo.dart';
import 'normal_page.dart';
import 'router/router_demo.dart';

void main() {
  runApp(new MaterialApp(
    // 路由管理，指定发送到哪个页面
    routes: <String, WidgetBuilder>{
      '/my_normal_page': (BuildContext context) => new MyHomePage(),
      '/routers': (BuildContext context) => new RouterDemo(),
      '/listview_samples': (BuildContext context) => new ListViewDemos(),
    },
    title: 'Flutter控件用法示例大全',
    theme: new ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: new MainActivity(),
  ));
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      buildClicks(buildContents('默认页面'), context, '/my_normal_page'),
      buildClicks(buildContents('路由用法Demo'), context, '/routers'),
      buildClicks(
          buildContents('ListView用法Demo'), context, '/listview_samples'),
//      buildClicks2(buildContents('默认页面'), context, new NormalPage()),
//      buildClicks2(buildContents('路由用法Demo'), context, new RouterDemo()),
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter控件用法示例大全'),
      ),
      body: new Column(children: widgets),
    );
  }

  Widget buildClicks(Widget child, BuildContext context, String routeStr) {
    return new InkWell(
      child: child,
      onTapDown: (details) {
        print('onTapDown');
        Fluttertoast.showToast(
            msg: 'onTapDown',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
        // 发送路由消息
        Navigator.pushNamed(context, '$routeStr');
      },
      onTap: () {
        Fluttertoast.showToast(
            msg: 'onTap',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
      onLongPress: () {
        Fluttertoast.showToast(
            msg: 'onLongPress',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
      onDoubleTap: () {
        Fluttertoast.showToast(
            msg: 'onDoubleTap',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
    );
  }

  Widget buildClicks2(Widget child, BuildContext context, Widget page) {
    return new InkWell(
      child: child,
      onTapDown: (details) {
        print('onTapDown');
        Fluttertoast.showToast(
            msg: 'onTapDown',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
        // 发送路由消息
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) => page));
      },
      onTap: () {
        Fluttertoast.showToast(
            msg: 'onTap',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
      onLongPress: () {
        Fluttertoast.showToast(
            msg: 'onLongPress',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
      onDoubleTap: () {
        Fluttertoast.showToast(
            msg: 'onDoubleTap',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
    );
  }

  Widget buildContents(var text) {
    return new Container(
      margin: new EdgeInsets.all(10.0),
      padding: new EdgeInsets.all(10.0),
      alignment: Alignment.center,
      constraints: new BoxConstraints.expand(height: 56.0),
      decoration: new BoxDecoration(
        color: Colors.teal[300],
        borderRadius: new BorderRadius.all(
          //让矩形四个角都变成圆角
          const Radius.circular(8.0),
        ),
        // 阴影
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.teal[100],
            offset: new Offset(0.0, 5.0),
            blurRadius: 8.0,
          ),
          new BoxShadow(
            color: Colors.grey,
            offset: new Offset(0.0, 6.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: buildButton(text),
    );
  }

  Widget buildButton(var text) {
    return new Text(
      text,
      style: new TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }
}
