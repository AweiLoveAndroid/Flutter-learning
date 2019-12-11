## 常用开源包：


> 网络请求（加载网络数据，发送数据到服务端）

| 库名              | 版本号    | 链接                                                | 描述                                                         |
| ----------------- | --------- | --------------------------------------------------- | ------------------------------------------------------------ |
| http              | 0.11.3+16 | https://pub.dartlang.org/packages/http              | 该软件包包含一组高级函数和类，可以轻松使用HTTP资源。它与平台无关，可以在命令行和浏览器上使用。 |
| dio               | 0.0.14    | https://pub.dartlang.org/packages/dio               | Dart的一个强大的Http客户端，支持拦截器、全局配置、FormData、请求取消、文件下载、超时等。 |
| http_multi_server | 2.0.5     | https://pub.dartlang.org/packages/http_multi_server | dart:io HttpServer包装器，用于处理来自多个服务器的请求       |
| jaguar_retrofit   | 2.8.6     | https://pub.dartlang.org/packages/jaguar_retrofit   | Dart版本的Retrofit库，用于实现一个HTTP客户端API生成器。（我给它点评：666！思想都是相通的。） |

----

> 类型编解码的库（字符编解码）：

| 库名          | 版本号 | 链接                                            | 描述                                                         |
| ------------- | ------ | ----------------------------------------------- | ------------------------------------------------------------ |
| html_unescape | 1.0.0  | https://pub.dartlang.org/packages/html_unescape | 用于解决HTML编码字符串的Dart库。支持所有命名字符引用（如`&nbsp;`），小数字符引用（如`&#225;`）和十六进制字符引用（如`&#xE3;`）。 |
| gbk2utf8      |        | https://github.com/jzoom/gbk2utf8               | 官方的http还不能支持中文gbk的解析，这个项目就是为了解决gbk转成utf-8编码的。 |

----

> 序列化

* 手动序列化：

使用 `dart:convert` 的内置解码器。包括传入 JSON 原始字符串给 JSON.decode() 方法，然后从 Map<String, dynamic> 中查询你需要的数据。

* 自动序列化：

| 库名                  | 版本号 | 链接                                                    | 描述          |
| --------------------- | ------ | ------------------------------------------------------- | ------------- |
| json_serializable     | 0.5.7  | https://pub.dartlang.org/packages/json_serializable     |               |
| built_value           | 5.5.1  | https://pub.dartlang.org/packages/built_value           | runtime依赖项 |
| built_value_generator | 5.5.1  | https://pub.dartlang.org/packages/built_value_generator | dev依赖项     |
| built_value_test      | 5.5.1  | https://pub.dartlang.org/packages/built_value_test      | test依赖项    |

----

> Json解析（json解析成Map或对象）

| 库名    | 版本号       | 链接                                      | 描述                                                   |
| ------- | ------------ | ----------------------------------------- | ------------------------------------------------------ |
| codable | 1.0.0-beta.2 | https://pub.dartlang.org/packages/codable | 用于将动态结构化数据（JSON，YAML）转换为Dart类型的库。 |
|Dson|0.16.0|https://pub.dartlang.org/packages/dson|描述：Dson的github地址: [https://github.com/drails-dart/dson](https://github.com/drails-dart/dson)，DSON是一个将Dart对象转换为JSON的库。(用于web)这个库是Dartson的一个分支，但又有不同。|

> Github上面的库或者IDE插件：

* https://github.com/javiercbk/json_to_dart  根据json生成Dart实体类
* https://github.com/debuggerx01/JSONFormat4Flutter   这是一个AS的辅助插件，将JSONObject格式的String解析成Dart的实体类

