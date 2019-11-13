import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
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
      appBar: AppBar(
        title: Text('Flutter创建自定义Logo'),
      ),
      body: ListView(
        children: <Widget>[
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
