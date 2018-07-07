import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => new _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'SimpleDialogDemo',
          style: new TextStyle(fontSize: 17.0),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          setBuilders(context, 'SimpleDialogDemo1', 1, 'SimpleDialogDemo1'),
          setBuilders(context, 'SimpleDialogDemo2', 2, 'SimpleDialogDemo2'),
          setBuilders(context, 'SimpleDialogDemo3', 3, 'SimpleDialogDemo3'),
        ],
      ),
    );
  }
}

Widget setBuilders(
    BuildContext context, String contents, int type, String clickMsg) {
  // new Builder不能去掉
  return new Builder(builder: (BuildContext context) {
    // 必须加上return 不加就报错
    return buildClicks(
        buildContents(contents: contents), context, type, clickMsg);
  });
}

Widget buildClicks(
    Widget child, BuildContext context, int type, String clickMsg) {
  return new InkWell(
    child: child,
//    onTapDown: (details) {
//      Fluttertoast.showToast(
//          msg: '点击了 $clickMsg',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.BOTTOM);
//      // 创建SimpleDialog
//      buildDialogs(context, type);
//    },
    onTap: () {
      Fluttertoast.showToast(
          msg: '点击了 $clickMsg',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
//      创建SimpleDialog
      buildDialogs(context, type);
    },
  );
}

Widget buildContents({var contents, Color bgColor}) {
  return new Container(
    margin: new EdgeInsets.all(5.0),
    padding: new EdgeInsets.all(5.0),
    alignment: Alignment.center,
    constraints: new BoxConstraints.expand(height: 40.0),
    decoration: new BoxDecoration(
      color: bgColor == null ? Colors.teal[300] : bgColor,
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
    child: buildButton(contents),
  );
}

Widget buildButton(var contents) {
  return new Text(
    contents,
    style: new TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
  );
}

// 创建SimpleDialog
// 这个不能直接写，正确的使用方式：showDialog<Null>(builder: (BuildContext context) {});
// 在builder里面去声明dialog对象
// 这里封装的type是类型，如果是第一种 就显示默认的风格
void buildDialogs(BuildContext context, int type) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      if (type == 1) {
        return _showSimpleDialog1(context, type);
      } else if (type == 2) {
        return _showSimpleDialog2(context, type);
      } else if (type == 3) {
        return _showSimpleDialog3(context, type);
      }
    },
  );
}

SimpleDialog _showSimpleDialog1(BuildContext context, int type) {
  SimpleDialog simpleDialog = new SimpleDialog(
    // 标题内容
    title: new Text('SimpleDialog示例1'),
    // children里面是dialog的内容 可以自定义
    children: <Widget>[
      buildClicks(new Text('item1'), context, type, 'item1'),
      buildClicks(new Text('item2'), context, type, 'item2'),
      buildClicks(new Text('item3'), context, type, 'item3'),
      buildClicks(new Text('item4'), context, type, 'item4'),
      buildClicks(new Text('item5'), context, type, 'item5'),
    ],
  );
  return simpleDialog;
}

SimpleDialog _showSimpleDialog2(BuildContext context, int type) {
  SimpleDialog simpleDialog = new SimpleDialog(
    title: new Text(
      'SimpleDialog示例2',
      // 标题颜色使用主题色
      style: new TextStyle(color: Theme.of(context).primaryColor),
    ),
//        titlePadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
//        contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
    // 路由的名字 当点击dialog和其他页面交互的时候，就可以使用
//        semanticLabel: '/routers_name',
    // children里面是dialog的内容 可以自定义
    children: <Widget>[
      buildClicks(buildContents(contents: 'item1'), context, type, 'item1'),
      buildClicks(buildContents(contents: 'item2'), context, type, 'item2'),
      buildClicks(buildContents(contents: 'item3'), context, type, 'item3'),
      buildClicks(buildContents(contents: 'item4'), context, type, 'item4'),
      buildClicks(buildContents(contents: 'item5'), context, type, 'item5'),
    ],
  );
  return simpleDialog;
}

SimpleDialog _showSimpleDialog3(BuildContext context, int type) {
  SimpleDialog simpleDialog = new SimpleDialog(
      title: new Text(
        'SimpleDialog示例3',
        style: new TextStyle(color: Colors.deepOrange),
      ),
      titlePadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      // 路由的名字 当点击dialog和其他页面交互的时候，就可以使用
//        semanticLabel: /routers_name',
      // children里面是dialog的内容 可以自定义
      children: <Widget>[
        buildClicks(
            new ListTile(
              leading: new Icon(
                Icons.photo_album,
                color: Colors.redAccent,
              ),
              title: new Text(
                '相册',
                style: new TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
            context,
            type,
            '相册'),
        buildClicks(
            new ListTile(
              leading: new Icon(
                Icons.add,
                color: Colors.redAccent,
              ),
              title: new Text(
                '添加',
                style: new TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
            context,
            type,
            '添加'),
        buildClicks(
            new ListTile(
              leading: new Icon(
                Icons.mic,
                color: Colors.redAccent,
              ),
              title: new Text(
                '录音',
                style: new TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
            context,
            type,
            '录音'),
        buildClicks(
            new ListTile(
              leading: new Icon(
                Icons.mail,
                color: Colors.redAccent,
              ),
              title: new Text(
                '邮件',
                style: new TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
            context,
            type,
            '邮件'),
        buildClicks(
            new ListTile(
              leading: new Icon(
                Icons.search,
                color: Colors.redAccent,
              ),
              title: new Text(
                '搜索',
                style: new TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
            context,
            type,
            '搜索'),
      ]);
  return simpleDialog;
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: '点击了 $msg',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