* JsonToDartWeb是一个全平台的json转Dart的工具，支持包括：Windows，Mac，Web以及Linux(linux待测试）。Github地址：https://github.com/fluttercandies/JsonToDartWeb

> **几个Json库的比较：[https://github.com/drails-dart/dart-serialise](https://github.com/drails-dart/dart-serialise)**

| 方式              | 大小 (js) | 序列化 (dart) | 反序列化 (dart) | 序列化 (js) | 反序列化 (js) |
| ----------------- | --------- | ------------- | --------------- | ----------- | ------------- |
| json_serializable | 80 KB     | 9.09 ms       | 6.61 ms         | 8.23 ms     | 8.12 ms       |
| Serializable      | 79 KB     | 6.1 ms        | 6.92 ms         | 4.37 ms     |               |
| DSON              | 94 KB     | 12.72 ms      | 11.15 ms        | 16.64 ms    | 17.94 ms      |
| Dartson           | 86 KB     | 9.61 ms       | 6.81 ms         | 8.58 ms     | 7.01 ms       |
| Manual            | 86 KB     | 8.29 ms       | 5.78 ms         | 10.7 ms     | 7.9 ms        |
| Interop           | 70 KB     | 61.55 ms      | 14.96 ms        | 2.49 ms     | 2.93 ms       |
| Jaguar_serializer | 88 KB     | 8.57 ms       | 6.58 ms         | 10.31 ms    | 8.59 ms       |
| Jackson (Groovy)  |           | 496 ms        | 252 ms          | n/a         | n/a           |

> 反序列化（将Dart文件转换成json字符串）

* Dartson是一个Dart库，可用于将Dart对象转换为JSON字符串。github地址：https://github.com/eredo/dartson  （用于web）

>  让Json在手机上可视化的插件（可以体验一下）

|库名|版本号|链接|描述|
|----|----|----|----|
|json_table|1.3.2|[https://pub.dev/packages/json_table](https://pub.dev/packages/json_table)|这个Flutter软件包提供了一个Json Table小部件，用于直接显示json（Map）中的表。还支持列切换。|
|flutter_json_widget|1.0.2|[https://pub.dev/packages/flutter_json_widget](https://pub.dev/packages/flutter_json_widget)|这是一个用于显示Json对象的组件，可以查看Json的内容（相当于Flutter版的JsonViewer的工具）|


----

**编解码、加密解密（AES、RSA等）有关的库**

| 库名    | 版本号 | 链接                                      | 描述                                                         |
| ------- | ------ | ----------------------------------------- | ------------------------------------------------------------ |
| ninja   | 1.0.0  | https://pub.dartlang.org/packages/ninja   | 在Dart的Converter和Codec接口上完善的AES以及RSA加密解密算法的库。 |
| archive | 2.0.0  | https://pub.dartlang.org/packages/archive | 为各种存档和压缩格式提供编码器和解码器，如zip，tar，bzip2，gzip和zlib。（不知道移动端能否用得到，文档说服务端和web端可以用。） |

----

> 系统平台有关的库（设备信息、蓝牙、wifi、文件等）：

| 库名                 | 版本号 | 链接                                                 | 描述                                                         |
| -------------------- | ------ | ---------------------------------------------------- | ------------------------------------------------------------ |
| **分享（官方的库）** |        |                                                      |                                                              |
| share                | 0.5.2  | https://pub.dartlang.org/packages/share              | 用于通过平台共享UI共享内容，使用Android上的ACTION_SEND意图和iOS上的UIActivityViewController。 |
| **获取本地文件**     |        |                                                      |                                                              |
| path_provider        | 0.4.1  | https://pub.dartlang.org/packages/path_provider      | 用于获取Android和iOS文件系统上的常用位置，例如temp和app数据目录。 |
| **读写sp文件**       |        |                                                      |                                                              |
| shared_preferences   | 0.4.2  | https://pub.dartlang.org/packages/shared_preferences | 用于读写简单键值对的Flutter插件。包装iOS上的NSUserDefaults和Android上的SharedPreferences。 |
| **网络状态有关**     |        |                                                      |                                                              |
| connectivity         | 0.3.1  | https://pub.dartlang.org/packages/connectivity       | 用于发现Android和iOS上的网络状态（WiFi和移动/蜂窝）连接。    |
| **设备信息**         |        |                                                      |                                                              |
| device_info          | 0.2.1  | https://pub.dartlang.org/packages/device_info        | 提供有关设备（品牌，型号等）的详细信息，以及应用程序正在运行的Android或iOS版本。 |
| **蓝牙**             |        |                                                      |                                                              |
| flutter_blue         | 0.3.3  | https://pub.dartlang.org/packages/flutter_blue       | 这是跨平台的蓝牙sdk.                                         |
| flutter_ble_lib      | 1.0.0  | https://pub.dartlang.org/packages/flutter_ble_lib    | 这是一个支持蓝牙连接的flutter库。它里面使用RxAndroidBle和RxBluetoothKit作为本地库。 |

----

> 国际化和本地化（多国语言版本）：

| 库名 | 版本号 | 链接                                   | 描述                                                         |
| ---- | ------ | -------------------------------------- | ------------------------------------------------------------ |
| intl | 0.15.6 | https://pub.dartlang.org/packages/intl | 这个包提供国际化和本地化功能，包括消息翻译、复数和性别、日期/数字格式和解析以及双向文本。 |

----

> 图片加载和缓存

使用`Image.network`，或者使用下面这个库：

| 库名                 | 版本号  | 链接                                                   | 描述                                                         |
| -------------------- | ------- | ------------------------------------------------------ | ------------------------------------------------------------ |
| cached_network_image | 0.4.1+1 | https://pub.dartlang.org/packages/cached_network_image | Flutter库来加载和缓存网络图像。也可以与占位符和错误小部件一起使用。 |

----

> 数据存储、缓存有关的库


| 库名       | 版本号        | 链接                                         | 描述                                                         |
| ---------- | ------------- | -------------------------------------------- | ------------------------------------------------------------ |
| sqflite    | sqflite0.10.0 | https://pub.dartlang.org/packages/sqflite    | SQLite的Flutter插件，一个自包含的高可靠性嵌入式SQL数据库引擎。 |
| file_cache | 0.0.1         | https://pub.dartlang.org/packages/file_cache | 为flutter package项目缓存Json,Buffer,FileCacheImage。        |

----

> 路由（导航切换）：

| 库名  | 版本号 | 链接                                    | 描述                                                         |
| ----- | ------ | --------------------------------------- | ------------------------------------------------------------ |
| fluro | 1.3.1  | https://pub.dartlang.org/packages/fluro | 最好用的路由导航框架。功能：简单的路线导航；函数处理程序（映射到函数而不是路径）；通配符参数匹配；查询字符串参数解析；内置常用转换；简单的定制转换创建。 |

----

> 消息传递通信有关：

| 库名                        | 版本号 | 链接                                                         | 描述                                                         |
| --------------------------- | ------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| flutter_local_notifications | 0.3.0  | https://pub.dartlang.org/packages/flutter_local_notifications | 一个跨平台的显示本地notifications的插件。                    |
| local_notifications         | 0.0.6  | https://pub.dartlang.org/packages/local_notifications        | 这个库能让你在Android和iOS上创建Notifications很简单。        |
| url_launcher                | 3.0.2  | https://pub.dartlang.org/packages/url_launcher               | 用于在Android和iOS上启动URL。支持网络，电话，短信和电子邮件方案。 |
| firebase_messaging          | 1.0.2  | https://pub.dartlang.org/packages/firebase_messaging         | 一款跨平台的消息传递解决方案，可让您在Android和iOS上可靠地传递消息。 |
| event_bus                   | 0.4.1  | https://pub.dartlang.org/packages/event_bus                  | 一个使用Dart流进行解耦应用程序的简单事件总线的库。           |

----

> 视频 & 音频处理：

| 库名               | 版本号 | 链接                                                 | 描述                                                         |
| ------------------ | ------ | ---------------------------------------------------- | ------------------------------------------------------------ |
| video_player       | 0.6.5  | https://pub.dartlang.org/packages/video_player       | Flutter官方的视频库（也可以用于直播），用于在Android和iOS上与其他Flutter窗口小部件一起显示内嵌视频。**支持主流直播流**。该库底层使用的ExoPlayer播放器。更多关于ExoPlayer播放器支持的视频格式资料请看官方文档[ExoPlayer播放器支持的视频格式](https://google.github.io/ExoPlayer/supported-formats.html) |
| video_launcher     | 0.3.0  | https://pub.dartlang.org/packages/video_launcher     | 视频播放器                                                   |
| flute_music_player | 0.0.6  | https://pub.dartlang.org/packages/flute_music_player | 基于Flutter的材料设计音乐播放器与音频插件播放本地音乐文件.   |
| audioplayer        | 0.5.0  | https://pub.dartlang.org/packages/audioplayer        | 一个播放远程或本地音频文件Flutter音频插件                    |
| audioplayers       | 0.5.2  | https://pub.dartlang.org/packages/audioplayers       | 这是rxlabz的audioplayer的一个分支，不同之处在于它支持同时播放多个音频并显示音量控制。 |

----

> Rx系列（异步任务流的操作、(注：Rx是一种思想，各类常用语言都有这个技术，如：RxJava、RxKotlin、RxJs、RxSwift等)）：

| 库名       | 版本号 | 链接                                         | 描述                                                         |
| ---------- | ------ | -------------------------------------------- | ------------------------------------------------------------ |
| rxdart     | 0.17.0 | https://pub.dartlang.org/packages/rxdart     | RxDart是一种基于ReactiveX的谷歌Dart反应性函数编程库。谷歌Dart自带了一个非常不错的流API;RxDart没有尝试提供这个API的替代方案，而是在它上面添加了一些功能。 |
| rx_widgets | 1.0.3  | https://pub.dartlang.org/packages/rx_widgets | rx_widgets是一个包含基于流的Flutter Widgets和Widget帮助程序/便利类的程序包，它们有助于反应式编程风格，特别是与RxDart和RxCommands结合使用。 |
| rx_command | 2.0.0  | https://pub.dartlang.org/packages/rx_command | RxCommand是针对事件处理程序的基于Reactive Extensions（Rx）的抽象。它基于ReactiveUI框架的ReactiveCommand。它大量使用了RxDart包。 |

