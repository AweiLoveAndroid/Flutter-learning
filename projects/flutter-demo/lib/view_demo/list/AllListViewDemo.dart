import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'ListView的使用',
      theme: new ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: new ListViewDemo(),

      //动态演示RadioListTile的切换
      // home: new RadioListTileDemo(),

      //多条目ListView的Demo
//      home: new ListViewMultiItemDemo(
//        items: new List<ListItem>.generate(
//          1000,
//          (i) => i % 6 == 0
//              ? new HeadingItem("标题 $i")
//              : new MessageItem("子标题 $i", "子标题描述字段 $i"),
//        ),
//      ),
    ),
  );
}

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView的使用'),
      ),
      body: new GestureDetector(
          onTap: () {
            print('点击了item！');
          },
//          child: buildListItem1()),
//          child: buildListItem2()),
//          child: buildListItem3()),
//          child: buildListItem4()),
//          child: buildListItem5()),
//          child: buildListItem6()),
          child: buildListItem7(context)),
    );
  }

  // 简单的listview带分割线
  Widget buildListItem1() {
    return new ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        const Text('item1'),
        new Divider(height: 1.0, color: Colors.grey),
        const Text('item2'),
        new Divider(height: 1.0, color: Colors.grey),
        const Text('item3'),
        new Divider(height: 1.0, color: Colors.grey),
        const Text('item4'),
      ],
    );
  }

  // 长文本
  final items = new List<String>.generate(10000, (i) => "Item $i");

  // 通过ListView.builder 构建一个长列表
  Widget buildListItem2() {
    return new ListView.builder(
//      padding: new EdgeInsets.all(8.0),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
//          title: new Text('${items[index]}'),//不加分割线
          title: buildItems(context, index), //添加分割线
        );
      },
    );
  }

  Widget buildItems(BuildContext context, int index) {
    return new Column(
      children: <Widget>[
        new Container(
          child: Text('${items[index]}'),
        ),
        new Divider(
            height: 1.0, indent: 0.0, color: Theme.of(context).accentColor),
      ],
    );
  }

  // 使用CustomScrollView创建一个列表
  Widget buildListItem3() {
    return new CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                const Text('I\'m dedicating every day to you'),
                const Text('Domestic life was never quite my style'),
                const Text('When you smile, you knock me out, I fall apart'),
                const Text('And I thought I was so smart'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 自定义可折叠的列表
  Widget buildListItem4() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          new EntryItem(data[index]),
      itemCount: data.length,
    );
  }
}

// ListTile以及子类的使用
Widget buildListItem5() {
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

// 横向的ListView
Widget buildListItem6() {
  return new ListView(
    // 水平方向排列
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      // 如果每一个item的宽度为屏幕的宽，就可以做出类似于Gallery的效果
      // 但是要控制好滑动的速度
      new Container(
        width: 480.0,
        color: Colors.red,
      ),
      new Container(
        width: 480.0,
        color: Colors.blue,
      ),
      new Container(
        width: 480.0,
        color: Colors.green,
      ),
      new Container(
        width: 480.0,
        color: Colors.yellow,
      ),
      new Container(
        width: 480.0,
        color: Colors.orange,
      ),
    ],
  );
}

// grid列表
Widget buildListItem7(BuildContext context) {
  return new GridView.count(
    // 创建4列
    crossAxisCount: 4,
    //列之间的间距
    crossAxisSpacing: 2.0,
    // scrollDirection: Axis.horizontal,//如果这个加上表示创建两行
    // 生成100个item展示在列表中
    children: new List.generate(100, (index) {
      return new Container(
        // margin外边距，这里是下边距为2.0像素
        margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
        decoration: new BoxDecoration(color: Colors.teal),
        child: new Center(
          child: new Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      );
    }),
  );
}

/////////////////////////////////////
//// 以下是多条目的ListView的demo
/////////////////////////////////////

class ListViewMultiItemDemo extends StatelessWidget {
  final List<ListItem> items;

  ListViewMultiItemDemo({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('多条目的ListView'),
      ),
      body: buildListItems(),
    );
  }

  Widget buildListItems() {
    return new ListView.builder(itemBuilder: (context, index) {
      final item = items[index];
      if (item is HeadingItem) {
        return new ListTile(
          title: new Text(
            item.heading,
            style: Theme.of(context).textTheme.headline,
          ),
        );
      } else if (item is MessageItem) {
        return new ListTile(
          title: new Text(item.sender),
          subtitle: new Text(item.body),
        );
      }
    });
  }
}

// 多类型条目列表的基类
abstract class ListItem {}

// 包含显示标题的数据的ListItem
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// 包含显示主标题、副标题的ListItem
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

/////////////////////////////////////
//// 以下是可折叠展开的ListView的demo
/////////////////////////////////////
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return new ListTile(title: new Text(root.title)); //这个只是显示一个标题
    }
    return new ExpansionTile(
      //这个可以展开折叠视图
      key: new PageStorageKey<Entry>(root),
      title: new Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }
}

/// 应用程序显示的整个多级列表
final List<Entry> data = <Entry>[
  new Entry(
    'Chapter 1',
    <Entry>[
      new Entry(
        '    Section 1-1',
        <Entry>[
          new Entry('      Item 1-1-1'),
          new Entry('      Item 1-1-2'),
          new Entry('      Item 1-1-3'),
        ],
      ),
      new Entry('    Section 1-2'),
      new Entry('    Section 1-3'),
    ],
  ),
  new Entry(
    'Chapter 2',
    <Entry>[
      new Entry('    Section 2-1'),
      new Entry('    Section 2-2'),
    ],
  ),
  new Entry(
    'Chapter 3',
    <Entry>[
      new Entry('    Section 3-1'),
      new Entry('    Section 3-2'),
      new Entry(
        '    Section 3-3',
        <Entry>[
          new Entry('        Item 3-3-1'),
          new Entry('        Item 3-3-2'),
          new Entry('        Item 3-3-3'),
          new Entry('        Item 3-3-4'),
        ],
      ),
    ],
  ),
];

/// 应用程序显示的多级列表中的一个条目
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// RadioListTile的示范代码
class RadioListTileDemo extends StatefulWidget {
  @override
  _RadioListTileDemoState createState() => new _RadioListTileDemoState();
}

class _RadioListTileDemoState extends State<RadioListTileDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RadioListTileDemo'),
      ),
      body: items(),
    );
  }

  // 示例来源于源码
  Widget items() {
    return new Column(
      // In the build function of that State
      children: <Widget>[
        new RadioListTile<SingingCharacter>(
          title: const Text('Lafayette'),
          value: SingingCharacter.lafayette,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        ),
        new RadioListTile<SingingCharacter>(
          title: const Text('Thomas Jefferson'),
          value: SingingCharacter.jefferson,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

// In the State of a stateful widget:
SingingCharacter _character = SingingCharacter.lafayette;
