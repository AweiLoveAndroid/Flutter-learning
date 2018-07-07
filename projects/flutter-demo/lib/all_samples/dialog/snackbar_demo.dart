import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackBarDemo extends StatefulWidget {
  @override
  _SnackBarDemoState createState() => new _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'SnackBarDemo',
          style: new TextStyle(fontSize: 17.0),
        ),
      ),
      body: setBuilders(context),
    );
  }
}

Widget setBuilders(BuildContext context) {
  // 如果去掉new Builder ，那么SnackBar不会显示
  return new Builder(builder: (BuildContext context) {
    // 必须加上return 不加就报错
    return buildClicks(buildContents('显示SnackBar'), context);
  });
}

Widget buildClicks(Widget child, BuildContext context) {
  return new InkWell(
    child: child,
    onTapDown: (details) {
      Fluttertoast.showToast(
          msg: 'onTapDown',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);

      final snackBar = new SnackBar(
        // SnackBar的主体内容
        content: new Text(
          '这是一个SnackBar',
          style: new TextStyle(color: Colors.white),
        ),
        // 显示的时间，默认是1.5s 我这里设置的是5秒
        duration: new Duration(seconds: 5),
        backgroundColor: Colors.deepOrangeAccent,
        // 交互动作，可以在这里写，我这里写的是关闭SnackBar的操作
        action: new SnackBarAction(
          // label的颜色跟主题色有关
          label: '取消',
          onPressed: () {
            Fluttertoast.showToast(
                msg: '关闭了SnackBar',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER);
          },
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    },
    onTap: () {
      Fluttertoast.showToast(
          msg: 'onTap',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    },
  );
}

Widget buildContents(var text) {
  return new Container(
    margin: new EdgeInsets.all(5.0),
    padding: new EdgeInsets.all(5.0),
    alignment: Alignment.center,
    constraints: new BoxConstraints.expand(height: 40.0),
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
