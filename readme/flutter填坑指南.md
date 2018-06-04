1.命令行输入flutter doctor 看提示缺少什么就安装什么？（这个巨坑，有4个必备选项）

2.flutter的gradle配置文件在flutter\packages\flutter_tools\gradle\flutter.gradle里面

打开可以看到版本：

dependencies {
        classpath 'com.android.tools.build:gradle:3.0.1'
    }

这里指的是AS的版本3.0.1，说明flutter最高支持的安卓版本是26 

怪不得我用27的模拟器提示我说flutter不支持


3.flutter官方推荐使用x86 或者 x86_64的模拟器测试。

4.新建一个flutter工程，在编译选项那里有一个MainActivity和main.dart

在Build菜单那里找不到，在右边有一排选项，第一个是模拟器，第二个是选择编译项目。（我用的是AS3.2金丝雀预览版，菜单栏有变更）

选择main.dart然后打开模拟器就可以运行了。

5.Flutter使用外部开源包，打开pubspec.yaml文件，在如下加了中文注释之处添加依赖库：

dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.2
  # 在这里添加依赖库，比这个是英文单词的库
  english_words：^3.1.0
  # 这个是图片选择的库
  image_picker: ^0.4.1

格式：库名称: ^库版本号

注意：冒号是中文标点，不要忘记^

可以在 pub.dartlang.org 上找到开源软件包。（需要翻墙）直接添加依赖，可能会很慢，

也可以直接去https://pub.dartlang.org/packages/ 查找想要的依赖库，直接下载压缩包，然后复制到以下路径：

C:\Users\XXX\AppData\Roaming\Pub\Cache\hosted\pub.dartlang.org\ (使用依赖库安装完成后的本地路径也是这个)
