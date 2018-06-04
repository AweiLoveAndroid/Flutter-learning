yarn --version   查看yarn版本
node -v  查看nodejs版本
npm -v   查看npm版本（这个是nodejs安装包里面自带的工具）
flutter --version 查看flutter版本

git --version 查看git版本

$PSVersionTable  查看powershell版本

----

本电脑使用的版本为：
yarn 1.6.0
node v8.11.1
npm 5.6.0
Flutter 0.3.2
Dart 2.0.0-dev.48.0

powershell版本号相关信息：
PSVersion                      5.1.15063.1029
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.15063.1029
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1

----

系统要求：

要安装并运行Flutter，你的开发环境必须满足这些最低要求：

1、操作系统：Windows 7 SP1或更高版本（64位）
2、磁盘空间：400 MB（不包括IDE /工具的磁盘空间）。
3、工具：Flutter需要用到以下工具：
 * PowerShell 5.0或更新版本

查看PowerShell有没有安装，可以点击电脑左下角 --> 控制面板 --> 程序 --> 程序和功能，找一下PowerShell，
有时候安装了也可能找不到（我电脑就找不到），那就win + R,输入cmd回车，输入$PSVersionTable  查看powershell版本，
如果报错说明没有安装PowerShell，请点击https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell?view=powershell-6#upgrading-existing-windows-powershell

 * Git for Windows

windows安装文档请查看：https://flutter.io/setup-windows/
macos安装文档请查看：https://flutter.io/setup-macos/
linux安装文档请查看：https://flutter.io/setup-linux/


关于命令行无法显示某些字符或者中文乱码问题的解决：
1、无法显示√或者×字符
原因是点阵字体搞的鬼。设置一下控制台字体就可以了。
在控制台标题右键，选择字体，把点阵字体改为其他字体就可以了。
2、中文乱码的解决：
* win+R 输入regedit 进入注册表 
* 找到 HKEY_CURRENT_USER\Console\%SystemRoot%_system32_cmd.exe 
如果该项下已存在CodePage项，则把值改为十进制”65001”；
如果不存在，在该项下新建一个 DWORD（32位值），命名为“CodePage”，值设为“65001” 
* 重启cmd后生效

* win+R 输入regedit 进入注册表
* 找到 HKEY_CURRENT_USER\Console\%SystemRoot%_system32_WindowsPowerShell_v1.0_powershell.exe 下的项。
如果该项下已存在CodePage项，则把值改为十进制”65001”；
如果不存在，在该项下新建一个 DWORD（32位值），命名为“CodePage”，值设为“65001”
* 重启PowerShell后生效



Android Studio：需要安装3.0 或者更高的版本。
Flutter支持的sdk环境：Android 4.1（API 16）或者更高版本。
Android模拟器：推荐使用x86或者x86_64镜像。
