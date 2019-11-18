import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter自定义及自由切换Logo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
      // 直接使用自定义Logo 使用这个
      // home: MyHomePage(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  Widget showWidgetContents;
  bool isChange;
  String texts;

  @override
  void initState() {
    showWidgetContents = Contents().youtube;
    isChange = false;
    texts = '切换至 PornHub Logo';
    super.initState();
  }

  changeWidget() {
    setState(() {
      if (isChange == true) {
        showWidgetContents = new Contents().pornhub;
        texts = '切换至 YouTube Logo';
        isChange = !isChange;
      } else {
        showWidgetContents = Contents().youtube;
        //        showWidgetContents = Contents().suning;
        texts = '切换至 PornHub Logo';
        isChange = !isChange;
      }
    });
    return showWidgetContents;
  }

  @override
  Widget build(BuildContext context) {
    return new MyInheritedWidget(
      texts: texts,
      onTap: changeWidget,
      showWidgetContents: showWidgetContents,
      isChange: isChange,
      child: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Flutter自定义及自由切换Logo'),
      ),
      body: ListView(
        children: <Widget>[
          // 仿制更多自定义的Logo
          //          Contents(
          //            bgColor: Color.fromARGB(255, 4, 141, 87),
          //            bgWidth: 150,
          //            bgHeight: 150,
          //            leftText: 'OPPO',
          //            leftTextSize: 60,
          //            leftTextColor: Colors.white,
          //            rightBgColor: Color.fromARGB(255, 1, 159, 222),
          //            rightBgBorderRadius: 5,
          //            rightText: 'vivo',
          //            rightTextColor: Colors.white,
          //          ),
          //          Contents(
          //            bgColor: Colors.white,
          //            bgWidth: 150,
          //            bgHeight: 150,
          //            leftText: '小米',
          //            leftTextSize: 80,
          //            leftTextColor: Colors.black,
          //            rightBgColor: Color.fromARGB(255, 246, 123, 43),
          //            rightBgBorderRadius: 5,
          //            rightText: 'mi',
          //            rightTextColor: Colors.white,
          //          ),
          //          Contents(
          //            bgColor: Color.fromARGB(255, 2, 104, 188),
          //            bgWidth: 150,
          //            bgHeight: 150,
          //            leftText: 'Suning',
          //            leftTextSize: 60,
          //            leftTextColor: Colors.white,
          //            rightBgColor: Color.fromARGB(255, 2, 104, 188),
          //            rightBgBorderRadius: 5,
          //            rightText: '苏宁',
          //            rightTextColor: Colors.white,
          //          ),
          //          Contents(
          //            bgColor: Color.fromARGB(255, 236, 29, 23),
          //            bgWidth: 150,
          //            bgHeight: 150,
          //            leftText: '高露潔',
          //            leftTextSize: 40,
          //            leftTextColor: Colors.white,
          //            rightBgColor: Color.fromARGB(255, 236, 29, 23),
          //            rightBgBorderRadius: 5,
          //            rightText: 'Colgate®',
          //            rightTextColor: Colors.white,
          //          ),
          //          Contents(
          //            bgColor: Colors.white,
          //            bgWidth: 150,
          //            bgHeight: 150,
          //            leftText: 'Tencent',
          //            leftTextSize: 50,
          //            leftTextColor: Color.fromARGB(255, 0, 82, 217),
          //            rightBgColor: Colors.white,
          //            rightBgBorderRadius: 5,
          //            rightText: '腾讯',
          //            rightTextColor: Color.fromARGB(255, 0, 82, 217),
          //          ),
          //          Contents(
          //            bgColor: Color.fromARGB(255, 199, 21, 33),
          //            bgWidth: 150,
          //            bgHeight: 150,
          //            leftText: 'JD.COM',
          //            leftTextSize: 50,
          //            leftTextColor: Color.fromARGB(255, 249, 253, 252),
          //            rightBgColor: Color.fromARGB(255, 199, 21, 33),
          //            rightBgBorderRadius: 5,
          //            rightText: '京东',
          //            rightTextColor: Color.fromARGB(255, 249, 253, 252),
          //          ),
          //          Contents(
          //            bgColor: Color.fromARGB(255, 255, 69, 18),
          //            bgWidth: 150,
          //            bgHeight: 150,
          //            leftText: 'mobike',
          //            leftTextSize: 40,
          //            leftTextColor: Colors.white,
          //            rightBgColor: Color.fromARGB(255, 255, 69, 18),
          //            rightBgBorderRadius: 5,
          //            rightText: '摩拜单车',
          //            rightTextColor: Colors.white,
          //          ),

          MyInheritedWidget.of(context).showWidgetContents,
          RaisedButton(
            onPressed: () {
              MyInheritedWidget.of(context).onTap();
            },
            child: Text('${MyInheritedWidget.of(context).texts.toString()}'),
          ),
        ],
      ),
    );
  }
}

