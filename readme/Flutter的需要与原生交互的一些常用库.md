# Flutter的需要与原生交互的一些常用库

【说明】由于这些库一直在更新，请自己选择合适的稳定版本下载。

----

## 常用开源包：


> 网络请求

库名|版本号|链接|描述
-|-|-|-
http|0.11.3+16|https://pub.dartlang.org/packages/http|该软件包包含一组高级函数和类，可以轻松使用HTTP资源。它与平台无关，可以在命令行和浏览器上使用。
dio|0.0.14|https://pub.dartlang.org/packages/dio|Dart的一个强大的Http客户端，支持拦截器、全局配置、FormData、请求取消、文件下载、超时等。
http_multi_server|2.0.5|https://pub.dartlang.org/packages/http_multi_server|dart:io HttpServer包装器，用于处理来自多个服务器的请求

> 类型编解码的库：

库名|版本号|链接|描述
-|-|-|-
html_unescape|1.0.0|https://pub.dartlang.org/packages/html_unescape|用于解决HTML编码字符串的Dart库。支持所有命名字符引用（如`&nbsp;`），小数字符引用（如`&#225;`）和十六进制字符引用（如`&#xE3;`）。
gbk2utf8||https://github.com/jzoom/gbk2utf8|官方的http还不能支持中文gbk的解析，这个项目就是为了解决gbk转成utf-8编码的。


> 序列化

* 手动序列化：

使用 `dart:convert` 的内置解码器。包括传入 JSON 原始字符串给 JSON.decode() 方法，然后从 Map<String, dynamic> 中查询你需要的数据。

* 自动序列化：

库名|版本号|链接|描述
-|-|-|-
json_serializable|0.5.7|https://pub.dartlang.org/packages/json_serializable|
built_value|5.5.1|https://pub.dartlang.org/packages/built_value|runtime依赖项
built_value_generator|5.5.1|https://pub.dartlang.org/packages/built_value_generator|dev依赖项
built_value_test|5.5.1|https://pub.dartlang.org/packages/built_value_test|test依赖项


> json解析

* https://github.com/javiercbk/json_to_dart  根据json生成Dart实体类
* https://github.com/debuggerx01/JSONFormat4Flutter   这是一个AS的辅助插件，将JSONObject格式的String解析成Dart的实体类

* Dson 0.13.2 下载地址 https://pub.dartlang.org/packages/dson  
描述：Dson的github地址 https://github.com/drails-dart/dson
DSON是一个将Dart对象转换为JSON的库。(用于web)这个库是Dartson的一个分支，但又有不同。
* Dartson是一个Dart库，可用于将Dart对象转换为JSON字符串。
https://github.com/eredo/dartson  （用于web）

