import 'package:flutter/material.dart';

/// TODO
void main() {
  runApp(new MaterialApp(
    title: 'image使用',
    theme: new ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: new ImageDemo(),
  ));
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('从URL地址获取图片'),
      ),
//      body: new Center(
//        child: new Image.network(//从网络加载图片
//          'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
//          scale: 2.0,
//        ),
      body: new Center(
        child: new Container(
          decoration: new BoxDecoration(
            //从本地加载图片
            image:
                new DecorationImage(image: new AssetImage('images/demo.png')),
          ),
        ),
      ),
    );
  }
}
