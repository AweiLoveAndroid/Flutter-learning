# Android开发者参考

本文档来源于：http://doc.flutter-dev.cn/flutter-for-android/

英文原版请查看：https://flutter.io/flutter-for-android/

由于中文文档都是翻译自英文官网，未必是最新的。建议查看英文原版。

----

本文档适用于 Android 开发者，开发者们可以将现有的 Android 知识应用于 Flutter 并构建移动应用程序。如果你了解 Android 框架的基础知识，那么你可以将此文当做是 Flutter 开发的一个入门。

你现有的 Android 知识与技能对构建 Flutter 应用有非常高的价值。因为 Flutter 依靠操作系统提供了众多的功能和相关配置。Flutter 是一种为移动设备构建 UI 的新方法，但除了 UI 构建外它还有一套插件系统用于与 Android 或 iOS 系统进行通信。如果你是 Android 方面的专家，那么你就不必学习 Flutter 的所有内容了。

----

目录：

> ## 1、View
> #### Android 中的 View 在 Flutter 中对应什么？
> #### 如何更新 Widget ？
> #### 如果使用 Widget 进行布局？是否需要 XML 布局文件？
> #### 如何在布局中添加或移除部件？
> #### 在 Android 中可以使用 View.animate() 来让 View 产生动画，在 Flutter 中如何让 Widget 产生动画？
> #### 如何使用 Canvas 进行绘制？
> #### 如何构建自定义 Widget ？
> ## 2、Intents
> #### Android 中的 Intent 在 Flutter 中对应什么？
> #### 在 Flutter 中如何处理来自外部的 Intent ？
> #### startActivityForResult 在 Flutter 中如何实现？
> ## 3、UI 中的异步
> #### runOnUiThread 在 Flutter 中对应什么方法？
> #### Android 中的 AsyncTask 或 IntentService 在 Flutter 对应什么？
> #### Android 中的 OkHttp 在 Flutter 中对应什么？
> #### 在 Flutter 中，当有任务在执行时，如何显示进度？
> ## 4、项目结构与资源
> #### 分辨率相关的图像资源应存储在哪里（HDPI/XXHDPI）？
> #### 字符串如何存储，如何存储不同语言的字符串？
> #### Android 中的 Gradle 文件在 Flutter 中对应什么？
> ## 5、Activities 和 Fragments
> #### Android 中的 Activity 和 Fragment 在 Flutter 中对应什么？
> #### 如何监听 Android Activity 的生命周期？
> ## 6、布局
> #### Android 中的 LinearLayout 在 Flutter 中对应什么？
> #### Android 中的 RelativeLayout 在 Flutter 对应什么？
> #### Android 中的 ScrollView 在 Flutter 中对应什么？
> ## 7、手势检测和触摸事件处理
> #### 如何将一个 onClick 监听添加到 Flutter 中的 Widget 中？
> #### 如何处理 Widget 上的其他手势？
> ## 8、Listview 和 Adapter
> #### Android 中的 ListView 在 Flutter 中对应什么？
> #### 如何知道 ListView 的子项被点击了？
> #### 如何动态更新 ListView？
> ## 9、文本的使用
> #### 如何给 Text 自定义字体？
> #### 如何自定义 Text 的显示样式？
> ## 10、表单
> #### Android 中的 hint 在 Flutter 中对应什么？
> #### 如何显示表单验证错误信息？
> ## 11、Flutter 插件
> #### 如何使用 GPS ？
> #### 如何使用相机？
> #### 如果使用 facebook 登录？
> #### 如果构建自己的插件？
> #### 如何在 Flutter 中使用 NDK？
> ## 12、主题
> #### 如何定制 Material 风格的应用？
> ## 13、数据库与本地存储
> #### 如何在 Flutter 中使用 Shared Preferences？
> #### 在 Flutter 中如何使用 SQLite ？
> ## 14、通知
> #### 如何设置并推送通知？

----

## 1、View

> #### Android 中的 View 在 Flutter 中对应什么？

在 Android 中，View 是用于在屏幕上显示内容的基础。 如按钮，工具栏和输入框，这些都是 View 的具体实现。在 Flutter 中对应 View 的是 Widget。然而与 View 相比 Widget 有一些不同之处。首先 Widget 实例仅存在于每一帧之间，并且在每一帧之间 Flutter 都会主动创建一棵 Widget 树用于下一帧的渲染。相比之下，在 Android 上绘制 View 的时候，除非调用`invalidate`方法，否则视图不会进行重绘。

Android 中 View 是可变的，在 Flutter 中的 Widget 是不可变的。这种特性使得 Flutter 中的 Widget 变得十分轻量级。

> #### 如何更新 Widget ？

在 Android 中可以直接通过 View 来更新它们的状态。但是在 Flutter 中 Widget 是不可变的，所以不能直接通过 Widget 进行更新，如果需要更新 Widget 必须通过 State。

