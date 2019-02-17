# Flutter从配置安装到填坑指南详解

#### 本文同步发布在简书博客，更详细的请查看 [Flutter从配置安装到填坑指南详解](https://www.jianshu.com/p/399c01657920)

在 Google I/O ’17 上，Google 向我们介绍了 Flutter —— 一款新的用于创建移动应用的开源库。

Flutter是什么呢?它是Google使用Dart语言开发的移动应用开发框架，用来帮助开发者在iOS和Android平台上开发高性能、高质量的原生应用。Flutter是**跨平台的免费开源UI框架，iOS和Android可以共用一套代码**。

**Flutter是基于Dart语言编写的。主要优点：**

> 1. 免费开源
> 2. 利用保持状态的热重载（Hot Reload）、全新的响应式框架、丰富的控件以及集成的开发工具这些特点进行快速开发。
> 3. 通过可组合的控件集合、丰富的动画库以及分层可扩展的架构来实现富有感染力的灵活界面设计。
> 4. 借助可移植的 GPU 加速的渲染引擎以及高性能本地 ARM 代码运行时以达到跨设备跨平台的高质量用户体验。
> 5. **提高效率：使用一套代码同时开发Android和iOS。**
> 6. 可扩展性很强：Flutter框架本身提供了丰富的Material Design和Cupertino(iOS-flavor)风格的控件，可自由扩展控件不受手机平台控件的限制。

今年（2018年）2月，Flutter推出了第一个Beta版本。这真是个好事。期待正式版早日发布。最近研究了一下Flutter，这个工具从安装到运行经历了九九八十一难，好在终于成功运行起来了。下面看一下官方的Demo在Android模拟器的运行效果图：


![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/app.png?raw=true)


下面就 **详细的** 讲一下我的安装之路和遇到的一些问题：

#### 社会我韦哥，人好干货多。开始撸码！

----

###  一、Flutter安装：

要安装并运行Flutter，你的开发环境必须满足这些最低要求：

