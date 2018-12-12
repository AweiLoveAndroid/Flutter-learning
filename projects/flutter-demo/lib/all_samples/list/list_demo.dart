import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'listview_customscrollview.dart';
import 'listview_dividers.dart';
import 'listview_gridview.dart';
import 'listview_horizontal.dart';
import 'listview_listtitle.dart';
import 'listview_longlist.dart';
import 'listview_multi_item.dart';
import 'listview_multi_level.dart';
import 'listview_radio_listtitle.dart';
import 'listview_simple.dart';
import 'listview_sliver.dart';
import 'sliver_vs_grid.dart';
import 'vertical_list_nested_horizontal_list.dart';

class ListViewDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      buildClicks(
          buildContents('简单ListViewDemo'), context, new ListViewSimpleDemo()),
      buildClicks(
          buildContents('ListView带分割线'), context, new ListViewDividerDemo()),
      buildClicks(buildContents('ListView.builder构建长列表'), context,
          new ListViewLongListDemo()),
      buildClicks(
          buildContents('横向ListView'), context, new ListViewHorizontalDemo()),
      buildClicks(
          buildContents('ListTile的使用'), context, new ListViewListTileDemo()),
      buildClicks(buildContents('ListView的RadioListTile的切换'), context,
          new RadioListTileDemo()),
      buildClicks(buildContents('使用CustomScrollView创建列表'), context,
          new ListViewCustomScrollViewDemo()),
      buildClicks(
          buildContents('创建GridView列表'), context, new ListViewGridViewDemo()),
      buildClicks(buildContents('可折叠的AppBar+ListView'), context,
          new ListViewSliverDemo()),
      buildClicks(buildContents('多条目的ListView的demo'), context,
          new ListViewMultiItemDemo()),
      buildClicks(
          buildContents('多级列表Demo'), context, new ListViewMultiLevelDemo()),
      buildClicks(buildContents(' SliverGrid 和 GridView 的对比'), context,
          new SliverGridVSGridView()),
      buildClicks(buildContents('垂直listview嵌套水平的listview'), context,
          new ListViewNestedDemo()),
      new Text(''),
    ];

    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: new Text('ListView用法Demo'),
      ),
      body: new ListView(children: widgets),
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
}
