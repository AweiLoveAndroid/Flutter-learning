import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_simple_permissions/flutter_simple_permissions.dart';
import 'package:simple_permissions/simple_permissions.dart';

/// flutter_simple_permissions这个库的使用
void main() {
  runApp(new MaterialApp(
    title: 'PermissionsDemo',
    theme: new ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: new PermissionsDemo2(),
  ));
}

class PermissionsDemo2 extends StatefulWidget {
  @override
  _PermissionsDemo2State createState() => new _PermissionsDemo2State();
}

/// 待完善
class _PermissionsDemo2State extends State<PermissionsDemo2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PermissionsDemo'),
      ),
    );
  }
}

//class PermissionsDemo extends StatefulWidget {
//  @override
//  _PermissionsDemoState createState() => new _PermissionsDemoState();
//}
//
//class _PermissionsDemoState extends State<PermissionsDemo> {
//  String _platformVersion = 'Unknown';
//  Permission permission;
//
//  @override
//  void initState() {
//    super.initState();
//    initPlatformState();
//  }
//
//  /// 平台消息是异步的，所以我们用异步方法初始化。
//  initPlatformState() async {
//    String platformVersion;
//    // 平台消息可能会失败，因此我们使用try/catch平台异常。
//    try {
//      platformVersion = await FlutterSimplePermissions.platformVersion;
//    } on PlatformException {
//      platformVersion = 'Failed to get platform version.';
//    }
//
//    // 如果在异步平台消息处于飞行状态时从视图树中删除了widget，
//    // 我们希望放弃答复而不是调用setState来更新不存在的外观。
//    if (!mounted) return;
//
//    setState(() {
//      _platformVersion = platformVersion;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('PermissionsDemo'),
//      ),
//      body: new Center(
//        child: new Column(
//          children: <Widget>[
//            new DropdownButton(
//                items: _getDropDownItems(),
//                value: permission,
//                onChanged: onDropDownChanged(permission)),
//            new RaisedButton(
//              // 检查权限
//              onPressed: checkPermission,
//              child: new Text("Check permission"),
//            ),
//            new RaisedButton(
//              // 请求权限
//              onPressed: requestPermission,
//              child: new Text("Request permission"),
//            ),
//            new RaisedButton(
//              // 打开设置
//              onPressed: FlutterSimplePermissions.openSettings,
//              child: new Text("Open settings"),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  List<DropdownMenuItem<Permission>> _getDropDownItems() {
//    List<DropdownMenuItem<Permission>> items = new List();
//    Permission.values.forEach(
//      (permission) {
//        var item = new DropdownMenuItem(
//          child: new Text(getPermissionString(permission)),
//          value: permission,
//        );
//        items.add(item);
//      },
//    );
//    return items;
//  }
//
//  onDropDownChanged(Permission permission) {
//    setState(() => this.permission = permission);
//    print(permission);
//  }
//
//  requestPermission() async {
//    bool res = await FlutterSimplePermissions.requestPermission(permission);
//    print("permission request result is " + res.toString());
//  }
//
//  checkPermission() async {
//    bool res = await FlutterSimplePermissions.checkPermission(permission);
//    print("permission is " + res.toString());
//  }
//}