这里以windows系统为例：windows安装文档请查看：[https://flutter.io/setup-windows/](https://flutter.io/setup-windows/)

macos安装文档请查看：[https://flutter.io/setup-macos/](https://flutter.io/setup-macos/)

linux安装文档请查看：[https://flutter.io/setup-linux/](https://flutter.io/setup-linux/)


> （一） 操作系统：Windows 7 SP1或更高版本（64位）

略

> （二） 磁盘空间：400 MB（不包括IDE /工具的磁盘空间）。

略

> （三） 对Android Studio的要求：需要安装3.0 或者更高的版本。

略

> （四） Flutter支持的sdk环境：Android 4.1（API 16）或者更高版本。

略

> （五） 对Android模拟器镜像的要求：推荐使用x86或者x86_64镜像。

略

> （六） 工具：Flutter需要用到以下2个工具：

#####  (1) PowerShell 5.0或更新版本

查看PowerShell有没有安装，可以点击电脑`左下角` --> `控制面板` --> `程序` --> `程序和功能`，找一下PowerShell，有时候安装了也可能找不到（我电脑就找不到），那就`win + R`,输入`cmd`回车，输入`$PSVersionTable` ，查看powershell版本。
如果报错说明没有安装PowerShell，请点击powershell官网 https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell?view=powershell-6#upgrading-existing-windows-powershell

**【注意:】关于命令行无法显示某些字符或者中文乱码问题的解决：**
* 1、无法显示√或者×字符
原因是点阵字体搞的鬼。设置一下控制台字体就可以了。
在控制台标题右键，选择字体，把点阵字体改为其他字体就可以了。

* 2、cmd中文乱码的解决：

```
1. win+R 输入regedit 进入注册表 
2. 找到 `HKEY_CURRENT_USER\Console\%SystemRoot%_system32_cmd.exe` 
如果该项下已存在CodePage项，则把值改为十进制”65001”；
如果不存在，在该项下新建一个 DWORD（32位值），命名为“CodePage”，值设为“65001” 
3. 重启cmd后生效
```

* 3、PowerShell中文乱码的解决：

```
1. win+R 输入regedit 进入注册表
2. 找到 `HKEY_CURRENT_USER\Console\%SystemRoot%_system32_WindowsPowerShell_v1.0_powershell.exe` 下的项。
如果该项下已存在CodePage项，则把值改为十进制”65001”；
如果不存在，在该项下新建一个 DWORD（32位值），命名为“CodePage”，值设为“65001”
3. 重启PowerShell后生效

安装好之后，运行一下看看版本号，我这边的powershell版本号相关信息如下：

    PSVersion                      5.1.15063.1029
    PSEdition                      Desktop
    PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
    BuildVersion                   10.0.15063.1029
    CLRVersion                     4.0.30319.42000
    WSManStackVersion              3.0
    PSRemotingProtocolVersion      2.3
    SerializationVersion           1.1.0.1
```

#####  (2) Git for Windows

使用git命令行（关于如何使用git，请查看我的博文 **[Git及GitHub快速入门图文全面详解](https://www.jianshu.com/p/3f12bd3ccf2a)**）：

    git clone -b beta https://github.com/flutter/flutter.git

运行过程截图：

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/download-flutter.png?raw=true)

----

###  二、如果已经安装Fluttter，需要更新请看（不更新的就跳过此步）：

要同时更新Flutter SDK和包，请使用以下命令：

    flutter upgrade

----

###  三、配置环境变量

如果想在命令行中使用 flutter 命令，你需要添加flutter的路径到path中去。这个和配置java环境变量是同样的做法，找到flutter安装路径，比如我的是`E:\develop\flutter\bin`，我复制这个路径，右键`我的电脑`-->`属性`-->`高级系统属性`-->`环境变量`-->`找到PATH`，点击编辑-->在最后把刚复制的路径粘贴进来，-->一直`保存`确定就可以了。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/path1.png?raw=true)

接下来，使用`flutter --version` 查看一下版本号，看看环境变量配置好了没有。。如果如下图所示表示OK。

**【大坑】注意：如果只输入flutter  或者输入flutter -version   那么flutter以为是下达了自动更新命令，会自动更新最新版本，这个一定要注意了。**

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/path2.png?raw=true)

----

###  四、打开flutter命令行

win + R 快捷键，输入cmd，回车，输入`flutter doctor`，回车。

这个命令初次运行可能会很慢，Flutter会自动安装所需依赖，并进行编译。建议`科学上网`。

安装过程截图：


![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-dos1.png?raw=true)

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-dos2.png?raw=true)

**注意：**
[√]这个是安装OK的，[X]是需要安装的，或者是已安装但是没有运行起来的。（具体这里面有标记`[X]`的那些项如何安装后文有详细讲解，这里简单提一下。）

这里面有四项内容：

* （1）Flutter 这是Flutter工具，就是刚才git下载的那个。
* （2）Android工具链，这里指的是SDK，会标注出SDK的最大版本号。
* （3）IDE工具的对应版本，比如我的是Android Studio 2.2版本（这个是下载安装的版本），Android Studio 3.2版本（这个是免安装的版本，所以也会显示出来），还有Intellij IDEA
* （4）已连接的设备，可以是模拟器，也可以是真机，如果已连接会显示出来。

----

###  五、几个flutter常用命令

查看版本号的命令使用截图如下：

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-dos3.png?raw=true)

以下是常用命令：

常用命令|含义
-|-
**--version**|查看Flutter版本
**-h**或者**--help**|打印所有命令行用法信息
analyze |分析项目的Dart代码。
**build** | Flutter构建命令。
channel |列表或开关Flutter通道。
clean  |删除构建/目录。
config |配置Flutter设置。
**create**|创建一个新的Flutter项目。
**devices**|列出所有连接的设备。
**doctor**|展示了有关安装工具的信息。
drive|为当前项目运行Flutter驱动程序测试。
format|格式一个或多个Dart文件。
fuchsia_reload |在Fuchsia上进行热重载。
**help**|显示帮助信息的Flutter。
**install**|在附加设备上安装Flutter应用程序。
logs|显示用于运行Flutter应用程序的日志输出。
packages|命令用于管理Flutter包。
precache |填充了Flutter工具的二进制工件缓存。
run|在附加设备上运行你的Flutter应用程序。
screenshot|从一个连接的设备截图。
stop|停止在附加设备上的Flutter应用。
test|对当前项目的Flutter单元测试。
trace|开始并停止跟踪运行的Flutter应用程序。
**upgrade**|升级你的Flutter副本。