这里就引出了 `StatefulWidget` 和 `StatelessWidget` 两个部件。从字面理解，`StatelessWidget` 是没有内部状态的即不可变。而 `StatefulWidget` 具有状态，即是可刷新的。

当你构建的 UI 元素中有些部分是不变的，那么使用 StatelessWidget 是一个不错的选择。

例如在 Android 中你通常会将 App 的 logo 通过 ImageView 显示。而 logo 一般不会变，因此对应 Flutter 中你就可以使用 StatelessWidget 来显示你的 logo。

如果你想通过 HTTP 请求后获得的数据或用户交互来刷新 UI ，此时就需要使用 StatefulWidget 然后主动告诉 Flutter 底层 Widget 的状态发生了变化，只有如此 Flutter 才会刷新对应的 Widget。

这里有重要的一点需要注意，StatelessWidget 和 StatefulWidget 的核心内容是一致的，它们都会在每一帧中被重构，不同之处在于 StatefulWidget 有一个 State 对象，它可以为 StatefulWidget 在不同帧之间存储数据。

如果你还是有疑惑的话，只要记住如果一个 Widget 会变化，那么它就是有状态的。但是如果一个子 Widget 是有状态的，但是其父 Widget 是不可变的话父 Widget 也可以是 StatelessWidget 。

接下来看一下如何使用 StatelessWidget。Text 是一个常见的 StatelessWidget。如果查看其源码的话，会发现 Text 是 StatelessWidget 的子类

```Dart
new Text(
  'I like Flutter!',
  style: new TextStyle(
    fontWeight: FontWeight.bold,
  ),
);
```

如你所见，Text 没有任何状态信息，它仅仅是用于显示构造函数传递给它的信息。

但是如果想要通过点击一个按钮来改变 ‘I like Flutter!’ ，那该如何实现？

答案是可以使用 StatefulWidget 包裹 Text，并通过点击按钮来刷新 Text 的内容。

代码如下:

```
import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text
  String textToShow = "I Like Flutter";

  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(child: new Text(textToShow)),
      floatingActionButton: new FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}
```

> #### 如果使用 Widget 进行布局？是否需要 XML 布局文件？

在 Android 中通常使用 XML 来进行 UI 的布局，但在 Flutter 中 UI 的布局是通过在 dart 文件中构建 Widget 树来实现的。

下面是一个简单的例子用于在屏幕上居中显示一个按钮。

```
@override
Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Sample App"),
    ),
    body: new Center(
      child: new MaterialButton(
        onPressed: () {},
        child: new Text('Hello'),
        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
      ),
    ),
  );
}
```

