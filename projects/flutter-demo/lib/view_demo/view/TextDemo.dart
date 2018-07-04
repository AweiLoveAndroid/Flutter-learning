import 'package:flutter/material.dart';

/// TODO
void main() {
  runApp(new MaterialApp(
    title: 'MaterialApp',
    home: new TextDemo(),
  ));
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //Scaffold提供了MD控件必备的元素，比如appbar,Drawer等
      appBar: new AppBar(
        title: new Text('TextDemo'),
      ),
      body: new Column(
        //列
        children: _setChildren(),
      ),
    );
  }
}

/// 设置所有的列
/// 其中Text的相关属性：
/// color 颜色
/// decoration 删除线
/// decorationColor 删除线颜色
/// decorationStyle 删除线样式
/// fontSize 大小
/// fontStyle 斜体
/// fontFamily 字体
/// fontWeight 字体粗细
/// height 跨度
/// letterSpacing 字母间隔
List<Widget> _setChildren() {
  return <Widget>[
    new Text(
      '红色+黑色删除线+25号',
      style: new TextStyle(
        color: const Color(0xffff0000),
        decoration: TextDecoration.lineThrough,
        decorationColor: const Color(0xff000000),
        fontSize: 25.0,
      ),
    ),
    new Text(
      '橙色+下划线+24号',
      style: new TextStyle(
        color: const Color(0xffff9900),
        decoration: TextDecoration.underline,
        fontSize: 24.0,
      ),
    ),
    new Text(
      '虚线上划线+23号+倾斜',
      style: new TextStyle(
        decoration: TextDecoration.overline,
        decorationStyle: TextDecorationStyle.dashed,
        fontSize: 23.0,
        fontStyle: FontStyle.italic,
      ),
    ),
    new Text(
      'serif字体+24号',
      style: new TextStyle(
        fontFamily: 'serif',
        fontSize: 26.0,
      ),
    ),
    new Text(
      'monospace字体+24号+加粗',
      style: new TextStyle(
        fontFamily: 'monospace',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    new Text(
      '天蓝色+25号+2行跨度',
      style: new TextStyle(
        color: const Color(0xff4a86e8),
        fontSize: 25.0,
        height: 2.0,
      ),
    ),
    new Text(
      '24号+2个字母间隔',
      style: new TextStyle(
        fontSize: 24.0,
        letterSpacing: 2.0,
      ),
    ),
  ];
}