----

###  六、开发工具的安装

> （一）AS

Flutter对Android Studio的要求：需要安装`3.0` 或者`更高的版本`。

关于AS安装，这个就不用说了，大家都安装了吧，jdk,sdk这些都配置好了吧.直接看下文好了。

> （二） Flutter和Dart插件安装

Flutter需要`Flutter`和`Dart`插件才可以使用：

File --> settings --> Plugins --> Browse repositories，然后输入Flutter就可以下载了，Drat也是一样的道理。

* `Flutter`插件安装：

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/plugin-flutter.png?raw=true)

* `Dart`插件安装：

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/plugin-dart.png?raw=true)

安装好之后重启一下AS就可以使用插件了。

----

###  七、运行一个demo app

**Flutter支持的sdk环境：Android 4.1（API 16）或者更高版本。**
**Android模拟器：推荐使用x86或者x86_64镜像。**

创建project过程和普通安卓项目是很类似的。

> （一）打开AS，点击 File --> New Flutter Project，选择Flutter application ，点击next，输入一个工程名字

**注意：**项目名称必须是小写，单词之间用下划线隔开，你看我这样创建就给我提示错误了，报错的如图所示。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/app2.png?raw=true)

> （二）输入包名，点击next，点击finish，等待编译就可以了。如果没配置好，这个时候往往会报错。

**注意：**这里可以支持ios和kotlin，如果需要的话可以勾上。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/app3.png?raw=true)

> （三）首先模拟器，然后选择要运行的项目，注意了，这里有一个`MainActivity` 和 `main.dart`，选择`main.dart`，然后点击`绿色的三角号`图标运行（或者点击菜单栏    `Run`）就可以了。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/app4.png?raw=true)


我用的AS3.2，我截个图，菜单栏跟以前版本有点不同，之前的AS版本可以在Build菜单找到编译选项的。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/app5.png?raw=true)

如果代码有更改，可以点击`黄色的闪电图标`

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/app6.png?raw=true)

点击它之后就可以进行热加载。

----

###  八、遇到的一些问题：

> （一）卸载flutter相关环境

* 1. Dart的插件安装包在 C盘路径：
\AppData\Roaming\Pub\Cache\hosted\pub.dartlang.org文件夹里面
所以只需要找到Pub文件夹，删掉Pub文件夹。

* 2. flutter源代码文件，就是你在github下载下来的那个项目源代码，
比如我放在了E:\develop\flutter，我只需要把flutter这个文件夹删除就可以了。

* 3. C盘用户名下面有个.AndroidStudioXXX的文件夹，这个是AS的缓存目录，
比如我的是 C:\Users\luzhaowei\.AndroidStudio2.2
打开，找到插件目录 C:\Users\luzhaowei\.AndroidStudio2.2\config\plugins
把里面的Dart 和 flutter-intelliJ两个文件夹删掉

* 4. 把环境变量里面的flutter和dart有关的设置删掉。

----

> （二） 卸载flutter之后，命令行运行`flutter doctor`时，会有以下错误（以下是我的填坑指路全过程）：

**注意：由于下载的国外的网站上的资料，需要科学上网！！！**

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits1.png?raw=true)

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits2.png?raw=true)

我退出命令行再运行，还是照样出错。

后来我想是不是`BITS传输服务`未开启，于是我一顿操作猛如虎，操作如下，打开BITS：

    计算机 --> 右键 “管理” -->  服务和应用程序里面，点击“服务”，然后如下图所示：

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits3.png?raw=true)

然后选中图中标记的这个，右键点击“属性”，然后改成自动，确定。如下图所示：

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits4.png?raw=true)

然后我把刚下载的flutter文件夹删掉，重新执行git命令，下载flutter。（下好了之后记得配置环境变量）然后执行`flutter doctor` 命令，这次好一些了，但是命令行更新的很慢，一直停留在命令行，如图所示：

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits5.png?raw=true)

等了好久，终于出来了。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits6.png?raw=true)

然后又是漫长的等待，在下载Material fonts这里出错了,于是我关掉了命令行，重新打开命令行，执行`flutter doctor`命令。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits7.png?raw=true)