可以在[http://doc.flutter-dev.cn/widgets/layout/](http://doc.flutter-dev.cn/widgets/layout/) 查看 Flutter 提供的所有布局:

> #### 如何在布局中添加或移除部件？

在 Android 中，你可以通过调用父布局的 addChild 或者 removeChild 来添加或移除子视图，但在 Flutter 中 Widget 是不可变的，所以没有 addChild 或 removeChild 方法。相反，你可以向父布局传入一个函数，该函数返回一个子 Widget 给父 Widget。并在该函数中通过一个 bool 值来控制子 Widget 的创建。

下面的例子展示了如果通过点按一个按钮来切换不同的子 Widget:

```
import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default value for toggle
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text('Toggle One');
    } else {
      return new MaterialButton(onPressed: () {}, child: new Text('Toggle Two'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}
```

> #### 在 Android 中可以使用 View.animate() 来让 View 产生动画，在 Flutter 中如何让 Widget 产生动画？

在 Flutter 中可以使用`animation`库让 Widget 产生动画效果。

在 Andorid 中，可以通过 XML 来创建动画，同样也可以在 View 上调用 animate() 方法产生动画。而在 Flutter 中则需要将 Widget 作为 AnimationWidget 的子节点产生动画。

与 Android 中类似，在 Flutter 中有 AnimationController 和 Interpolater，它们都扩展了 Animation 类。要实现动画可以将 AnimationController 和 Animation 传递给 AnimationWidget，并通过 AnimationController 来启动动画。

下面这个例子展示了如何编写一个带淡入淡出效果的动画：

```
import 'package:flutter/material.dart';

void main() {
  runApp(new FadeAppTest());
}

class FadeAppTest extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fade Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyFadeTest(title: 'Fade Demo'),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyFadeTest createState() => new _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new Container(
              child: new FadeTransition(
                  opacity: curve,
                  child: new FlutterLogo(
                    size: 100.0,
                  )))),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Fade',
        child: new Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}
```

查阅 [http://doc.flutter-dev.cn/widgets/animation/](http://doc.flutter-dev.cn/widgets/animation/) 和 [http://doc.flutter-dev.cn/widgets/animation/](http://doc.flutter-dev.cn/tutorials/animation) 了解更多关于动画的细节。

> #### 如何使用 Canvas 进行绘制？

在 Android 中可以使用 Canvas 进行自定义的绘制。

在 Flutter 中，`CustomPaint` 和 `CustomPainter` 两个类可以帮助你在 Canvas 上进行绘制。

查看下面链接，可以了解到如何使用上面提到的两个类实现一个签名功能：
https://stackoverflow.com/questions/46241071/create-signature-area-for-mobile-app-in-dart-flutter
示例代码：
```
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new DemoApp()));

class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) => new Scaffold(body: new Signature());
}

class Signature extends StatefulWidget {
  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];
  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
          referenceBox.globalToLocal(details.globalPosition);
          _points = new List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: new CustomPaint(painter: new SignaturePainter(_points)),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

```

> #### 如何构建自定义 Widget ？

在 Android 中通常通过继承 View 或其子类来构建自定义的 View。

在 Flutter 中构建自定义的 Widget 通常采用的是`组合其他 Widget` 的方式而非传统的继承。

下面看一下如何构建一个自定义的按钮，它将构造方法传入的文字作为自己按钮的文字进行显示。这里可以看到我们是通过将其两者进行组合来实现，而非继承 RaiseButton 来实现。

```
class CustomButton extends StatelessWidget {
  final String label;
  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: () {}, child: new Text(label));
  }
}
//接下来就可以像使用其他 Widget 一样来使用 CustomButton 了：
@override
  Widget build(BuildContext context) {
    return new Center(
      child: new CustomButton("Hello"),
    );
  }
}
```

## 2、Intents

> #### Android 中的 Intent 在 Flutter 中对应什么？

在 Android 中 Intent 主要有两种用途：在 Activity 之间切换和调用外部组件。Flutter 中没有 Intent 的概念，但如果需要的话 Flutter 可以通过插件的方式间接使用 Intent。

在 Flutter 中切换界面可以通过 `Route` 来实现。另外值得注意的是在管理 Flutter 中的多个界面的时候有两个重要的概念：`Route` 和 `Navigator`。一个 `Route` 就代表了一个界面（类似与 Activity），而 `Navigator` 则是一个管理 Route 的 Widget。Navigator 可以通过 `pop` 和 `push` 的方法在界面之间进行切换。

类似 Android 中可以在 AndroidManifest 中定义 Activity，在 Flutter 中可以将指定 Route 的映射集合添加到 MaterialApp 的根目录。

```
void main() {
  runApp(new MaterialApp(
    home: new MyAppHome(), // becomes the route named '/'
    routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => new MyPage(title: 'page A'),
      '/b': (BuildContext context) => new MyPage(title: 'page B'),
      '/c': (BuildContext context) => new MyPage(title: 'page C'),
    },
  ));
}
```

接着就可以通过如下方式来操作 Route。

    Navigator.of(context).pushNamed('/b');
    
Intent 另外一个比较实用的作用是调用外部组件，如 Camera 或文件选择器，如果要在 Flutter 中实现类似功能，你需要在平台代码中集成现有的库或重新实用。

查看 [开发扩展包](http://doc.flutter-dev.cn/developing-packages/) 章节查看如何集成平台本地功能。

> #### 在 Flutter 中如何处理来自外部的 Intent ？

Flutter 可以和 Android 层进行交互来共享传入的 Intent。

在下面的例子中，我们在 AndroidManifest.xml 中注册了发送文本的 Intent 过滤器，然后 App 的 Android 层就可以与 Flutter 层共享传入的文本。

下面例子的基本流程是首先我们处理 Android 层 Intent 传入的数据，然后当 Flutter 层发送请求时将文本通过 `MethodChannel` 传递给 `Flutter` 层。

首先在 AndroidManifest.xml 中注册 Intent。

```
<activity
    android:name=".MainActivity"
    android:launchMode="singleTop"
    android:theme="@style/LaunchTheme"
    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection"
    android:hardwareAccelerated="true"
    android:windowSoftInputMode="adjustResize">
    <!-- This keeps the window background of the activity showing
        until Flutter renders its first frame. It can be removed if
        there is no splash screen (such as the default splash screen
        defined in @style/LaunchTheme). -->
    <meta-data
       android:name="io.flutter.app.android.SplashScreenUntilFirstFrame"
       android:value="true" />
    <intent-filter>
       <action android:name="android.intent.action.MAIN"/>
       <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>
    <intent-filter>
       <action android:name="android.intent.action.SEND" />
       <category android:name="android.intent.category.DEFAULT" />
       <data android:mimeType="text/plain" />
    </intent-filter>
</activity>
```

接着在 MainActivity 中处理接收到的文本信息并保存下来，当 Flutter 层请求文本信息时将其传递给 Flutter 层即可。

```
package com.yourcompany.shared;

import android.content.Intent;
import android.os.Bundle;

import java.nio.ByteBuffer;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.ActivityLifecycleListener;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    String sharedText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        Intent intent = getIntent();
        String action = intent.getAction();
        String type = intent.getType();

        if (Intent.ACTION_SEND.equals(action) && type != null) {
            if ("text/plain".equals(type)) {
                handleSendText(intent); // Handle text being sent
            }
        }

        new MethodChannel(getFlutterView(), "app.channel.shared.data").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.contentEquals("getSharedText")) {
                    result.success(sharedText);
                    sharedText = null;
                }
            }
        });
    }


    void handleSendText(Intent intent) {
        sharedText = intent.getStringExtra(Intent.EXTRA_TEXT);
    }
}
```

最后在 Flutter 层，可以选择在 `initState` 中对文本进行请求。

```
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample Shared App Handler',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = "No data";

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new Center(child: new Text(dataShared)));
  }

  getSharedText() async {
    var sharedData = await platform.invokeMethod("getSharedText");
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}
```

> #### startActivityForResult 在 Flutter 中如何实现？

可以通过 Navigator 的 push 方法返回的 Futrue 来获得页面的返回数据。

例如你想启动一个地点选择的界面，然后从中获得用户选择的结果，可以使用如下方法：
```
Map coordinates = await Navigator.of(context).pushNamed('/location');
```

接着在地点选择界面，当用户选择完位置以后，可以调用如下方法把结果传递给上面的 `coordinates`。

```
Navigator.of(context).pop({"lat":43.821757,"long":-79.226392});
```

## 3、UI 中的异步

> #### runOnUiThread 在 Flutter 中对应什么方法？

Dart 是单线程执行模型、支持 Isolate（一种多线程模型）、事件循环和异步编程的。除非使用 Isolate，不然你的 Dart 代码都是在 UI 线程中进行并由事件循环器进行驱动。

例如你可以在 UI 线程执行网络请求而不会导致 UI 线程的阻塞：

```
loadData() async {
  String dataURL = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(dataURL);
  setState(() {
    widgets = JSON.decode(response.body);
  });
}
```

通过调用 setState 方法触发界面的重新构建来刷新并更新数据。

下面是一个完整的获得网络数据并在 ListView 上进行更新的例子：

```
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: new ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[i]["title"]}")
    );
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = JSON.decode(response.body);
    });
  }
}
```

> #### Android 中的 `AsyncTask` 或 `IntentService` 在 Flutter 对应什么？

在 Android 中进行网络操作时通常会使用 AsyncTask，以避免主线程遭到阻塞。与此同时 AsyncTask 会有一个线程池专门为你管理线程。

由于 `Flutter 是单线程并由事件驱动`（类似 Node.js），因此你不必为线程管理或需要类似的 AsyncTask 和 IntentService 而感到担忧。

需要异步执行的时候只要将方法声明为`异步方法`并在方法中使用 `await` 来等待即可。

```
loadData() async {
  String dataURL = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(dataURL);
  setState(() {
    widgets = JSON.decode(response.body);
  });
}
```

**以上就是你通常进行网络或数据库操作的方式。**

在 Android 中，当继承 AsyncTask 的时候，通常要重载它的 3 个方法，`OnPreExecute, doInBackground 和 onPostExecute`。而在 Flutter 中没有这种麻烦事，你要做的仅仅是 `await` 一个长时间的操作，剩下的事 `Dart 的事件循环机制`会帮你搞定。

但是，有时你可能会处理一些数据量较大较密集的操作，Flutter 的 UI 还是可能会受到影响。

在这种情况下，Flutter 中还是有和 AsyncTask 类似的解决方案。在 Flutter 中可以利用 `CPU 多核的性质来并行处理事务`，而这一工作则是由 `Isolate` 完成。

Isolate 是独立的执行线程，和主线程不共享任何内存。这意味着你不能在 Isolate 中给主线程的变量赋值或者调用 setState 方法来更新 UI。

让我们看一个 `Isolate` 的简单例子，学习下 `Isolate 如何与主线程交流并共享数据来更新 UI`：

```
loadData() async {
    ReceivePort receivePort = new ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    // The 'echo' isolate sends it's SendPort as the first message
    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");

    setState(() {
      widgets = msg;
    });
  }

// the entry point for the isolate
  static dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = new ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataURL = data;
      http.Response response = await http.get(dataURL);
      // Lots of JSON to parse
      replyTo.send(JSON.decode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
```

`dataLoader`方法在它独立的 `Isolate` 中运行，你可以在其中执行更多的 CPU 密集型处理，例如解析一万行以上的 JSON 数据或执行密集型数学计算。

可以参考下面完整的例子：

```
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:isolate';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }

    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: getBody());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    ReceivePort receivePort = new ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    // The 'echo' isolate sends it's SendPort as the first message
    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");

    setState(() {
      widgets = msg;
    });
  }

// the entry point for the isolate
  static dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = new ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataURL = data;
      http.Response response = await http.get(dataURL);
      // Lots of JSON to parse
      replyTo.send(JSON.decode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }

}
```

> #### Android 中的 OkHttp 在 Flutter 中对应什么？

在 Flutter 中使用`http`扩展库将使网络通信变得异常简单。

虽然 http 扩展库没有实现 OkHttp 的所有功能，但其抽象出了很多常用的功能，使得原本你要自己实现的网络调用变成一些极为简单的方法。
可以去pub上面下载，链接：https://pub.dartlang.org/packages/http

你也可以在 pubspec.yaml 添加 http 包的依赖来使用它：

```
dependencies:
  ...
  http: '>=0.11.3+12'
```

接着就可以进行网络请求了，如下：

```
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
[...]
  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = JSON.decode(response.body);
    });
  }
}
```

一旦得到了需要的数据，就可以通过调用 `setState` 方法通知 Flutter 将网络调用的结果更新到 UI 上。

> #### 在 Flutter 中，当有任务在执行时，如何显示进度？

在 Android 中，当你执行长时间的任务时，会在界面上显示一个进度指示器表明当前有任务在执行。

在 Flutter 中可以通过`进度指示器Widget`来实现。你可以通过一个 boolean 值来告诉 Flutter 是否需要显示进度指示器。

在下面这个例子中，我们将 build 方法分解为三个不同的方法。如果 showLoadingDialog 为 true 时显示进度指示器，否则将显示带有数据的 ListView：

```
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }

    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: getBody());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = JSON.decode(response.body);
    });
  }
}
```

## 4、项目结构与资源

> #### 分辨率相关的图像资源应存储在哪里（hdpi/xxhdpi）？

Flutter 遵循像 iOS 这样简单的3种分辨率格式：`1x`，`2x` 和 `3x`。

你可以创建一个名为 `images` 的文件夹，并为每个图像文件生成一个 @2x 和 @3x 的图像文件，并将它们放在对应文件夹中，像这样

```
../my_icon.png
../2.0x/my_icon.png
../3.0x/my_icon.png
```

接着在 `pubspec.yaml` 中声明这些图像资源。

```
assets:
 - images/a_dot_burr.jpeg
 - images/a_dot_ham.jpeg
```

然后就可以使用 `AssetImage` 来获得这些图形资源。
```
return new AssetImage("images/a_dot_burr.jpeg");
```

> #### 字符串如何存储，如何存储不同语言的字符串？

目前最佳方案就是创建一个 `Strings` 的类，并将字符串以静态字段的形式存储在其中：
```
class Strings{
  static String welcomeMessage = "Welcome To Flutter";
}
```
接着可以按**如下方式进行访问**：

    new Text(Strings.welcomeMessage)

Flutter 对 Android 资源的可访问性提供了基本的支持，但目前这个功能还在进行中。

Flutter 鼓励开发者使用 [intl package](https://pub.dartlang.org/packages/intl) 这个库 来进行`国际化和本地化`。

> #### Android 中的 Gradle 文件在 Flutter 中对应什么？

在 Android 中，你可以通过位于 Android 项目中的 Gradle 文件来添加依赖项。

在 Flutte 中，虽然在 Flutter 项目的 Android 文件夹下有 Gradle 文件，但`只有在添加平台集成所需的依赖时，才能使用这些Gradle文件`。否则，可以使用 `pubspec.yaml` 声明特定于 Flutter 的`外部依赖项`。

在 [Pub](https://pub.dartlang.org) 中可以找到很多使用的依赖库。

## 5、Activities 和 Fragments

> #### Android 中的 Activity 和 Fragment 在 Flutter 中对应什么？

在 Android 中 Activity 代表用户可完成一项特定功能或任务的界面。Fragment 代表了一种 UI 模块化的方式，用来为更大的屏幕构建更复杂的用户界面，并帮助在小屏幕和大屏幕之间扩展你的应用程序。在 Flutter 中这两者都属于 `Widget` 的概念。

> #### 如何监听 Android Activity 的生命周期？

在 Android 中可以通过重载生命周期方法来监听 Activity 的生命周期。

在 Flutter 中你可以通过注册到 `WidgetsBinding` 的观察者并通过监听 `didChangeAppLifecycleState` 来监听 Activity 的生命周期事件。

以下是你可以监听到的生命周期事件：

* `resumed`  应用程序可见并可以和用户进行交互，等价于 Android 中的 `onResume` 。
* `inactive`  应用程序处于非活动状态，并且无法与用户交互。此事件仅适用于 iOS 设备。
* `paused`  应用程序当前对用户不可见，无法与用户交互，并且在后台运行。等价于 Android 中的 `onPause`。
* `suspending`  应用程序将暂时中止。这在iOS上未使用。

示例如下：

```
import 'package:flutter/widgets.dart';

void main() {
  runApp(new Center(child: new LifecycleWatcher()));
}

class LifecycleWatcher extends StatefulWidget {
  @override
  _LifecycleWatcherState createState() => new _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecyleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecyleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_lastLifecyleState == null)
      return new Text('This widget has not observed any lifecycle changes.', textDirection: TextDirection.ltr);
    return new Text('The most recent lifecycle state this widget observed was: $_lastLifecyleState.',
        textDirection: TextDirection.ltr);
  }
}

```

## 6、布局

> #### Android 中的 LinearLayout 在 Flutter 中对应什么？

在 Android 中，使用 `LinearLayout` 使你的部件垂直或水平放置。在 Flutter 中，你可以使用 `Row` 或者 `Column` 来实现相同的效果。

注意到这两个代码示例中“Row”和“Column”结构异常相似。它们的 child 完全一致，可以利用这个特性在相同 child 的情况下开发丰富的布局。
```
//使用Row 横向布局
@override
Widget build(BuildContext context) {
  return new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Text('Row One'),
      new Text('Row Two'),
      new Text('Row Three'),
      new Text('Row Four'),
    ],
  );
}
```
```
//使用Column 纵向布局
@override
Widget build(BuildContext context) {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Text('Column One'),
      new Text('Column Two'),
      new Text('Column Three'),
      new Text('Column Four'),
    ],
  );
}
```

> #### Android 中的 RelativeLayout 在 Flutter 对应什么？

RelativeLayout 用于使你的 Widget 相对于彼此放置。在 Flutter 中，有几种方法可以实现相同的结果。

可以通过使用 `Column，Row和Stack等Widget的组合` 来实现 RelativeLayout 的效果。你可以为部件构造函数指定相对于父项布局的规则。

在 Flutter 中构建 RelativeLayout 的一个很好的例子：

[equivalent-of-relativelayout-in -flutter](https://stackoverflow.com/questions/44396075/equivalent-of-relativelayout-in -flutter)

> #### Android 中的 ScrollView 在 Flutter 中对应什么？

在 Android 中，ScrollView 允许你放置 Widget，以便在用户设备的屏幕比你的内容小的情况下可以进行滑动。

在 Flutter 中，最简单的方法是使用 `ListView` 。在 Flutter 中，`ListView 既是 ScrollView 又是 Android 中的 ListView`。

```
@override
Widget build(BuildContext context) {
  return new ListView(
    children: <Widget>[
      new Text('Row One'),
      new Text('Row Two'),
      new Text('Row Three'),
      new Text('Row Four'),
    ],
  );
}
```

## 7、手势检测和触摸事件处理

> #### 如何将一个 onClick 监听添加到 Flutter 中的 Widget 中？

在 Android 中，可以通过调用方法’setOnClickListener’将 OnClick 附加到按钮等视图上。

**在 Flutter 中，添加触摸监听器有两种方法：**

* 如果 Widget 支持事件检测，则可以将一个函数传递给它并进行处理。例如，RaisedButton 有一个 onPressed 参数

```
@override
Widget build(BuildContext context) {
  return new RaisedButton(
      onPressed: () {
        //这里编写点击事件操作逻辑或者传入一个点击事件操作逻辑的函数
        print("click");
      },
      child: new Text("Button"));
}
```

* 如果 Widget 不支持事件检测，则可以将该 Widget 包装到 GestureDetector 中，并将函数传递给 onTap 参数。

```
class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
      child: new GestureDetector(
        child: new FlutterLogo(
          size: 200.0,
        ),
        onTap: () {
         //这里编写点击事件操作逻辑或者传入一个点击事件操作逻辑的函数
          print("tap");
        },
      ),
    ));
  }
}
```

> #### 如何处理 Widget 上的其他手势？

使用 GestureDetector 我们可以监听广泛的手势，例如

点击

onTapDown 屏幕某一位置的手势按下事件。
onTapUp 屏幕某一位置的手势抬起事件。
onTap 屏幕某一位置的手势点击事件
onTapCancel 只产生 onTapDown 却没有产生 onTapUp 的事件。
双击

onDoubleTap 用户在同一位置进行两次快速点击。
长按

onLongPress 长时间点按屏幕某一点时产生的事件。
垂直拖动

onVerticalDragStart 屏幕上某一点开始垂直移动的事件。
onVerticalDragUpdate 屏幕上某一点垂直移动过程中的更新事件。
onVerticalDragEnd 屏幕上某一点停止垂直移动后的事件。
水平拖动

onHorizontalDragStart 屏幕上某一点开始水平移动的事件。
onHorizontalDragUpdate 屏幕上某一点水平移动过程中的更新事件。
onHorizontalDragEnd 屏幕上某一点停止水平移动后的事件。
例如下面这个例子使用 GestureDetector，通过双击 FlutterLogo 来使其旋转：

AnimationController controller;
CurvedAnimation curve;

@override
void initState() {
  controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new GestureDetector(
            child: new RotationTransition(
                turns: curve,
                child: new FlutterLogo(
                  size: 200.0,
                )),
            onDoubleTap: () {
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
        ),
    ));
  }
}

## 8、Listview 和 Adapter

> #### Android 中的 ListView 在 Flutter 中对应什么？

答案还是 ListView ！

在 Android 的 ListView 中，可以为 ListView 创建一个 Adapter，然后将它传递给 ListView，最后 ListView 使用 Adapter 返回的数据进行显示。然而，你必须确保对每一行 View 对象进行循环利用，否则，你会得到各种视图上的错乱和内存问题。

在 Flutter 中，由于 Flutters Widget 的不可变的特性，只需将一个 Widget 列表传递给 ListView，而 Flutter 将负责确保它们快速平滑地滚动。

import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new ListView(children: _getListData()),
    );
  }

  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row $i")));
    }
    return widgets;
  }
}

