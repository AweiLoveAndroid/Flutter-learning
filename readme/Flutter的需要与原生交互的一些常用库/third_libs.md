## 第三方sdk有关的：

**由于开发中会用到一些三方的sdk,但是国内的sdk目前还没有支持Flutter，我在pub上面收集了一些相关的三方库，也不知道效果如何，待检验，欢迎各位试用给出反馈。**


> 地图（地图显示、定位、经纬度等）

| 库名        | 版本号 | 链接                                          | 描述                                                         |
| ----------- | ------ | --------------------------------------------- | ------------------------------------------------------------ |
| map_view    | 0.0.12 | https://pub.dartlang.org/packages/map_view    | 一个用于在iOS和Android上显示谷歌地图的Flutter插件            |
| flutter_map | 0.0.10 | https://pub.dartlang.org/packages/flutter_map | 基于leaflet的Flutter地图包                                   |
| location    | 1.3.4  | https://pub.dartlang.org/packages/location    | 这个插件 处理Android和iOS上的位置。它还提供位置更改时的回调。 |
| latlong     | 0.5.3  | https://pub.dartlang.org/packages/latlong     | LatLong是一个计算通用的纬度和经度的轻量级库。                |
|amap_core_fluttify|-|https://github.com/fluttify-project|一组库，[amap_base](https://pub.dartlang.org/packages/amap_base)作者新起的项目|

----

> 二维码

| 库名          | 版本号 | 链接                                            | 描述                                                         |
| ------------- | ------ | ----------------------------------------------- | ------------------------------------------------------------ |
| qr_flutter    | 1.1.5  | https://pub.dartlang.org/packages/qr_flutter    | QR.Flutter是一个Flutter库，基于QR-Dart,可通过Widget或自定义Paint进行简单快速的QR码渲染。可配置的输出大小、填充、背景和前景颜色。可以导出图像数据。不需要Internet连接。 |
| barcode_scan  | 0.0.8  | https://pub.dartlang.org/packages/barcode_scan  | 用于扫描2D条形码和QRCodes的Flutter插件。                     |
| qrcode_reader | 0.4.4  | https://pub.dartlang.org/packages/qrcode_reader | 使用相机读取二维码的Flutter插件。                            |

----

> WebView(Flutter和JavaScript交互)

| 库名                   | 版本号 | 链接                                                     | 描述                                     |
| ---------------------- | ------ | -------------------------------------------------------- | ---------------------------------------- |
| flutter_webview_plugin | 0.1.6  | https://pub.dartlang.org/packages/flutter_webview_plugin | 允许Flutter与原生Webview进行通信的插件。 |

----

> 图表库

| 库名                   | 版本号 | 链接                                                     | 描述                                              |
| ---------------------- | ------ | -------------------------------------------------------- | ------------------------------------------------- |
| charts-common          | 0.3.0  | https://pub.dartlang.org/packages/charts_flutter         | Material Design风格的图表库                       |
| charts-flutter         | 0.3.0  | https://pub.dartlang.org/packages/charts_common          | 通用的图表库组件                                  |
| flutter_circular_chart | 0.0.3  | https://pub.dartlang.org/packages/flutter_circular_chart | 一个让你使用flutter轻松创建的动画圆形图控件的库。 |

----

> 权限库（移动端App需要申请权限，必备）

| 库名                       | 版本号 | 链接                                                         | 描述                           |
| -------------------------- | ------ | ------------------------------------------------------------ | ------------------------------ |
| simple_permissions         | 0.1.5  | https://pub.dartlang.org/packages/simple_permissions         | 用于android和ios的请求权限的库 |
| flutter_simple_permissions | 0.0.1  | https://pub.dartlang.org/packages/flutter_simple_permissions | 权限申请的库                   |

----

> 统计（统计App的有关数据，比如日活跃量、用户量、下载量、在线时长等）

| 库名                    | 版本号 | 链接                                                      | 描述                    |
| ----------------------- | ------ | --------------------------------------------------------- | ----------------------- |
| flutter_umeng_analytics | 0.0.1  | https://pub.dartlang.org/packages/flutter_umeng_analytics | 这个库集成了友盟统计sdk(网友写的，并非官方的。) |
|janalytics|0.0.3|https://github.com/jpush/janalytics-flutter-plugin|极光统计SDK的Flutter官方版本。|
|-|-|-|目前友盟的U-App移动统计还没有推出Flutter版本的插件库。|

----

> 分享和登陆（QQ、微信、微博等平台的分享和登陆）