* **几个Json库的比较：[https://github.com/drails-dart/dart-serialise](https://github.com/drails-dart/dart-serialise)**

|方式|	大小 (js)	|序列化 (dart)	|反序列化 (dart)	|序列化 (js)	|反序列化 (js)|
|----|----|----|----|----|----|
|json_serializable|	80 KB	|9.09 ms	|6.61 ms	|8.23 ms	|8.12 ms|
|Serializable	|79 KB	|6.1 ms	|6.92 ms	|4.37 ms|	|8.38 ms|
|DSON	|94 KB|12.72 ms	|11.15 ms	|16.64 ms	|17.94 ms|
|Dartson	|86 KB	|9.61 ms	|6.81 ms	|8.58 ms	|7.01 ms|
|Manual|	86 KB	|8.29 ms|	5.78 ms	|10.7 ms	|7.9 ms|
|Interop	|70 KB	|61.55 ms	|14.96 ms	|2.49 ms	|2.93 ms|
|Jaguar_serializer|	88 KB	|8.57 ms	|6.58 ms	|10.31 ms	|8.59 ms|
|Jackson (Groovy)	||	496 ms|	252 ms	|n/a|	n/a|



> 国际化和本地化：

库名|版本号|链接|描述
-|-|-|-
intl|0.15.6|https://pub.dartlang.org/packages/intl|这个包提供国际化和本地化功能，包括消息翻译、复数和性别、日期/数字格式和解析以及双向文本。

> 图片加载

使用`Image.network`，或者使用下面这个库：

库名|版本号|链接|描述
-|-|-|-
cached_network_image|0.4.1+1|https://pub.dartlang.org/packages/cached_network_image|Flutter库来加载和缓存网络图像。也可以与占位符和错误小部件一起使用。

> 数据存储、缓存有关的库


库名|版本号|链接|描述
-|-|-|-
sqflite|sqflite0.10.0|https://pub.dartlang.org/packages/sqflite|SQLite的Flutter插件，一个自包含的高可靠性嵌入式SQL数据库引擎。
file_cache|0.0.1|https://pub.dartlang.org/packages/file_cache|为flutter package项目缓存Json,Buffer,FileCacheImage。

> UI库：

库名|版本号|链接|描述
-|-|-|-
cupertino_icons|0.1.2|https://pub.dartlang.org/packages/cupertino_icons|Cupertino的图标组件库
font_awesome_flutter|7.0.0|https://pub.dartlang.org/packages/font_awesome_flutter|图标字体的一个库
fluttertoast|2.0.3|https://pub.dartlang.org/packages/fluttertoast|用于Android和ios的toast库。
image_picker|0.4.5|https://pub.dartlang.org/packages/image_picker|用于从Android和iOS图像库中选择图像，并使用相机拍摄新照片。
camera|0.2.1|https://pub.dartlang.org/packages/camera|用于在Android和iOS上获取有关和控制相机的信息。支持预览相机馈送和捕捉图像。
**富文本 ↓**|||
flutter_html_view|0.5.2|https://pub.dartlang.org/packages/flutter_html_view|Flutter没有默认的支持来显示html，所以需要三方的包来显示。这个包可以将html呈现给原生的Widget。（目前支持的标签比较少）
flutter_html_textview|0.2.6|https://pub.dartlang.org/packages/flutter_html_textview|将html呈现为一个Widget,在textview中呈现html。
**MarkDown ↓**|||
markdown|2.0.0|https://pub.dartlang.org/packages/markdown|用Dart编写的便携式Markdown库。它可以在客户端和服务器上将Markdown解析为HTML。
html2md|0.1.7|https://pub.dartlang.org/packages/html2md|将html转换为Dart中的MarkDown.

> 路由：

库名|版本号|链接|描述
-|-|-|-
fluro|1.3.1|https://pub.dartlang.org/packages/fluro|最好用的路由导航框架。功能：简单的路线导航；函数处理程序（映射到函数而不是路径）；通配符参数匹配；查询字符串参数解析；内置常用转换；简单的定制转换创建。


> 消息传递通信有关：

库名|版本号|链接|描述
-|-|-|-
flutter_local_notifications|0.3.0|https://pub.dartlang.org/packages/flutter_local_notifications|一个跨平台的显示本地notifications的插件。
local_notifications|0.0.6|https://pub.dartlang.org/packages/local_notifications|这个库能让你在Android和iOS上创建Notifications很简单。
url_launcher|3.0.2|https://pub.dartlang.org/packages/url_launcher|用于在Android和iOS上启动URL。支持网络，电话，短信和电子邮件方案。
firebase_messaging|1.0.2|https://pub.dartlang.org/packages/firebase_messaging|一款跨平台的消息传递解决方案，可让您在Android和iOS上可靠地传递消息。
event_bus|0.4.1|https://pub.dartlang.org/packages/event_bus|一个使用Dart流进行解耦应用程序的简单事件总线的库。

> 视频 & 音频：

库名|版本号|链接|描述
-|-|-|-
video_player|0.6.0|https://pub.dartlang.org/packages/video_player|用于在Android和iOS上与其他Flutter窗口小部件一起显示内嵌视频。
video_launcher|0.3.0|https://pub.dartlang.org/packages/video_launcher|视频播放器
flute_music_player|0.0.6|https://pub.dartlang.org/packages/flute_music_player|基于Flutter的材料设计音乐播放器与音频插件播放本地音乐文件.
audioplayer|0.5.0|https://pub.dartlang.org/packages/audioplayer|一个播放远程或本地音频文件Flutter音频插件
audioplayers|0.5.2|https://pub.dartlang.org/packages/audioplayers|这是rxlabz的audioplayer的一个分支，不同之处在于它支持同时播放多个音频并显示音量控制。


> rx系列：

库名|版本号|链接|描述
-|-|-|-
rxdart|0.17.0|https://pub.dartlang.org/packages/rxdart|RxDart是一种基于ReactiveX的谷歌Dart反应性函数编程库。谷歌Dart自带了一个非常不错的流API;RxDart没有尝试提供这个API的替代方案，而是在它上面添加了一些功能。
rx_widgets|1.0.3|https://pub.dartlang.org/packages/rx_widgets|rx_widgets是一个包含基于流的Flutter Widgets和Widget帮助程序/便利类的程序包，它们有助于反应式编程风格，特别是与RxDart和RxCommands结合使用。
rx_command|2.0.0|https://pub.dartlang.org/packages/rx_command|RxCommand是针对事件处理程序的基于Reactive Extensions（Rx）的抽象。它基于ReactiveUI框架的ReactiveCommand。它大量使用了RxDart包。


> 系统平台有关的库：

库名|版本号|链接|描述
-|-|-|-
**获取本地文件**|||
path_provider|0.4.1|https://pub.dartlang.org/packages/path_provider|用于获取Android和iOS文件系统上的常用位置，例如temp和app数据目录。
**读写sp文件**|||
shared_preferences|0.4.2|https://pub.dartlang.org/packages/shared_preferences|用于读写简单键值对的Flutter插件。包装iOS上的NSUserDefaults和Android上的SharedPreferences。
**网络状态有关**|||
connectivity|0.3.1|https://pub.dartlang.org/packages/connectivity|用于发现Android和iOS上的网络状态（WiFi和移动/蜂窝）连接。
**设备信息**|||
device_info|0.2.1|https://pub.dartlang.org/packages/device_info|提供有关设备（品牌，型号等）的详细信息，以及应用程序正在运行的Android或iOS版本。
**蓝牙**|||
flutter_blue|0.3.3|https://pub.dartlang.org/packages/flutter_blue|这是跨平台的蓝牙sdk.
flutter_ble_lib|1.0.0|https://pub.dartlang.org/packages/flutter_ble_lib|这是一个支持蓝牙连接的flutter库。它里面使用RxAndroidBle和RxBluetoothKit作为本地库。

----

## 三方sdk有关的：

**由于开发中会用到一些三方的sdk,但是国内的sdk目前还没有支持Flutter，我在pub上面收集了一些相关的三方库，也不知道效果如何，待检验，欢迎各位试用给出反馈。**


> 地图（地图显示、定位、经纬度等）

库名|版本号|链接|描述
-|-|-|-
map_view|0.0.12|https://pub.dartlang.org/packages/map_view|一个用于在iOS和Android上显示谷歌地图的Flutter插件
flutter_map|0.0.10|https://pub.dartlang.org/packages/flutter_map|基于leaflet的Flutter地图包 
location|1.3.4|https://pub.dartlang.org/packages/location|这个插件 处理Android和iOS上的位置。它还提供位置更改时的回调。 
latlong|0.5.3|https://pub.dartlang.org/packages/latlong|LatLong是一个计算通用的纬度和经度的轻量级库。


> 二维码

库名|版本号|链接|描述
-|-|-|-
barcode_scan|0.0.4|https://pub.dartlang.org/packages/barcode_scan|用于扫描2D条形码和QRCodes的Flutter插件。
qrcode_reader|0.3.3|https://pub.dartlang.org/packages/qrcode_reader|使用相机读取二维码的Flutter插件。

> WebView

库名|版本号|链接|描述
-|-|-|-
flutter_webview_plugin|0.1.6|https://pub.dartlang.org/packages/flutter_webview_plugin|允许Flutter与原生Webview进行通信的插件。 

> 图表库

库名|版本号|链接|描述
-|-|-|-
charts-common|0.3.0|https://pub.dartlang.org/packages/charts_flutter|Material Design风格的图表库
charts-flutter|0.3.0|https://pub.dartlang.org/packages/charts_common|通用的图表库组件
flutter_circular_chart|0.0.3|https://pub.dartlang.org/packages/flutter_circular_chart|一个让你使用flutter轻松创建的动画圆形图控件的库。


> 权限库

库名|版本号|链接|描述
-|-|-|-
simple_permissions|0.1.5|https://pub.dartlang.org/packages/simple_permissions|用于android和ios的请求权限的库
flutter_simple_permissions|0.0.1|https://pub.dartlang.org/packages/flutter_simple_permissions|权限申请的库


> 分享

库名|版本号|链接|描述
-|-|-|-
share|0.5.1|https://pub.dartlang.org/packages/share|支持分享的flutter插件


> 统计

库名|版本号|链接|描述
-|-|-|-
flutter_umeng_analytics|0.0.1|https://pub.dartlang.org/packages/flutter_umeng_analytics|这个库集成了友盟统计sdk

> 登陆

库名|版本号|链接|描述
-|-|-|-
flutter_qq|0.0.1|https://pub.dartlang.org/packages/flutter_qq|这个库集成了QQ登录、QQ分享、QQ空间分享。
flutter_wechat|0.1.2|https://pub.dartlang.org/packages/flutter_wechat|这个库集成了微信，支持微信登录、分享、支付。

> 支付

库名|版本号|链接|描述
-|-|-|-
flutter_alipay|0.1.0|https://pub.dartlang.org/packages/flutter_alipay|这个库继承了支付宝，兼容android和ios


**以下几个暂未找到相关的三方库**


* 语音
* 推送

----

## 一个好玩的库：

库名|版本号|链接|描述
-|-|-|-
pwa|0.1.10|https://pub.dartlang.org/packages/pwa|基于Dart的PWA应用程序的库