> #### 如何知道 ListView 的子项被点击了？

在 Android 中，ListView 有`onItemClickListener`方法可以用来监听哪个子项被点击。在 Flutter 中，你只需在传入的 Widget `外套一层 GestureDetector` 即可。

```
import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new ListView(children: _getListData()),
    );
  }

  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(new GestureDetector(
        child: new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new Text("Row $i")),
        onTap: () {
          print('row tapped');
        },
      ));
    }
    return widgets;
  }
}
```

> #### 如何动态更新 ListView？

在 Android 中，需要更新 Adapter 并调用 `notifyDataSetChanged` 来更新视图。在 Flutter 中，如果你在 `setState` 内更新 Widgets 列表的话会发现 ListView 不会有任何变化。

这是因为当 setState 被调用时，Flutter 渲染引擎会遍历所有的 Widget 以查看它们是否已经改变。当它判断 ListView 时，它将执行一个 == 操作符，并且发现前后两次的 ListView 是相同的并且没有改变，因此 UI 上不会有任何变化。

要更新 ListView 的话，可以在 **`setState` 中创建一个新的 widget 列表，并将所有旧数据复制到新列表中，并添加进新的 `widget`**，这是实现更新的简单方法之一。

```
import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new ListView(children: widgets),
    );
  }

  Widget getRow(int i) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text("Row $i")),
      onTap: () {
        setState(() {
          widgets = new List.from(widgets);
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }
}
```