然后又是失败。。不等了，关闭命令行吧。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits8.png?raw=true)

然后重新打开命令行，执行`flutter doctor`命令。经历了几个小时的折腾，终于环境安装好了！
看到下面那个对勾，表示flutter已经更新完成了。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits9.png?raw=true)

然后重新打开命令行，执行`flutter doctor -v`命令，。看看还有什么需要安装的？（目前我安装的flutter最新版是0.4.4）,如下图所示：

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits10.png?raw=true)

**新版的跟旧版的有区别，这里的每一项里面的小项都很详细的列举了类目，只要是正确安装了IDE，以及配置了jdk,sdk环境的，都会详细列出来。**

**Flutter支持Android Studio、VSCode以及  [控制台+文本编辑器](http://doc.flutter-dev.cn/get-started/test-drive/#terminal) 的方式。如果你还安装了VSCode，命令行里面也会列举出来的。**

**【重点提示】按照提示来操作即可，哪个缺少（前面是 `X` 符号的）就配置哪一个。。一般来说，命令行会给你一些提示，比如需要使用什么命令操作，需要在哪个路径下面操作等。。**

##### 有3点需要特别注意的：

* 1) Flutter，这里面有4个工具，缺一不可：Flutter本身的安装包，Framework（这是flutter的核心代码部分），Engine（flutter的引擎），Dart sdk。

* 2) Android toolchain（开发Android设备的一些工具），这里是完整版的安装，有7个工具：sdk（sdk路径），ndk（ndk路径），Platform(android-27)以及build-tools（27.0.3），给sdk路径配置`ANDROID_HOME`环境变量，jdk配置路径，jdk运行环境版本，android licenses(协议)。

* 3) Android Studio环境，包括安装包路径，Flutter插件，Dart插件，AS自带jdk版本号。
我这里还安装了IDEA， 所以也会把它的环境列举出来。

下面是安装过程中出现的一些安装包缺少的问题：

**↓这个 问题的原因：**是sdk环境变量没配置，找到sdk路径，比如我的是E:\debelop\sdk，我复制这个路径，打开环境变量，新建一个变量，取名为`ANDROID_HOME`，然后在path变量里面最后加入`;%ANDROID_HOME\%` 

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits11.png?raw=true)

**↓这个 问题的原因：**一些android licenses没有同意，按上面的要求在命令行输入`flutter doctor --android-licenses`，回车，然后会出现要你输入y/n 你只要输入y 回车就好了。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits12.png?raw=true)

**↓其他问题：基本都是开发工具的配置了，这个就不多说了，大家应该很熟悉了。**

----

> （三） Flutter插件不支持当前AS版本。当前的AS是3.2，我的gradle编译的api是27的，可能Flutter目前最高只能支持26，果然我在build.gradle里面的编译版本改成了26，重新编译一下，OK了。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits13.png?raw=true)

----

> （四） 编译一个demo居然安装包是30多M，这个也太坑了吧。。安卓原生的apk包最多就几M。但是这是debug模式下的apk包，签名打包后的release版本的包很小，大概几兆的样子。

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits14.png?raw=true)

----

> （五）Flutter有一个Flutter Inspector的工具，主要是检查Widget的，可以用于诊断布局渲染问题，查看app当前的视图树结构。**但是：这个视图树层次太深了，看起来很费劲有木有。。 详细使用描述可以参考官网文档：[http://doc.flutter-dev.cn/inspector/](http://doc.flutter-dev.cn/inspector/)**

![默认的Demo运行图](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/pics/flutter-pits15.png?raw=true)

----

###  九、几个相关学习网站

> * Flutter源码github链接 [https://github.com/flutter/flutter](https://github.com/flutter/flutter)
> * Flutter官方文档 [https://flutter.io/docs/](https://flutter.io/docs/)
> * Dart语言官方主页 [https://www.dartlang.org/](https://www.dartlang.org/)

另外可以推荐下载nodejs和 yarn，以后使用yarn下载更新包很方便。（这个不是重点，了解就可以了）
> * yarn官网  https://yarnpkg.com/zh-Hans/
> * yarn中文网 https://yarn.bootcss.com/
> * nodejs中文官网 https://nodejs.org/zh-cn/

