import 'package:flutter/material.dart';

//void main() {
//  runApp(new MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'TextFieldDemo',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue, //蓝色主题
//      ),
//      //主要内容是什么。。。
//      home: new TextFieldDemo(),
//    );
//  }
//}
// //TextField基本使用
//class TextFieldDemo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('TextFieldDemo'),
//        centerTitle: true,
//      ),
//      body: new Container(
//        padding: new EdgeInsets.all(5.0),
//        child: new ListView(
//          children: <Widget>[
//            new Text(
//              '请输入用户名1',
//              style: new TextStyle(fontSize: 15.0, color: Colors.teal),
//            ),
//            buildTextField(maxLength: 30),
//            new Text(
//              '请输入密码1',
//              style: new TextStyle(fontSize: 15.0, color: Colors.teal),
//            ),
//            buildTextField(
//                obscureText: true, maxLength: 16, maxLengthEnforced: true),
//            new Text(
//              '请输入用户名2',
//              style: new TextStyle(fontSize: 15.0, color: Colors.teal),
//            ),
//            buildTextField(),
//            new Text(
//              '请输入密码2',
//              style: new TextStyle(fontSize: 15.0, color: Colors.teal),
//            ),
//            buildTextField(
//                obscureText: true, maxLength: 16, maxLengthEnforced: false),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//Widget buildTextField(
//    {bool obscureText = false, int maxLength, bool maxLengthEnforced = false}) {
//  return new TextField(
////    decoration: new InputDecoration(),
////    focusNode:,
////    处理交互操作的
////    controller:,
////    keyboardType: TextInputType.text,
//    style: new TextStyle(color: Colors.teal),
//    textAlign: TextAlign.start,
//    autofocus: true,
//    //是否加黑点隐藏输入字符 false为显示所有字符 true隐藏字符
//    obscureText: obscureText,
//    //自动更正
//    autocorrect: true,
//    maxLines: 1,
//    maxLength: maxLength,
//    // 如果为true，则阻止字段允许超过[maxLength]个字符。
//    maxLengthEnforced: maxLengthEnforced,
//
//    ///可选的输入验证和格式化重写。
//    ///格式器在文本输入发生变化时按照所提供的顺序运行。
////    inputFormatters:,
////    如果为false，则文本字段为“禁用”：它将忽略点击并将其decoration置为灰色
//    enabled: true,
//    onChanged: (String) {
//      print('onChanged  ==> ' + String);
//    },
//    onSubmitted: (String) {
//      print('onSubmitted  ==> ' + String);
//    },
//  );
//}

//带交互效果的Form  + TextFormField
void main() {
  runApp(new MaterialApp(
    title: 'FieldDemo',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new FieldDemo(),
  ));
}

class FieldDemo extends StatefulWidget {
  @override
  _FieldDemoState createState() => new _FieldDemoState();
}

class _FieldDemoState extends State<FieldDemo> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name;
  String _color;
  String _config;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('新增商品'),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    onSaved: (val) => this._name = val,
                    validator: (val) =>
                        (val == null || val.isEmpty) ? "请输入商品名称" : null,
                    decoration: new InputDecoration(
                      labelText: '商品名称',
                    ),
                  ),
                  new TextFormField(
                    maxLength: 32, //文本长度
                    onSaved: (val) => this._color = val,
                    validator: (v) => (v == null || v.isEmpty) ? "请选择颜色" : null,
                    decoration: new InputDecoration(
                      labelText: '颜色',
                    ),
                  ),
                  new TextFormField(
                    maxLength: 32,
                    onSaved: (val) => this._config = val,
                    validator: (v) => (v == null || v.isEmpty) ? "请选择配置" : null,
                    decoration: new InputDecoration(
                      labelText: '配置',
                    ),
                  ),
                  new MaterialButton(
                    child: new Text(
                      'Submit',
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: _onSubmit,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      showDialog(
        context: context,
        builder: (ctx) => new AlertDialog(
              content: new Text('商品名称：$_name  \n 颜色：$_color \n 配置：$_config'),
            ),
      );
    }
  }
}