这里强烈推荐使用 `ListView.builder`。当你拥有大量动态数据时，此方法是十分有效率的。 它实际上相当于在 Android 中使用 `RecyclerView`，它会自动重用列表元素：

```
import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: new ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text("Row $i")),
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }
}
```

这里并不是创建一个 ListView 对象，而是创建一个 `ListView.builder` ，它接受两个关键参数，即`列表的初始长度`和一个 `ItemBuilder` 函数。

ItemBuilder 函数非常类似于 Android Adapter 中的 `getView` 函数，它指定位置，然后你返回对应的 Widget 即可。

最后，如果注意到 `onTap` 函数，我们并没有像前面所说的重新创建 Widget 列表，而只是向其中添加了新元素。如果到这里你能理解，说明你对 ListView 掌握的差不多了。

## 9、文本的使用

> #### 如何给 Text 自定义字体？

在 Android SDK（从Android O（Android 8.0）开始）中，你可以创建一个 `Font` 资源文件并将其传递到 `TextView` 的 `FontFamily` 参数中以实现字体的自定义。

在 Flutter 首先需要把字体文件放在项目文件夹中（最好的做法是创建一个名为 `assets` 的文件夹）。

接下来在 `pubspec.yaml` 文件中声明字体

```
fonts:
   - family: MyCustomFont
     fonts:
       - asset: fonts/MyCustomFont.ttf
       - style: italic
```

