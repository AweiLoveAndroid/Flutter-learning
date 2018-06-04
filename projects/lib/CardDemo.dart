import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //应用程序的唯一键值，Scaffold的状态
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _controller;

  //局部变量，选择页面
  _Page _selectedPage;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: _allPages.length);
    //addListener：每次动画的值更改时调用侦听器
    _controller.addListener(_handleTabSelection);
    _selectedPage = _allPages[0];
  }

//处理选项卡选择的函数
  void _handleTabSelection() {
    setState(() {
      _selectedPage = _allPages[_controller.index];
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
            title: new Text(widget.title),
            //bottom:显示在应用栏底部的控件
            bottom: new TabBar(
                controller: _controller,
                tabs: _allPages.map((_Page page) {
                  return new Tab(
                    text: page.label,
                  );
                }).toList())),
        floatingActionButton: !_selectedPage.fabDefined
            ? null
            : new FloatingActionButton(
                key: _selectedPage.fabKey,
                tooltip: '显示说明',
                backgroundColor: _selectedPage.fabColor,
                child: _selectedPage.fabIcon,
                onPressed: _showExplanatoryText,
              ),
        body: new TabBarView(
          controller: _controller,
          children: _allPages.map(buildTabView).toList(),
        ));
  }

  //显示说明文本的函数
  void _showExplanatoryText() {
    /*
    currentState：当前树中具有此键的控件的状态
    showBottomSheet：显示持久的质感设计底部板块
     */
    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {
      return new Container(
          decoration: new BoxDecoration(
              //容器顶部的边界颜色为当前主题颜色
              border: new Border(
                  top: new BorderSide(color: Theme.of(context).dividerColor))),
          child: new Padding(
              padding: const EdgeInsets.all(32.0),
              child: new Text(
                _selectedPage.fabDefined == true ? _explanatoryText : "",
                style: new TextStyle(color: _selectedPage.labelColor),
              )));
    });
  }

  Widget buildTabView(_Page page) {
    //Builder：将其构建委托给回调的控件
    return new Builder(
      //builder：调用获取控件
      builder: (BuildContext context) {
        return new Container(
          key: new ValueKey<String>(page.label),
          padding: const EdgeInsets.fromLTRB(48.0, 48.0, 48.0, 96.0),
          //创建质感设计卡片
          child: new Card(
            child: new Center(
              child: new Text(
                page.label,
                style: new TextStyle(
                  color: page.labelColor,
                  fontSize: 32.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

const String _explanatoryText = "当Scaffold的浮动操作按钮改变时，新按钮消失并变成视图。"
    "在这个Demo中，更改选项卡会导致应用程序与浮动操作按钮重建，"
    "Scaffold通过键值与其他区分。";

/*
页面类
成员变量：标签名称、颜色、图标
成员函数：
  获取卡片标签颜色
  获取浮动按钮定义是否为空
  获取浮动按钮的颜色
  获取浮动按钮的图标
  获取浮动按钮的键值
 */
class _Page {
  _Page({
    this.label,
    this.colors,
    this.icon,
  });

  final String label;
  final MaterialColor colors;
  final IconData icon;

  Color get labelColor => colors != null ? colors[300] : Colors.grey[300];

  bool get fabDefined => colors != null && icon != null;

  Color get fabColor => colors[400];

  Icon get fabIcon => new Icon(icon);

  Key get fabKey => new ValueKey<Color>(fabColor);
}

//所有页面类的列表
final List<_Page> _allPages = <_Page>[
  new _Page(label: '蓝色', colors: Colors.indigo, icon: Icons.add),
  new _Page(label: '绿色', colors: Colors.green, icon: Icons.create),
  new _Page(label: '空白'),
  new _Page(label: '蓝绿色', colors: Colors.teal, icon: Icons.add),
  new _Page(label: '红色', colors: Colors.red, icon: Icons.create),
];
