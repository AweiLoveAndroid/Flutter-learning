import 'dart:collection';

import 'package:flutter/material.dart';



class RouteManager{

  BuildContext context;
  
  // 管理路由的map
  Map<String, WidgetBuilder> routeManagerMap = {};

  Map<String, Widget> routeMap = {};

  // 构造函数
  RouteManager(this.context);

  void pushNamed(String routeName){
    Navigator.of(context).pushNamed(routeName);
  }

 // key是 发送路由的标记  Value是要跳转的页面
  putRoutesMap(Map<String, Widget> map){
    routeMap = map;
  }

  _putRoutes(){
    routeMap.forEach((routeName, targetPage){
      routeManagerMap[routeName] = (BuildContext context) => targetPage;
    });
  }


  Map<String, WidgetBuilder> getRoutes(){
    return routeManagerMap;
  }


}
