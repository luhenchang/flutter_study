import 'package:flutter/cupertino.dart';
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
      body: ListView(children: <Widget>[
        new CustomPaint(
          foregroundPainter: new TextPaintCanves(),
          size: new Size(MediaQuery.of(context).size.width, 160.0),
          painter: new TextPaintCanves(),
        ),
        new Image.asset('images/haha.png'),
      ]),
    );
  }
}

class TextPaintCanves extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.yellow;
    TextPainter painter = new TextPainter();
    painter.textDirection = TextDirection.ltr;
    painter.maxLines = 1;
    painter.text = new TextSpan(
        text: "123456",
        style: TextStyle(fontSize: 16.0, color: Colors.redAccent));
    painter.layout();
    canvas.drawRect(
        new Rect.fromLTRB(0.0, 0.0, size.width, size.height), paint);
    canvas.clipRect(new Rect.fromLTRB(0.0, 0.0, size.width, size.height));
    canvas.scale(1.0,0.9);
    painter.paint(canvas, new Offset(size.width / 2,20.0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