// 生成的Logo内容
class Contents extends StatefulWidget {
  Contents(
      {Key key,
      this.bgColor = Colors.black,
      this.bgWidth = 300,
      this.bgHeight = 300,
      this.leftText = 'Porn',
      this.leftTextSize = 30,
      this.leftTextColor = Colors.white,
      this.rightBgColor = const Color.fromARGB(255, 254, 155, 0),
      this.rightBgBorderRadius = 5,
      this.rightText = 'Hub',
      this.rightTextColor = Colors.black})
      : super(key: key);

  // 全局背景颜色
  Color bgColor;

  // 全局内容宽度
  double bgWidth;

  // 全局内容高度
  double bgHeight;

  // 左侧文字内容
  String leftText;

  // 左侧文字大小
  double leftTextSize;

  // 左侧文字颜色
  Color leftTextColor;

  // 右侧背景颜色
  Color rightBgColor;

  // 右侧边框圆角大小
  double rightBgBorderRadius;

  // 右侧文字内容
  String rightText;

  //  右侧文字颜色
  Color rightTextColor;

  Contents get pornhub => Contents(
        bgColor: Colors.black,
        bgWidth: 300,
        bgHeight: 300,
        leftText: 'Porn',
        leftTextSize: 60,
        leftTextColor: Colors.white,
        rightBgColor: Color.fromARGB(255, 254, 155, 0),
        rightBgBorderRadius: 5,
        rightText: 'Hub',
        rightTextColor: Colors.black,
      );

  Contents get youtube => Contents(
        bgColor: Color.fromARGB(255, 238, 28, 27),
        bgWidth: 300,
        bgHeight: 300,
        leftText: 'You',
        leftTextSize: 60,
        leftTextColor: Colors.white,
        rightBgColor: Colors.white,
        rightBgBorderRadius: 10,
        rightText: 'Tube',
        rightTextColor: Color.fromARGB(255, 238, 28, 27),
      );

  Contents get suning => Contents(
        bgColor: Colors.blue,
        bgWidth: 300,
        bgHeight: 300,
        leftText: 'Su',
        leftTextSize: 60,
        leftTextColor: Colors.white,
        rightBgColor: Colors.blue,
        rightBgBorderRadius: 10,
        rightText: 'ning',
        rightTextColor: Colors.white,
      );

  @override
  _ContentsState createState() => _ContentsState();
}

// 全局背景颜色、宽度、高度
// 左侧 文字内容、大小、加粗、文字颜色
// 右侧 背景颜色 文字内容、文字颜色
class _ContentsState extends State<Contents> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      width: widget.bgWidth,
      height: widget.bgHeight,
      color: widget.bgColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 5, bottom: 0),
            child: Text(
              widget.leftText,
              style: TextStyle(
                fontSize: widget.leftTextSize,
                color: widget.leftTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: widget.rightBgColor,
              border: Border.all(
                color: widget.rightBgColor,
                width: 8.0,
              ),
              borderRadius: BorderRadius.circular(widget.rightBgBorderRadius),
            ),
            padding: EdgeInsets.all(5),
            child: Text(
              widget.rightText,
              style: TextStyle(
                fontSize: widget.leftTextSize,
                color: widget.rightTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 核心代码：

class MyInheritedWidget extends InheritedWidget {
  final String texts;
  final Function onTap;
  final Widget showWidgetContents;
  final bool isChange;

  const MyInheritedWidget(
      {Key key,
      this.texts,
      this.onTap,
      this.showWidgetContents,
      this.isChange,
      child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.showWidgetContents != showWidgetContents ||
        oldWidget.isChange != isChange ||
        oldWidget.texts != texts;
  }

  static MyInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyInheritedWidget);
  }
}
