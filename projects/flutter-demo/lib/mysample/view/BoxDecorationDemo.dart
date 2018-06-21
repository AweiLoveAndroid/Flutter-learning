import 'package:flutter/material.dart';

/// 盒子模型demo
/// 这里主要是盒子模型的api用法
void main() {
  runApp(
    new MaterialApp(
      title: 'BoxDemo',
      theme: new ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: new BoxDemo(),
    ),
  );
}

class BoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BoxDemo'),
      ),
      body: _buildBox2(),
    );
  }

  //创建单个盒子，里面放一个text
  Widget _buildBox() {
    return new Container(
      //宽
      width: 320.0,
      //高
      height: 240.0,
      //背景颜色
//      color: Colors.grey[300],
      margin: new EdgeInsets.all(50.0),
      padding: new EdgeInsets.all(80.0),
      alignment: Alignment.center,
      constraints: new BoxConstraints.expand(width: 300.0, height: 200.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(
          //让矩形四个角都变成圆角
          const Radius.circular(8.0),
        ),
        //垂直线性渐变
        gradient: new LinearGradient(
          begin: const Alignment(0.0, -1.0),
          end: const Alignment(0.0, 0.6),
          colors: <Color>[const Color(0xffef5350), const Color(0x00ef5350)],
        ),
        //阴影
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: const Color(0xcc000000),
            offset: new Offset(0.0, 2.0),
            blurRadius: 4.0,
          ),
          new BoxShadow(
            color: const Color(0x80000000),
            offset: new Offset(0.0, 6.0),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: new Text(
        "单个盒子",
        style: _buildTextStyle(),
      ),
    );
  }

  // 旋转组件  在控件外层加一个Transform控件
  Widget _buildBox2() {
    return new Container(
      child: new Center(
        child: new Transform(
          child: new Container(
            child: new Text(
              "旋转控件",
              style: _buildTextStyle(),
              textAlign: TextAlign.center,
            ),
            decoration: new BoxDecoration(
              color: Colors.red[400],
            ),
            padding: new EdgeInsets.all(16.0),
          ),
          alignment: Alignment.center,
          transform: _buildLocation(),
        ),
      ),
      width: 320.0,
      height: 240.0,
      color: Colors.grey[300],
    );
  }

  //盒子中间嵌套盒子
  Widget _buildBoxInBox() {
    // 外层盒子
    return new Container(
      child: new Center(
        //内层盒子
        child: new Container(
          child: new Text(
            "盒子中嵌套盒子",
            style: _buildTextStyle(),
          ),
          decoration: new BoxDecoration(
            color: Colors.deepOrange,
          ),
          padding: new EdgeInsets.all(16.0),
          width: 240.0, //最大宽度是 240.0
        ),
      ),
      width: 320.0,
      height: 240.0,
      color: Colors.blue[300],
    );
  }

  // 设置一个圆形
  Widget _buildRound() {
    return new Container(
      // red circle
      child: new Text(
        "Lorem ipsum",
        style: _buildTextStyle(),
        textAlign: TextAlign.center,
      ),
      decoration: new BoxDecoration(
        color: Colors.red[400],
        shape: BoxShape.circle,
      ),
      padding: new EdgeInsets.all(16.0),
      width: 160.0,
      height: 160.0,
    );
  }

  //富文本的显示
  Widget _buildRichText() {
    return new RichText(
      text: new TextSpan(
        style: _buildTextStyle(),
        children: <TextSpan>[
          new TextSpan(text: "Lorem "),
          new TextSpan(
            text: "ipsum",
            style: new TextStyle(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              fontSize: 48.0,
            ),
          ),
        ],
      ),
    );
  }

  //文本样式
  TextStyle _buildTextStyle() {
    return new TextStyle(
      //文本大小
      fontSize: 24.0,
      //字体粗细
      fontWeight: FontWeight.w900,
      //字体
      fontFamily: "Georgia", //...还有其他属性就不一一列举了
      //间距
      letterSpacing: 4.0,
    );
  }

  // 设置操作位置
  Matrix4 _buildLocation() {
    //旋转
    // return new Matrix4.identity()..rotateZ(15 * 3.1415927 / 180);
    // 缩放
//    return new Matrix4.identity()..scale(1.5);
    // 平移
//    return new Matrix4.identity()..translate(10.0,10.0,0.0);
  }
}
