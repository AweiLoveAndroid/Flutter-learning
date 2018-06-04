import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'ProgressDemo',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new ProgressDemo(),
  ));
}

class ProgressDemo extends StatefulWidget {
  @override
  ProgressDemoState createState() {
    return new ProgressDemoState(
        maximumEmergy: 100,
        maximumHunger: 100,
        maximumMood: 100,
        currentEmergy: 80,
        currentHunger: 90,
        currentMood: 75);
  }
}

class ProgressDemoState extends State<ProgressDemo> {
  /*
   * 构建函数，传递参数
   *  最大能量值
   *  最大饥饿值
   *  最大情绪值
   *  当前能量值
   *  当前饥饿值
   *  当前情绪值
   */
  ProgressDemoState({
    this.maximumEmergy,
    this.maximumHunger,
    this.maximumMood,
    this.currentEmergy,
    this.currentHunger,
    this.currentMood,
  });

  int maximumEmergy;
  int maximumHunger;
  int maximumMood;
  int currentEmergy;
  int currentHunger;
  int currentMood;

  // 获取进度条描述文本
  Align _getNameText(BuildContext context, String text) {
    return new Align(
        alignment: FractionalOffset.topLeft,
        child: new Text(text,
            style: new TextStyle(
              fontSize: 15.0,
              color: Colors.red,
              height: 1.5,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ProgressDemo'),
      ),
      body: new Container(
        margin: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 10.0),
        child: new Column(
          children: <Widget>[
            _getNameText(context, '能量（$currentEmergy/$maximumEmergy）'),
            new LinearProgressIndicator(value: currentEmergy / maximumEmergy),
            _getNameText(context, '饥饿（$currentHunger/$maximumHunger）'),
            new LinearProgressIndicator(value: currentHunger / maximumHunger),
            _getNameText(context, '心情（$currentMood/$maximumMood）'),
            new LinearProgressIndicator(value: currentMood / maximumMood),
          ],
        ),
      ),
    );
  }
}