最后在 Text 中使用该字体

```
@override
Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Sample App"),
    ),
    body: new Center(
      child: new Text(
        'This is a custom font text',
        style: new TextStyle(fontFamily: 'MyCustomFont'),
      ),
    ),
  );
}
```

> #### 如何自定义 Text 的显示样式？

除了自定义字体，还可以在 Text 上自定义很多不同的样式。

Text 的样式参数需要指定一个 TextStyle 对象，你可以在其中自定义许多参数，如

* color
* decoration
* decorationColor
* decorationStyle
* fontFamily
* fontSize
* fontStyle
* fontWeight
* hashCode
* height
* inherit
* letterSpacing
* textBaseline
* wordSpacing

## 10、表单

> #### Android 中的 hint 在 Flutter 中对应什么？
在 Flutter 中，可以通过向 TextField 的构造函数 decoration 赋值，来实现 hint 的显示。

```

body: new Center(
  child: new TextField(
    decoration: new InputDecoration(hintText: "This is a hint"),
  )
)
```

> #### 如何显示表单验证错误信息？

和显示 `hint` 一样简单，只需要使用 `TextField` 构造函数中的 `decoration` 参数就能显示表单的验证错误信息。

但是，你也不会希望一上来就显示错误，通常会在用户输入一些无效数据时才显示该错误。具体可以通过 `setState` 来更新组件并传递一个新的 InputDecoration 对象实现。

