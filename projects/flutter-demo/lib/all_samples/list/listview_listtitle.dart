import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'ListTile以及子类的使用',
      theme: new ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: new ListViewListTileDemo(),
    ),
  );
}

class ListViewListTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: new Text(
          'ListTile以及子类的使用',
          style: new TextStyle(fontSize: 17.0),
        ),
      ),
      body: new GestureDetector(
          onTap: () {
            print('点击了item！');
          },
          child: buildListItem()),
    );
  }

// ListTile以及子类的使用
  Widget buildListItem() {
    return new ListView(
      children: <Widget>[
        // 一个有图片和文字组成的简单列表item
        new ListTile(
          leading: new Icon(Icons.account_circle),
          title: new Text('联系人'),
          subtitle: new Text('联系人简介'),
          // 右边的图标
          trailing: new Icon(Icons.chevron_right),
          onTap: () {
            print('点击了 ListTile  ==== title为：联系人');
          },
          onLongPress: () {
            print('长按了 ListTile  ==== title为：联系人');
          },
          selected: true,
        ),
        new ListTile(
          leading: new Icon(Icons.photo_album),
          title: new Text('相册'),
        ),
        new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('电话'),
        ),
        // 单选框列表item
        new CheckboxListTile(
          value: true,
          onChanged: ((bool) {
            print('点击了CheckboxListTile');
          }),
          title: new Text('相册'),
          subtitle: new Text('相册的描述'),
          selected: true,
          activeColor: Colors.teal,
        ),
        // 开关列表item
        new SwitchListTile(
          value: true,
          onChanged: ((bool) {
            print('点击了SwitchListTile');
          }),
          title: new Text('相册'),
          subtitle: new Text('相册的描述..............................'
              '...................................'
              '.....................'),
          //如果subtitle文字过长，将会以三行显示
          isThreeLine: true,
          selected: true,
          activeColor: Colors.teal,
//        dense: false,
          //SwitchListTile左边的图标
          secondary: new Icon(Icons.account_circle),
        ),
        new AboutListTile(
          icon: new Icon(Icons.panorama),
          //公司logo
          applicationIcon: new FlutterLogo(),
          //app名称
          applicationName: '关于我们',
          //app版本号
          applicationVersion: 'V1.0.0',
          //版权信息
          applicationLegalese: '版权归XX科技有限公司所有...',
//        child: ,//关于应用名
//        aboutBoxChildren: <Widget>[],//更多信息
        ),
      ],
    );
  }
}
