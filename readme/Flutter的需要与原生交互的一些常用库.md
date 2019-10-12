# Flutter的需要与原生交互的一些常用库

**【说明】由于这些库一直在更新，请自己选择合适的稳定版本下载。**
**另外如果发现有问题或者你有更好的库，欢迎留言告诉我。**

----

## 谷歌官方的针对Dart语言的一些实用性的功能以及扩展的库 -- Quiver

Quiver是一组针对Dart的实用程序库，它使使用许多Dart库变得更容易、更方便，或者增加了额外的功能。

github地址  https://github.com/google/quiver-dart

使用方式：

```yaml
dependencies:
  quiver: '>=2.0.0 <3.0.0'
```

----

## 根据pubspec.yaml中设置的目录模板自动向其中添加文件记录的脚本 `asset_generator`

好多人都说Flutter中的资源引用很头疼，手写很麻烦，最近找到了一个脚本刚好卡呀解决这个问题。

 **这个脚本的作用：利用`asset_generator`脚本生成r.dart 资源文件,方便在代码中引用资源。**

github地址： https://github.com/flutter-dev/asset_generator

使用方式：

```
1.下载 asset_generator.dart 脚本文件。
2.找到自己Flutter的安装目录，将脚本放在Flutter的根目录下。
```

#### :point_right:  另外关于pubspec.yaml文件，它很严格，很多人会写错，多一个或者少一个空格都会报错。刚好我找到了一个在线监测工具https://www.bejson.com/validators/yaml/   把你的yaml文件复制进去 就可以自动帮你找出错误了。

----

常用开源包：


文档地址|文档内容描述
----|----
[](third_libs.md)|原生平台有关的第三方库。包括：。
[](data_libs.md)|数据有关的第三方库。包括：。
[](UI_libs.md)|动画有关的第三方库。包括：。
