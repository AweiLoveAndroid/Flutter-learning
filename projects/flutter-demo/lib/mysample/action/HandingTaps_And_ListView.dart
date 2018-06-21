import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 侧滑删除demo
/// 这个可以左边侧滑删除，也可以右边侧滑删除
/// app常见的 侧滑删除效果 就可以在这个基础上做改进
/// 思路：
/// 1.创建的List的item。
/// 2.将每个item包装在 Dismissible 控件中。
/// 3.提供“Leave Behind”提示。
void main() {
  runApp(MyApp(
    items: List<String>.generate(20, (i) => "Item ${i + 1}"),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: buildItem(),
      ),
    );
  }

  Widget buildItem() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return buildDismissible(item, context, index);
      },
    );
  }

  Widget buildDismissible(var item, BuildContext context, int index) {
    return Dismissible(
      //每个Dismissible必须包含一个Key。这个Key允许Flutter惟一地标识控件。
      key: Key(item),
      //我们还需要提供一个方法，它会告诉我们的应用程序在一个item被移开之后该做什么。
      onDismissed: (direction) {
        // 从右到左滑动
        if (direction == DismissDirection.endToStart) {
          items.removeAt(index);
          var snackBar1 = new SnackBar(
            content: Text("$item 被删除了"),
          );
          Scaffold.of(context).showSnackBar(snackBar1);
          // 从左到右滑动
        } else if (direction == DismissDirection.startToEnd) {
          var snackBar2 = new SnackBar(
            content: Text("从左到右滑动删除"),
          );
          Scaffold.of(context).showSnackBar(snackBar2);
        }
      },
      // 当item被移开，显示一个红色的背景
      background: Container(
        color: Colors.red,
//        padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        child: new Text(
          '删除',
          textDirection: TextDirection.rtl,
        ),
      ),
      //这是ListView里面的真正的item
      child: ListTile(
        title: Text('$item'),
      ),
    );
  }
}