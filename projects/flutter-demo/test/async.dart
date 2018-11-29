import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_logger/flutter_logger.dart';
import 'package:http/http.dart' as http;
//import 'package:log/log.dart';

/// 加载网络json和本地json
void main() {
//  _networkLoading();
  _loadJson();
}

/// 通过网络加载json并解析层对象
void _networkLoading() {
  /// 访问快递接口
  /// 将给定标头的HTTP GET请求发送到给定的URL，并注册回调，参数为HTTP响应
  http
      .get('http://www.kuaidi100.com/query?type=yuantong&postid=11111111111')
      .then((http.Response response) {
    // 响应的主体作为字符串返回
    String netdata = response.body;
    // JsonDecoder类解析JSON字符串并构建相应的对象
    JsonDecoder decoder = new JsonDecoder();
    // 将给定的JSON字符串输入转换为其对应的对象
    Map<String, dynamic> json = decoder.convert(netdata);
    // 输出给定的JSON数据
    new Log('networkLoading').d(json.toString());
  });
}

/// 以下是异步加载本地json资源
Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/result.json');
}

void _loadJson() {
  loadAsset().then((value) {
    JsonDecoder decoder = new JsonDecoder();
    Map<String, dynamic> json = decoder.convert(value);
    new Log('_loadJson').d(json.toString());
  });
}
