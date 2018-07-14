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
        new ClipRect(
          child: new Align(
            alignment: Alignment.topLeft,
            heightFactor: 0.9,
            child: Image.asset('images/haha.png'),
          ),
        ),
        new ClipOval(
          child: new Image.asset('images/haha.png',width: 50.0,height: 50.0,),
        ),
      ]),
    );
  }
}
