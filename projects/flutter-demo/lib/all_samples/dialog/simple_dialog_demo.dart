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
          buildContents(context, 'SimpleDialog Demo1', 'SimpleDialog Demo1', 1),
          buildContents(context, 'SimpleDialog Demo2', 'SimpleDialog Demo2', 2),
          buildContents(context, 'SimpleDialog Demo3', 'SimpleDialog Demo3', 3),
        ],
      ),
    );
  }
}

// 主体内容
Widget buildContents(
    BuildContext context, String contents, String title, int type) {
  return new InkWell(
    // 给每一个item一个点击事件
    child: _buildListItemContent(contents: contents),
    onTap: () {
      print("onTap");
      _showToast('onTap');
      // 点击了item 就会打开 SimpleDialog
      buildDialogs(context, title, type);
    },
  );
}

// ListView的 Item布局内容
Widget _buildListItemContent({var contents, Color bgColor}) {
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
    child: _buildButton(contents),
  );
}

Widget _buildButton(var contents) {
  return new Text(
    contents,
    style: new TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
  );
}

// 创建 SimpleDialog
// 这个不能直接写，正确的使用方式：showDialog<Null>(builder: (BuildContext context) {});
// 在builder里面去声明dialog对象
void buildDialogs(BuildContext context, String title, int type) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return showSimpleDialog(context, title, type);
    },
  );
}

// 创建 SimpleDialog
// title是SimpleDialog的标题  type是dialog item创建不同的内容
SimpleDialog showSimpleDialog(BuildContext context, String title, int type) {
  Text text = new Text(
    title,
    style: type == 1
        ? (new TextStyle(color: Theme.of(context).primaryColor))
        : (new TextStyle(color: Colors.deepOrange)),
  );
  SimpleDialog simpleDialog = new SimpleDialog(
    title: text,
    children: buildDialogItems(type, context),
  );
  return simpleDialog;
}

// 3种不同的内容，所以这里定义了3种类型
List<Widget> buildDialogItems(int type, BuildContext context) {
  List<Widget> list = null;
  // 第一种类型 简单的ListView
  if (type == 1) {
    list = <Widget>[
      showDialogItemsClick(new Text('item1'), 'item1', context),
      showDialogItemsClick(new Text('item2'), 'item2', context),
      showDialogItemsClick(new Text('item3'), 'item3', context),
      showDialogItemsClick(new Text('item4'), 'item4', context),
      showDialogItemsClick(new Text('item5'), 'item5', context),
    ];
  } else if (type == 2) {
    list = <Widget>[
      showDialogItemsClick(
          _buildListItemContent(contents: 'item1'), 'item1', context),
      showDialogItemsClick(
          _buildListItemContent(contents: 'item2'), 'item2', context),
      showDialogItemsClick(
          _buildListItemContent(contents: 'item3'), 'item3', context),
      showDialogItemsClick(
          _buildListItemContent(contents: 'item4'), 'item4', context),
      showDialogItemsClick(
          _buildListItemContent(contents: 'item5'), 'item5', context),
    ];
  } else if (type == 3) {
    list = <Widget>[
      showDialogItemsClick(
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
          '相册',
          context),
      showDialogItemsClick(
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
          '添加',
          context),
      showDialogItemsClick(
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
          '录音',
          context),
      showDialogItemsClick(
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
          '邮件',
          context),
      showDialogItemsClick(
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
          '搜索',
          context),
    ];
  }
  return list;
}

// 点击弹窗里面的每一个item时的事件
// 参数1：要点击的item  参数2：toast的内容
Widget showDialogItemsClick(Widget child, String msg, BuildContext context) {
  return new InkWell(
    child: child,
    onTap: () {
      Navigator.pop(context);
      _showToast("关闭了Dialog" + msg);
    },
  );
}

void _showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
}
