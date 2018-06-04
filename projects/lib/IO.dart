import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter',
    home: new ReadAndWriteDemo(),
  ));
}

class ReadAndWriteDemo extends StatefulWidget {
  @override
  _ReadAndWriteDemoState createState() => new _ReadAndWriteDemoState();
}

class _ReadAndWriteDemoState extends State<ReadAndWriteDemo> {

  // 全局变量，存储点击数
  int _counter;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('读写文件操作')),
        body: new Center(
            child: new Text('点击按钮${_counter == 0 ? '' : '$_counter次'}！')),
        floatingActionButton: new FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: '增加',
          child: new Icon(Icons.add),
        ));
  }

  // 覆盖initState函数，创建状态对象调用该方法
  @override
  void initState() {
    // 调用原initState方法内容
    super.initState();
    /*
     * 调用_readCounter函数，读取点击数
     *  将点击数作为参数，创建一个函数
     */
    _readCounter().then((int value) {
      // 通知框架此对象的内部状态已更改
      setState(() {
        // 将参数赋予存储点击数的变量
        _counter = value;
      });
    });
  }

  /*
   * _readCounter函数，读取点击数
   * 关键字async表示异步操作
   * 返回值Future类型，表示延迟处理的对象
   */
  Future<int> _readCounter() async {
    try {
      /*
       * 获取本地文件目录
       * 关键字await表示等待操作完成
       */
      File file = await _getLocalFile();
      // 使用给定的编码将整个文件内容读取为字符串
      String contents = await file.readAsString();
      // 返回文件中的点击数
      return int.parse(contents);
    } on FileSystemException {
      // 发生异常时返回默认值
      return 0;
    }
  }

  // _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    // 返回本地文件目录
    return new File('$dir/counter.txt');
  }

  // _incrementCounter函数，点击增加按钮时的回调
  Future<Null> _incrementCounter() async {
    setState(() {
      // 存储点击数的变量自加1
      _counter++;
    });
    // 将存储点击数的变量作为字符串写入文件
    await (await _getLocalFile()).writeAsString('点击按钮$_counter次');
  }

}
