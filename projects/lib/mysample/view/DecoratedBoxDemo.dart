import 'package:flutter/material.dart';
import 'FractionalOffsetUtil.dart';

/// DecoratedBox 装饰容器的使用
/// DecoratedBox 控件会在子控件绘制之前或之后绘制一个装饰。
void main() {
  runApp(new MaterialApp(
    title: 'DecoratedBoxDemo',
    theme: new ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: new DecoratedBoxDemo(),
  ));
}

class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DecoratedBoxDemo'),
      ),
      body: new Center(
        //居中
        child: new SizedBox(
          //设置大小
          width: 250.0,
          height: 150.0,
          child: new DecoratedBox(
            decoration: new BoxDecoration(
              //线性渐变
//              gradient: setFractionalOffsets(Types.leftToRight, Direction.firstDirection),
//              gradient: setFractionalOffsets(Types.leftToRight, null),
//              gradient: setFractionalOffsets(Types.rightToLeft, Direction.firstDirection),
//              gradient: setFractionalOffsets(Types.rightToLeft, null),
//              gradient: setFractionalOffsets(Types.topToBottom, Direction.firstDirection),
//              gradient: setFractionalOffsets(Types.topToBottom, null),
//              gradient: setFractionalOffsets(Types.bottomToTop, Direction.firstDirection),
//              gradient: setFractionalOffsets(Types.bottomToTop, null),
              gradient: setFractionalOffsets(Types.leftTopToRightBottom, null),
//              gradient: setFractionalOffsets(Types.rightBottomToLeftTop, null),
//              gradient: setFractionalOffsets(Types.rightTopToLeftBottom, null),
//              gradient: setFractionalOffsets(Types.leftBottomToRightTop, null),
            ),
          ),
        ),
      ),
    );
  }
}
