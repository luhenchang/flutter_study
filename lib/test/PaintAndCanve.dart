import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'app',
      theme: new ThemeData(primaryColor: Colors.blueGrey),
      home: new MyHomePager(),
    ),
  );
}

class MyHomePager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

class Pontt {
  double a, b;

  Pontt(this.a, this.b);
}

class _MyHomePageState extends State<MyHomePager>
    with SingleTickerProviderStateMixin {
  RefreshIndicator refreshIndicator;
  TabController controller;
  List<Pontt> mlist;

  @override
  void initState() {
    super.initState();
    mlist = [Pontt(0.9, 1.0), Pontt(0.1, 1.0), Pontt(0.5, 0.8)];
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    //页面失去焦点时候
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.only(top: 30.0),
          child: CustomPaint(
            painter: new Sky(),
            child: new Center(
              child: new Text(
                '自定义长方形上面绘制文字...',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ),
        //自定义图片背景
        Padding(
          padding: new EdgeInsets.only(top: 50.0),
          child: new CustomPaint(
            painter: new Circles(),
            child: new Center(
              child: new CircleAvatar(
                backgroundImage: AssetImage('images/lonnv8.jpg'),
                radius: 10.0,
              ),
            ),
          ),
        ),

        //自定义图片背景
        Padding(
          padding: new EdgeInsets.only(top: 50.0),
          child: new CustomPaint(
            child: new Center(
              child: new CircleAvatar(
                backgroundImage: AssetImage('images/lonnv8.jpg'),
                radius: 50.0,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = new Rect.fromLTRB(0.0, 0.0, size.width, size.height + 10);
    var paint = new Paint();
    paint.color = Colors.orange;
    canvas.drawRect(rect, paint);
  }

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(Sky oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}

class Circles extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = Colors.orange;
    canvas.drawCircle(new Offset(size.width / 2, size.height / 2), 13.0, paint);
  }

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(Circles oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(Circles oldDelegate) => false;
}


