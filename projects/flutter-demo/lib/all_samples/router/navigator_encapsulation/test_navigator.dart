import 'package:flutter/material.dart';
import 'navigator_util.dart';

void main() => runApp(MyApp());




RouteManager manager;
void data(BuildContext context){
  manager = new RouteManager(context);

  Map<String,Widget> routes = {
      '/data2':Page2(),
      '/data3':Page3(),
      '/data4':Page4(),
  };
 manager.putRoutesMap(routes);
}


RouteManager getData(){
  return manager;
}


class MyApp extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {

    data(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // 让路由管理更方便一些
      routes: getData().getRoutes(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                //Navigator.of(context).pushNamed('/data2');
                getData().pushNamed('/data2');
              },
              child: Text('打开Page2'),
            ),
            RaisedButton(
              onPressed: (){
                //Navigator.of(context).pushNamed('/data3');
                getData().pushNamed('/data3');
              },
              child: Text('打开Page3'),
            ),
            RaisedButton(
              onPressed: (){
                //Navigator.of(context).pushNamed('/data4');
                getData().pushNamed('/data4');
              },
              child: Text('打开Page4'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Text('hello');
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Text('hello');
  }
}

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Text('hello');
  }
}