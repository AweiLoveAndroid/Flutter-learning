import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'demo1.dart';
import 'demo2.dart';
import 'demo3.dart';
import 'demo4.dart';

// 路由操作思路：
// 1. 发送路由消息，指定发送的消息名称，比如/demo1
//     Navigator.pushNamed(context, '/demo1');
// 2. 路由管理，指定发送到哪个页面。如果当前页面要打开其他界面，
//    可以在MaterialApp的routes属性指定要跳转的页面，
//    key是第一步设置的名称，value是要跳转的子页面。
//    例如：
//      routes: <String, WidgetBuilder>{
//       '/demo1': (BuildContext context) => new Demo1(),
//       '/demo2': (BuildContext context) => new Demo2(),
//       '/demo3': (BuildContext context) => new Demo3(),
//       '/demo4': (BuildContext context) => new Demo4(),
// 3. 子页面里面返回上一个页面使用以下代码：
//   Navigator.of(context).pop();

// 路由注意事项：
// 1.子页面的主题跟随者主页面的主题，子页面单独设置的主题不起作用。
// 2.子页面可以不写main方法，只需要一个页面就可以了，比如这里的Demo1就去掉了main方法
// 3.子页面需要设置appbar的风格可以使用appbar的属性设置，
//     比如backgroundColor设置appbar的背景色，iconTheme设置appbar上面的icon的主题
// 4.主页跳转到RouterDemo（当前这个类）是通过第二步，非主页面的跳转使用下面这种方式：
//   我们的当前类里面有4个按钮，每个按钮对应一个子页面。我们这里使用的跳转方式如下：
//  Navigator.push(context,
//            new MaterialPageRoute(builder: (BuildContext context) => new Demo1()));
// 这里的new Demo1是我们要跳转的页面

void main() {
  runApp(new MaterialApp(
    title: '路由Demo',
    theme: new ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: new RouterDemo(),
  ));
}

class RouterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      buildClicks(buildContents('按钮1'), context, new Demo1()),
      buildClicks(buildContents('按钮2'), context, new Demo2()),
      buildClicks(buildContents('按钮3'), context, new Demo3()),
      buildClicks(buildContents('按钮4'), context, new Demo4()),
    ];

    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: new Text('路由Demo'),
      ),
      body: new Column(children: widgets),
    );
  }

  Widget buildClicks(Widget child, BuildContext context, Widget page) {
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
