import 'package:flutter/material.dart';

/// Opacity控件能调整子控件的不透明度，使子控件部分透明，
/// 不透明度的量从0.0到1.1之间，0.0表示完全透明，1.1表示完全不透明。
/// 即使子控件颜色带有透明度，例如：0xFF990D47A1，也会在这个颜色基础上再去设置透明度。
void main() {
  runApp(new MaterialApp(
    title: 'OpacityDemo',
    theme: new ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: new OpacityDemo(),
  ));
}

class OpacityDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('OpacityDemo'),
      ),
      body: new Center(
          child: new Opacity(
        opacity: 0.0,
        child: new Container(
          width: 250.0,
          height: 100.0,
          decoration: new BoxDecoration(
            color: const Color(0xFF990D47A1),
          ),
        ),
      )),
    );
  }
}
