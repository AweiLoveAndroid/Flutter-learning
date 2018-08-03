import 'package:flutter/material.dart';

/// Container 容器的基本使用
void main() {
  runApp(new MaterialApp(
    title: 'MaterialApp',
    theme: new ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: new ContainerDemo(),
  ));
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      //使子控件在其内部水平和垂直居中
      child: new Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        constraints: new BoxConstraints.expand(
          height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
        ),
        width: 300.0,
        height: 200.0,
        decoration: buildBoxDecoration(),
        foregroundDecoration: buildBoxDecoration(),
        child: new Text('容器演示'),
        transform: new Matrix4.rotationZ(0.1),
      ),
    );
  }

  // 注意：BoxDecoration返回的是Decoration对象
  Decoration buildBoxDecoration() {
    return new BoxDecoration(
      color: const Color(0xfffce5cd),
      //设置Border属性给容器添加边框
      border: new Border.all(
        //为边框添加颜色
        color: const Color(0xff6d9eeb),
        //边框宽度
        width: 8.0,
      ),
    );
  }
}
