import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'FRouter.dart';

void main() => runApp(MainPage());

// 使用示例代码
class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // 首页 isFirstPage: true,
    return FRouter(
      isFirstPage: true,
      isShowAppBar: true,
      routes: {
        // 不传递数据
        '/pageone': (builder) => PageOne(),
        // 传递数据给PageTwo这个页面
        '/pagetwo': (builder) => PageTwo('数据2'),
        '/pagethree': (builder) => PageThree('数据3'),
      },
      appBarTitle: Text('Hello World'),
      child: RaisedButton(
        onPressed: () {
          // 命名路由
          FRouter.sendRouter(context, '/pageone');
          // 发送路由到新页面
          // FRouter.sendRouterPage(context, PageOne('data'));
        },
        child: Text('点击进行跳转'),
      ),
    );
  }
}

class PageOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 非首页 isFirstPage: false, 默认就是非首页
    return FRouter(
      isShowAppBar: true,
      appBarTitle: Text(),
      child: RaisedButton(
        onPressed: () {
          // 返回到上个页面
          FRouter.backPageRouter(context);
        },
        child: Text('点击进行跳转'),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  String data;

  PageTwo(this.data);

  @override
  Widget build(BuildContext context) {
    return FRouter(
      isShowAppBar: true,
      appBarTitle: Text('PageTwo'),
      child: RaisedButton(
        onPressed: () {
          // 返回数据给上个页面
          FRouter.backPageRouter(context,'返回给上个页面的数据');
        },
        child: Text('点击进行跳转'),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  String data;

  PageThree(this.data);

  @override
  Widget build(BuildContext context) {
    // 不显示AppBar
    return FRouter(
      isShowAppBar: false,
      child: RaisedButton(
        onPressed: () {
          FRouter.backPageRouter(context);
        },
        child: Text('点击进行跳转'),
      ),
    );
  }
}