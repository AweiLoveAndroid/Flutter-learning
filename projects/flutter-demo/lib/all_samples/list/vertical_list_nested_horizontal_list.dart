import 'package:flutter/material.dart';

// 垂直listview嵌套水平的listview
class ListViewNestedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: new Text(
          '垂直listview嵌套水平的listview Demo',
          style: new TextStyle(fontSize: 15.0),
        ),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListViewNested(),
    );
  }
}

class ListViewNested extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '垂直listview嵌套水平的listview Demo',
          style: new TextStyle(fontSize: 15.0),
        ),
      ),
//      body: buildListView(),
      body: buildListView2(),
    );
  }
  
  // ListView -> SizedBox -> ListView -> 然后就是具体的组件
  Widget buildListView() {
    return new ListView(
      children: [
        new SizedBox(
          height: 100.0,
          child: ListView(
            // 设置滑动方向是水平方向
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new FlutterLogo(colors: Colors.pink, size: 100),
              new FlutterLogo(colors: Colors.teal, size: 100),
              new FlutterLogo(colors: Colors.brown, size: 100),
              new FlutterLogo(colors: Colors.lightBlue, size: 100),
              new FlutterLogo(colors: Colors.green, size: 100),
              new FlutterLogo(colors: Colors.pink, size: 100),
              new FlutterLogo(colors: Colors.teal, size: 100),
              new FlutterLogo(colors: Colors.brown, size: 100),
              new FlutterLogo(colors: Colors.lightBlue, size: 100),
              new FlutterLogo(colors: Colors.green, size: 100),
            ],
          ),
        ),
        new FlutterLogo(colors: Colors.pink, size: 100),
        new FlutterLogo(colors: Colors.teal, size: 100),
        new FlutterLogo(colors: Colors.brown, size: 100),
        new FlutterLogo(colors: Colors.lightBlue, size: 100),
        new FlutterLogo(colors: Colors.green, size: 100),
        new FlutterLogo(colors: Colors.pink, size: 100),
        new FlutterLogo(colors: Colors.teal, size: 100),
        new FlutterLogo(colors: Colors.brown, size: 100),
        new FlutterLogo(colors: Colors.lightBlue, size: 100),
        new FlutterLogo(colors: Colors.green, size: 100),
      ],
    );
  }


  // ListView -> SizedBox -> SingleChildScrollView -> Row -> 然后就是具体的组件
  Widget buildListView2() {
    // 纵向滑动的listview
    return new ListView(
      children: [
        new SizedBox(
          height: 100.0,
          child: new SingleChildScrollView(
            // 设置滑动方向是水平方向
            scrollDirection: Axis.horizontal,
            child: new Row(
              children: <Widget>[
                new FlutterLogo(colors: Colors.pink, size: 100),
                new FlutterLogo(colors: Colors.teal, size: 100),
                new FlutterLogo(colors: Colors.brown, size: 100),
                new FlutterLogo(colors: Colors.lightBlue, size: 100),
                new FlutterLogo(colors: Colors.green, size: 100),
                new FlutterLogo(colors: Colors.pink, size: 100),
                new FlutterLogo(colors: Colors.teal, size: 100),
                new FlutterLogo(colors: Colors.brown, size: 100),
                new FlutterLogo(colors: Colors.lightBlue, size: 100),
                new FlutterLogo(colors: Colors.green, size: 100),
              ],
            ),
          ),
        ),
        new FlutterLogo(colors: Colors.pink, size: 100),
        new FlutterLogo(colors: Colors.teal, size: 100),
        new FlutterLogo(colors: Colors.brown, size: 100),
        new FlutterLogo(colors: Colors.lightBlue, size: 100),
        new FlutterLogo(colors: Colors.green, size: 100),
        new FlutterLogo(colors: Colors.pink, size: 100),
        new FlutterLogo(colors: Colors.teal, size: 100),
        new FlutterLogo(colors: Colors.brown, size: 100),
        new FlutterLogo(colors: Colors.lightBlue, size: 100),
        new FlutterLogo(colors: Colors.green, size: 100),
      ],
    );
  }
}
