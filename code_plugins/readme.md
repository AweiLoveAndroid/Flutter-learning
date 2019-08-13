# README

[English](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/code_plugins/readme.md)|[中文文档](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/code_plugins/README-CN.md)

---

> Some Friends who use Flutter have a question, whether Android Studio or Intellij IDEA, they are not many of the shortcuts .Some friends are using the VSCode, maybe you can find the plugin to use, but it is not helpful for you. When you write some codes that you use every day, you can't use the shortcut to generate the code you want. So I wrote the common Flutter code live templates, and then you can use it in Android Studio, Intellij IDEA and VSCode.

### 1.Precautions

* 1.Do not make any changes to the settings.jar file, otherwise please re-download the settings.jar flie.
* 2.After importing, if the shortcut is not working, please check whether the code completions are correct in Android Studio or Intellij IDEA.

---

### 2.Set the fuzzy match:

> old version
Click menu bar `File → Settings → Editor → General → Code Completion → Case Sensitive Complete → NONE`

![](https://upload-images.jianshu.io/upload_images/6098829-183dce2a0499b0d6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/702/format/webp)

> new version

Click menu bar `File → Settings → Editor → General → Code Completion → Delete the check button in front of the Match cases`

![](https://upload-images.jianshu.io/upload_images/6098829-3194305ecb760fbe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/556/format/webp)

---

### 3.How to import a project?

> Import into Android Studio or Intellij IDEA

First open github [https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/code_plugins/settings.jar](https://github.com/AweiLoveAndroid/Flutter-learning/blob/master/code_plugins/settings.jar) and download the settings.jar file. The jar flie can be placed in any English file path.
Then, click the menu bar `File → Import Settings`, then find the `settings.jar` that you had downloaded and import it.

![](https://upload-images.jianshu.io/upload_images/6098829-450d5f8e17341ba7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/270/format/webp)

Then select the `live template` and `live template (schemes)` and click the `OK` button.

![](https://upload-images.jianshu.io/upload_images/6098829-5a16c2468a36d9d8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/541/format/webp)

**Tips: If you don't want to use  the keywords `new`, you should download the [](no_new_keywords/settings.jar) file, otherwise you should download the [](have_new_keywords/settings.jar) file.**

> Import into VSCode

For VSCode users, download the `dart.json` file and copy it to `C:\ Users\ Administrator \ AppData \ Roaming \ Code \ User \ Snippets \ directory (user is the username in the computer)`. If the file `dart.json` already exists, please replace it.

**Tips: If you don't want to use  the keywords `new`, you should download the [](no_new_keywords/dart.json) file, otherwise you should download the [](have_new_keywords/dart.json) file.**

---

4.Supported shortcuts

Short keys|Description
----|----
bab|	Create AnimatedBuilder
bu|	Create Build()
bufb|	Create FutureBuilder
bulb|	Create LayoutBuilder
buob|	Create OrientationBuilder
bustf|	Create StatefulBuilder
bustr|	Create StreamBuilder
cc|	Create CustomClipper
cen|	Create Center
col|	Create Column
con|	Create full Container
cp|	Create your CustomPainter
csv|	CustomScrollView + SliverPadding and its child with padding.
csv2|	use CustomScrollView + SliverGrid
gv|	Create GridView.count
inh|	Create Inherited
lv|	Create normal ListView
lvb|	Create ListView.builder
lvd	|Create ListView with divider
lvr|	Create RadioListTile
lvt|	Create ListView with more ListTile
mainstf	|Create  StatefulWidget
mainstl|	Create  StatelessWidget
me	|Create methods
mep|	Create private methods
row|	Create Row
sb	|Create SizedBox
ssv|	Create SingleChildScrollView
stanim|	Create Stateful（with AnimationController）
stf	|Create full StatefulWidget with full lifecycle
stl	|Create StatelessWidget
svc	|Create CustomScrollView
te|	Create normal Text

---

5.Some shortcuts usage

mainstf：

![](https://upload-images.jianshu.io/upload_images/6098829-a715d299b3c4d2b6.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/418/format/webp)

mainstl：

![](https://upload-images.jianshu.io/upload_images/6098829-2042bdf5fb3a157a.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/418/format/webp)

stf：

![](https://upload-images.jianshu.io/upload_images/6098829-7e796ef45a0d5cd6.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/418/format/webp)

stl：

![](https://upload-images.jianshu.io/upload_images/6098829-b1549c03b9a9b5ee.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/418/format/webp)

gv：

![](https://upload-images.jianshu.io/upload_images/6098829-6c5985388f267fdc.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/647/format/webp)

lv：

![](https://upload-images.jianshu.io/upload_images/6098829-04f30b3523027724.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/418/format/webp)

con:
![](https://upload-images.jianshu.io/upload_images/6098829-374bb9d45ba2e3ea.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/647/format/webp)
