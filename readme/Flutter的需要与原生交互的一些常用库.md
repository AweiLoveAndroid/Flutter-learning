# Flutter的需要与原生交互的一些常用库

【说明】由于这些库一直在更新，请自己选择合适的稳定版本下载。

----

## 常用开源包：

网络请求

库名|版本号|链接|描述
-|-|-|-
http|0.11.3 + 16|[https://pub.dartlang.org/packages/http](https://pub.dartlang.org/packages/http)|该软件包包含一组高级函数和类，可以轻松使用HTTP资源。它与平台无关，可以在命令行和浏览器上使用。
dio|0.0.14|[https://pub.dartlang.org/packages/dio](https://pub.dartlang.org/packages/dio)|Dart的一个强大的Http客户端，支持拦截器、全局配置、FormData、请求取消、文件下载、超时等。


序列化和json解析

* 手动序列化：

使用在 dart:convert 中的内置解码器。包括传入 JSON 原始字符串给 JSON.decode() 方法，然后从 Map<String, dynamic> 中查询你需要的数据。

* 自动序列化：

库名|版本号|链接|描述
-|-|-|-
json_serializable|0.5.7|https://pub.dartlang.org/packages/json_serializable|
built_value|5.5.1|https://pub.dartlang.org/packages/built_value|


图片加载

使用`Image.network`，或者使用下面这个库：

库名|版本号|链接|描述
-|-|-|-
cached_network_image|0.4.1+1|https://pub.dartlang.org/packages/cached_network_image|Flutter库来加载和缓存网络图像。也可以与占位符和错误小部件一起使用。

数据库

库名|版本号|链接|描述
-|-|-|-
sqflite|sqflite0.10.0|https://pub.dartlang.org/packages/sqflite|SQLite的Flutter插件，一个自包含的高可靠性嵌入式SQL数据库引擎。

UI库：

库名|版本号|链接|描述
-|-|-|-
fluttertoast|2.0.3|https://pub.dartlang.org/packages/fluttertoast|用于Android和ios的toast库。
image_picker|0.4.5|https://pub.dartlang.org/packages/image_picker|用于从Android和iOS图像库中选择图像，并使用相机拍摄新照片。
camera|0.2.1|https://pub.dartlang.org/packages/camera|用于在Android和iOS上获取有关和控制相机的信息。支持预览相机馈送和捕捉图像。



消息传递通信有关：

库名|版本号|链接|描述
-|-|-|-
firebase_messaging|1.0.2|https://pub.dartlang.org/packages/firebase_messaging|一款跨平台的消息传递解决方案，可让您在Android和iOS上可靠地传递消息。


视频：

库名|版本号|链接|描述
-|-|-|-
video_player|0.6.0|https://pub.dartlang.org/packages/video_player|用于在Android和iOS上与其他Flutter窗口小部件一起显示内嵌视频。


系统平台有关的库：

库名|版本号|链接|描述
-|-|-|-
cupertino_icons|0.1.2|https://pub.dartlang.org/packages/cupertino_icons|Cupertino的图标组件库
**获取本地文件**|||
path_provider|0.4.1|https://pub.dartlang.org/packages/path_provider|用于获取Android和iOS文件系统上的常用位置，例如temp和app数据目录。
**读写sp文件**|||
shared_preferences|0.4.2|https://pub.dartlang.org/packages/shared_preferences|用于读写简单键值对的Flutter插件。包装iOS上的NSUserDefaults和Android上的SharedPreferences。
**启动url，例如：电话、短信等**|||
url_launcher|3.0.2|https://pub.dartlang.org/packages/url_launcher|用于在Android和iOS上启动URL。支持网络，电话，短信和电子邮件方案。
**网络状态有关**|||
connectivity|0.3.1|https://pub.dartlang.org/packages/connectivity|用于发现Android和iOS上的网络状态（WiFi和移动/蜂窝）连接。
**设备信息**|||
device_info|0.2.1|https://pub.dartlang.org/packages/device_info|提供有关设备（品牌，型号等）的详细信息，以及应用程序正在运行的Android或iOS版本。


----

## 三方sdk有关的：

**由于开发中会用到一些三方的sdk,但是国内的sdk目前还没有支持Flutter，我在pub上面收集了一些相关的三方库，也不知道效果如何，待检验，欢迎各位试用给出反馈。**


* 地图

库名|版本号|链接|描述
-|-|-|-
map_view|0.0.12|https://pub.dartlang.org/packages/map_view|一个用于在iOS和Android上显示谷歌地图的Flutter插件
flutter_map|0.0.10|https://pub.dartlang.org/packages/flutter_map|基于leaflet的Flutter地图包 
location|1.3.4|https://pub.dartlang.org/packages/location|这个插件 处理Android和iOS上的位置。它还提供位置更改时的回调。 


* 分享

库名|版本号|链接|描述
-|-|-|-
share|0.5.1|https://pub.dartlang.org/packages/share|支持分享的flutter插件


* 二维码

库名|版本号|链接|描述
-|-|-|-
barcode_scan|0.0.4|https://pub.dartlang.org/packages/barcode_scan|用于扫描2D条形码和QRCodes的Flutter插件。
qrcode_reader|0.3.3|https://pub.dartlang.org/packages/qrcode_reader|使用相机读取二维码的Flutter插件。

* WebView

库名|版本号|链接|描述
-|-|-|-
flutter_webview_plugin|0.1.6|https://pub.dartlang.org/packages/flutter_webview_plugin|允许Flutter与原生Webview进行通信的插件。 

* 图表库

库名|版本号|链接|描述
-|-|-|-
charts-common|0.3.0|https://pub.dartlang.org/packages/charts_flutter|Material Design风格的图表库
charts-flutter|0.3.0|https://pub.dartlang.org/packages/charts_common|通用的图表库组件

* 权限库

库名|版本号|链接|描述
-|-|-|-
simple_permissions|0.1.5|https://pub.dartlang.org/packages/simple_permissions|用于android和ios的请求权限的库
flutter_simple_permissions|0.0.1|https://pub.dartlang.org/packages/flutter_simple_permissions|

**以下几个暂未找到相关的三方库**

* 支付
* 登陆
* 统计
* 语音
* 推送

----

## 一个好玩的库：

库名|版本号|链接|描述
-|-|-|-
pwa|0.1.10|https://pub.dartlang.org/packages/pwa|基于Dart的PWA应用程序的库
