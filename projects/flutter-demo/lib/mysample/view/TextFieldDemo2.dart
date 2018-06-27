import 'package:flutter/material.dart';

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
          new Container(
            //外边距
            margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            //内边距
            padding: const EdgeInsets.all(10.0),
            child: new Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    onSaved: (val) => this._name = val,
                    validator: (val) =>
                        (val == null || val.isEmpty) ? "请输入商品名称" : null,
                    decoration: new InputDecoration(
                      // border默认为UnderlineInputBorder
                      border: new UnderlineInputBorder(),
                      labelText: '请输入商品名称',
                    ),
                  ),
                  new TextFormField(
//                    maxLengthEnforced: true,
                    maxLength: 5, //文本长度
                    onSaved: (val) => this._color = val,
                    validator: (v) => (v == null || v.isEmpty) ? "请选择颜色" : null,
                    decoration: new InputDecoration(
//                      设置是否有全部的边框
                      filled: true,
                      //填充颜色
                      fillColor: Colors.orangeAccent,
                      border: new UnderlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        //貌似borderSide属性没作用
//                        borderSide: new BorderSide(width: 10.0, color: Colors.green),
                      ),
//                      hintText: '颜色',
                      //有了labelText就不需要hintText属性了
                      labelText: '请输入颜色',
                      labelStyle: new TextStyle(color: Colors.white),
                    ),
                  ),
                  new TextFormField(
                    maxLength: 32,
                    onSaved: (val) => this._config = val,
                    validator: (v) => (v == null || v.isEmpty) ? "请选择配置" : null,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      labelText: '请输入配置',
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

  // 提交
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
