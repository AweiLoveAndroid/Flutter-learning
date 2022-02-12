# yarn nodejs npm flutter有关命令

----

## 一、几个常用的查看版本有关的命令

> yarn --version   查看yarn版本
> 
> node -v  查看nodejs版本
> 
> npm -v   查看npm版本（这个是nodejs安装包里面自带的工具）
> 
> flutter --version 查看flutter版本
> 
> git --version 查看git版本
> 
> $PSVersionTable  查看powershell版本


----


## 二、本电脑使用的相关工具版本：


工具名称|版本号相关信息：
-|-
yarn |1.7.0
node |v8.11.1
npm |6.1.0
Flutter |0.3.2
Dart |2.0.0-dev.48.0
**以下几个为powershell的版本信息：**|
**PSVersion**                      |**5.1.15063.1029**
**PSEdition**                      |**Desktop**
**PSCompatibleVersions**           |**{1.0, 2.0, 3.0, 4.0...}**
**BuildVersion**                   |**10.0.15063.1029**
**CLRVersion**                     |**4.0.30319.42000**
**WSManStackVersion**              |**3.0**
**PSRemotingProtocolVersion**      |**2.3**
**SerializationVersion**           |**1.1.0.1**


----


## 三、npm有关

> 查看npm版本

    npm -v 或者 npm --version

> 升级npm

    npm install npm@latest -g


----


## 四、yarn有关


> ### 1、yarn的安装路径


当我们安装了react native环境之后（我是通过执行npm install -g yarn react-native-cli命令安装的），
在C盘的这个目录下面有一个yarn目录：

`C:\Users\admin\AppData\Roaming\npm\node_modules\yarn\`

我电脑里面其实已经通过msi文件安装了一个yarn，路径为:
`E:\develop\yarn1.7.0\`


* 如果不知道路径，可以使用`where yarn`命令查看电脑yarn的安装路径，可以看到我的安装路如下：

```
C:\Users\admin\AppData\Roaming\npm\yarn
C:\Users\admin\AppData\Roaming\npm\yarn.cmd
E:\develop\yarn1.7.0\bin\yarn
E:\develop\yarn1.7.0\bin\yarn.cmd
E:\develop\yarn1.7.0\bin\yarn.js
```

> ### 2、查看yarn版本号：

执行 `npm view yarn version` 查看yarn版本号，当前的版本号为1.7.0

执行 `yarn -v`  查看安装的yarn版本号，我当前的版本为1.7.0

执行 `yarn --version`  查看安装的yarn版本号，我当前的版本为1.7.0

> ### 3、升级yarn版本号

###### 方式1：

通过msi安装的，可以卸载旧版本的yarn，然后官网下载新版的yarn，然后安装。

官网地址`https://yarnpkg.com/zh-hans/docs/install#windows-stable`

【注意】通过msi安装的yarn并不会覆盖通过npm安装的yarn，两者同时存在。卸载的话，也是分开卸载的。

###### 方式2：

* 命令行直接安装：

```
npm install yarn -g
```

* 加上版本号安装：

```
    npm install yarn@1.7.0 -g
```

* 加latest安装:

```
    npm install yarn@latest -g
```


----


## 五、加快react native启动的方式：

> 1、使用以下命令：

    npm config set registry=https://registry.npmmirror.com/


> 2、或者使用全局设置的命令：

    npm config set registry https://registry.npmmirror.com --global
    npm config set disturl https://npmmirror.com/dist --global


> 3、找到node.js的安装目录，进入nodejs\node_modules\npm找到文件npmrc，打开后在该文件末尾加上

    registry = https://registry.npmmirror.com

然后保存退出即可。


> 4、给yarn设置镜像：

    yarn config set registry https://registry.npmmirror.com --global
    yarn config set disturl https://npmmirror.com/dist --global