```
import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  String _errorText;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: new TextField(
          onSubmitted: (String text) {
            setState(() {
              if (!isEmail(text)) {
                _errorText = 'Error: This is not an email';
              } else {
                _errorText = null;
              }
            });
          },
          decoration: new InputDecoration(hintText: "This is a hint", errorText: _getErrorText()),
        ),
      ),
    );
  }

  _getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
}
```

## 11、Flutter 插件

> #### 如何使用 GPS ？

使用如下插件可以使用平台的 GPS。 [https://pub.dartlang.org/packages/location](https://pub.dartlang.org/packages/location)

> #### 如何使用相机？

使用如下插件来调用系统相机。 [https://pub.dartlang.org/packages/image_picker](https://pub.dartlang.org/packages/image_picker)

> #### 如果使用 facebook 登录？

使用如下依赖库来实现 facebook 登录。 [](https://pub.dartlang.org/packages/flutter_facebook_connect)

> #### 如果构建自己的插件？

如果 Flutter 或其社区没有你需要的插件，那么你可以按照 [http://doc.flutter-dev.cn/developing-packages/ .](http://doc.flutter-dev.cn/developing-packages/) 教程构建自己的插件。 

简而言之，Flutter 插件的架构就像在 Android 中使用 `Event bus` 一样：你可以发出消息并让接收者进行处理，最后接收者将结果发回给你。在这种情况下，接收者将是 iOS 或 Android 平台。

> #### 如何在 Flutter 中使用 NDK？

如果你在当前的 Android 应用程序中使用 NDK，并希望在 Flutter 应用程序中复用之前的 ndk 库，那么可以通过`构建自定义插件`来实现。

自定义插件首先会与你的 Android 应用程序交互，你可以在其中调用 native 方法。一旦 native 方法调用结束，你就可以将结果发回给 Flutter 并呈现结果。

## 12、主题

> #### 如何定制 Material 风格的应用？

Flutter 自带一套漂亮的 Material 风格组件，它满足了很多对于 Material 风格的需求。不同于 Android，需要使用 XML 声明主题，然后通过 AndroidManifest.xml 将其分配给应用程序。在 Flutter 中，可以通过顶层 Widget 来声明主题。

要充分利用应用程序中的 Material 风格的组件的话，可以把顶级部件 MaterialApp 作为应用程序的入口。MaterialApp 作为一个比较方便的部件，包装了许多实现了 Material 风格所需要的部件（如 Scaffold ）。MaterialApp 是在 WidgetsApp 的基础上进行实现的。

如果你不想使用 Material 风格的组件，那么你可以声明一个顶级 WidgetsApp，它是一个比较通用的类，它包装了一些应用程序通常需要的小部件。

要自定义 Material 组件的颜色和样式，你可以将 ThemeData 对象传递到 MaterialApp 构造函数中，例如在下面的代码中，可以看到将主色调设置为蓝色，并且所有文本选择颜色都设置为红色。

```
class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        textSelectionColor: Colors.red
      ),
      home: new SampleAppPage(),
    );
  }
}
```

## 13、数据库与本地存储

> #### 如何在 Flutter 中使用 Shared Preferences？

在 Android 中，可以使用 SharedPreferences API 来存储少量的键值对。

在 Flutter 中，可以通过 Shared Preferences 的插件 Shared_Preferences 来实现键值对的存储。

这个插件是通过包装 Shared Preferences 和 NSUserDefaults（与iOS相同）的功能来实现的。

```
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new RaisedButton(
            onPressed: _incrementCounter,
            child: new Text('Increment Counter'),
          ),
        ),
      ),
    ),
  );
}

_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  prefs.setInt('counter', counter);
}
```

> #### 在 Flutter 中如何使用 SQLite ？

在 Android 中，可以通过 SQL 语句查询 SQLite 中的结构化数据。

在 Flutter 中可以通过以下插件来使用 SQLite 的相关功能 SQFlite

## 通知

> #### 如何设置并推送通知？

在 Android 中，可以使用 Firebase 云消息为你的应用设置推送通知。

在 Flutter 中，你可以使用 Firebase_Messaging 插件 Firebase_Messaging 实现相同功能。