| 库名           | 版本号 | 链接                                             | 描述                                                         |
| -------------- | ------ | ------------------------------------------------ | ------------------------------------------------------------ |
| sharesdk       | 1.0.9  | https://pub.dartlang.org/packages/sharesdk       | ShareSDK官方推出的功能的Flutter插件，用于分享、登陆等社交功能。 |
| share          | 0.5.1  | https://pub.dartlang.org/packages/share          | 支持分享的flutter插件                                        |
| flutter_qq     | 0.0.1  | https://pub.dartlang.org/packages/flutter_qq     | 这个库集成了QQ登录、QQ分享、QQ空间分享。                     |
| fluwx     | 1.1.3  | https://pub.dartlang.org/packages/fluwx  https://github.com/OpenFlutter/fluwx   | 适用于Flutter的微信SDK，方便快捷。文本分享。网站分享。图片分享。音乐分享。视频分享。小程序分享。发送Auth认证（登录）。支付。打开小程序。一次性订阅消息。二维码登录。签约免密支付。打开微信。 |
| flutter_wechat | 0.1.2  | https://pub.dartlang.org/packages/flutter_wechat | 这个库集成了微信，支持微信登录、分享、支付。                 |
|-|-|-|极光针对Android和iOS各自都有SDK，只是目前极光还没有把分享和登陆集成到Flutter里。|
|-|-|-|目前友盟的U-Share社会化分享还没有推出Flutter版本的插件库。|

----

> 推送（把服务端的消息推送到移动设备上必备的）

| 库名                 | 版本号 | 链接                                          | 描述                 |
| -------------------- | ------ | --------------------------------------------- | -------------------- |
| jpush-flutter | 0.2.0 | https://github.com/jpush/jpush-flutter-plugin | 极光推送官方的插件库 |
|mobpush|0.0.5|https://pub.dartlang.org/packages/mobpush|Mob官方的推送插件。使用此插件能够帮助您在使用 Flutter 开发应用时，快速地实现推送功能。Demo例子：https://github.com/MobClub/MobPush-for-Flutter|
|-|-|-|目前友盟的U-push推送还没有推出Flutter版本的插件库。|

----

> IM(即时通讯（聊天）等使用场景)

| 库名                    | 版本号 | 链接                                             | 描述                                   |
| ----------------------- | ------ | ------------------------------------------------ | -------------------------------------- |
|rongcloud_im_plugin|0.9.9|https://github.com/rongcloud/rongcloud-im-flutter-sdk|基于融云 iOS/Android 平台的 IMLib SDK。配套的示例项目请点击：https://github.com/rongcloud/imkit-flutter-quickstart|
| jmessage-flutter | 0.4.0 | https://github.com/jpush/jmessage-flutter-plugin | 极光官方推出的IM聊天、社交功能的插件。 |

----

> RTC(音视频会议通话等使用场景)

| 库名                    | 版本号 | 链接                                             | 描述                                   |
| ----------------------- | ------ | ------------------------------------------------ | -------------------------------------- |
|-|-|-|目前极光的JMRTC还没有推出Flutter版本的插件库。（极光针对Android和iOS各自都有SDK，只是目前极光还没有把JMRTC集成到Flutter里面）。|
|rongcloud_rtc_plugin|0.9.9|https://github.com/rongcloud/rongcloud-rtc-flutter-sdk|基于 融云 iOS/Android 平台的 RTCLib SDK|
|Agora-Flutter-Quickstart|-|https://github.com/AgoraIO-Community/Agora-Flutter-Quickstart|声网官方集成的RTC SDK示例|

----

> 视频播放（本地视频、网上视频、或者rtmp源格式）

https://github.com/hyz1992/my_aliplayer    集成了阿里云播放器，可以用来播放视频，也可以播放rtmp格式。

----

> 支付（使用支付宝、微信支付等支付方式）

| 库名           | 版本号 | 链接                                             | 描述                                 |
| -------------- | ------ | ------------------------------------------------ | ------------------------------------ |
||||目前的做法是：自己去把支付宝和微信分别集成。|
| flutter_alipay | 0.1.0  | https://pub.dartlang.org/packages/flutter_alipay | 这个库继承了支付宝，兼容android和ios |
| fluwx     | 1.1.3  | https://pub.dartlang.org/packages/fluwx  https://github.com/OpenFlutter/fluwx   | 适用于Flutter的微信SDK，方便快捷。文本分享。网站分享。图片分享。音乐分享。视频分享。小程序分享。发送Auth认证（登录）。支付。打开小程序。一次性订阅消息。二维码登录。签约免密支付。打开微信。 |

----

> SMS（短信验证码）

库名|版本号|链接|描述
-|-|-|-
|mobsms|1.0.1|https://pub.dartlang.org/packages/mobsms|为开发者提供全球通用的短信验证码工具。使用此插件能够帮助您在使用Flutter开发应用时,快速地实现获取验证码功能。|
|jverify|0.5.2|https://github.com/jpush/jverify-flutter-plugin|极光认证整合了三大运营商的网关认证能力，为开发者提供了一键登录和号码认证功能，目前极光把这些集成到Flutter里。|

----

> 网页页面跳转到App具体页面（APP的链接化）

|库名|版本号|链接|描述|
|-|-|-|-|
|moblink|3.1.0|https://pub.dartlang.org/packages/moblink|MobLink提供Web与APP直接跳转的完全免费产品服务，实现网页间直接跳转升级为APP间直接跳转。|
|-|-|-|极光有一个JMLink SDK，目前有Android和iOS版，还没有Flutter版本，坐等完善。|

----

## 一个好玩的库：

| 库名 | 版本号 | 链接                                  | 描述                      |
| ---- | ------ | ------------------------------------- | ------------------------- |
| pwa  | 0.1.10 | https://pub.dartlang.org/packages/pwa | 基于Dart的PWA应用程序的库 |
