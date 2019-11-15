import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 打造 Adobe 全家桶',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter 打造 Adobe 全家桶'),
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
  void initState() {
    super.initState();
  }

  Widget buildItems(
      String text, Color textColor, Color borderColor, Color bgColor,
      {bool showRectRadis = false}) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor, width: 5),
          borderRadius: showRectRadis == true
              ? BorderRadius.circular(15)
              : BorderRadius.circular(0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 35.0,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        children: [

          buildItems(
            'Ps',
            const Color(0XFF00C8FD),
            const Color(0XFF00C8FD),
            const Color(0XFF001C25),
            showRectRadis: true,
          ),
          buildItems(
            'Ai',
            const Color(0XFFFF7C00),
            const Color(0XFFFF7C00),
            const Color(0XFF271403),
          ),
          buildItems(
            'Id',
            const Color(0XFFDA007A),
            const Color(0XFFDA007A),
            const Color(0XFF412E34),
          ),
          buildItems(
            'Xd',
            const Color(0XFFFE2BC0),
            const Color(0XFFFE2BC0),
            const Color(0XFF2D001D),
            showRectRadis: true,
          ),
          buildItems(
            'Dw',
            const Color(0XFF35F900),
            const Color(0XFF35F900),
            const Color(0XFF072600),
          ),
          buildItems(
            'Bē',
            const Color(0XFFFFFFFF),
            const Color(0XFFFFFFFF),
            const Color(0XFF02ABF4),
          ),
          buildItems(
            'Br',
            const Color(0XFFFB9300),
            const Color(0XFFFB9300),
            const Color(0XFF261C00),
          ),
          buildItems(
            'Ch',
            const Color(0XFFDA91FF),
            const Color(0XFFDA91FF),
            const Color(0XFF26003B),
          ),
          buildItems(
            'Ic',
            const Color(0XFFFF5FF8),
            const Color(0XFFFF5FF8),
            const Color(0XFF2B0028),
          ),
          buildItems(
            'Lr',
            const Color(0XFF3CEEED),
            const Color(0XFF3CEEED),
            const Color(0XFF012225),
          ),
          buildItems(
            'Pr',
            const Color(0XFFEA77FE),
            const Color(0XFFEA77FE),
            const Color(0XFF290034),
          ),
          buildItems(
            'Ae',
            const Color(0XFFD190FE),
            const Color(0XFFD190FE),
            const Color(0XFF1F003F),
          ),
          buildItems(
            'Au',
            const Color(0XFF01E4BA),
            const Color(0XFF01E4BA),
            const Color(0XFF00251E),
          ),
          buildItems(
            'Pl',
            const Color(0XFF00DBFF),
            const Color(0XFF00DBFF),
            const Color(0XFF002026),
          ),
          buildItems(
            'An',
            const Color(0XFFFF4A19),
            const Color(0XFFFF4A19),
            const Color(0XFF260600),
          ),
          buildItems(
            'Cf',
            const Color(0XFFCADBFE),
            const Color(0XFFCADBFE),
            const Color(0XFF000F34),
          ),
          buildItems(
            'Cp',
            const Color(0XFF00E778),
            const Color(0XFF00E778),
            const Color(0XFF00120A),
          ),
          buildItems(
            'Sp',
            const Color(0XFFFFF7CC),
            const Color(0XFFFFD70D),
            const Color(0XFF262002),
            showRectRadis: true,
          ),
          buildItems(
            'Dn',
            const Color(0XFFD4FCEF),
            const Color(0XFF3CF2A6),
            const Color(0XFF00261A),
            showRectRadis: true,
          ),
          buildItems(
            'St',
            const Color(0XFFFD4286),
            const Color(0XFFFD4286),
            const Color(0XFF1F0101),
          ),
          buildItems(
            'Ru',
            const Color(0XFFECD9FF),
            const Color(0XFFC993FF),
            const Color(0XFF260D40),
            showRectRadis: true,
          ),
          buildItems(
            'Sc',
            const Color(0XFFC1B2D2),
            const Color(0XFFC1B2D2),
            const Color(0XFF302A36),
          ),
          buildItems(
            'Fb',
            const Color(0XFFD1C4C3),
            const Color(0XFFD1C4C3),
            const Color(0XFF2B2728),
          ),
          buildItems(
            'Fw',
            const Color(0XFFE4EB00),
            const Color(0XFFE4EB00),
            const Color(0XFF3E3A26),
          ),
          buildItems(
            'Sg',
            const Color(0XFF04F7F6),
            const Color(0XFF04F7F6),
            const Color(0XFF002726),
          ),
          buildItems(
            'Fs',
            const Color(0XFFF98A00),
            const Color(0XFFF98A00),
            const Color(0XFF261600),
          ),
          buildItems(
            'Mu',
            const Color(0XFFC1E702),
            const Color(0XFFC1E702),
            const Color(0XFF1D2304),
          ),
          buildItems(
            'Fl',
            const Color(0XFFF1201B),
            const Color(0XFFF1201B),
            const Color(0XFF482D29),
          ),
          buildItems(
            'Ul',
            const Color(0XFFF2F7F2),
            const Color(0XFF35811F),
            const Color(0XFF35811F),
          ),
          buildItems(
            'PM',
            const Color(0XFF434646),
            const Color(0XFF969B37),
            const Color(0XFF969B37),
          ),
          buildItems(
            'Sb',
            const Color(0XFFF3F3EF),
            const Color(0XFF605B3A),
            const Color(0XFF605B3A),
            showRectRadis: true,
          ),

        ],
      ),
    );
  }

}