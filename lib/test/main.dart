import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_intent/view/interactioPager.dart';
import 'package:flutter_app/flutter_system/systemPager.dart';
import 'package:flutter_app/flutter_widget/WidgetPager.dart';
import 'package:flutter_app/flutter_widget/view/SmallWidget.dart';

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

class _MyHomePageState extends State<MyHomePager>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
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
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new WidgetPager(),
          new interactionPager(),
          new systemPager(),
        ],
      ),
      bottomNavigationBar: new  Material(
        color: Colors.blueGrey,
        child: new Container(
          padding: new EdgeInsets.all(6.0),
          color: Colors.blueGrey,
          child: new TabBar(
            indicatorWeight: 0.01,
            indicatorColor: Colors.blueGrey,
            controller: controller,
            tabs: <Widget>[
              new Tab(
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.home,
                      size: 20.0,
                    ),
                    new Text('布局'),
                  ],
                ),
              ),
              new Tab(
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.message,
                      size: 20.0,
                    ),
                    new Text('交互'),
                  ],
                ),
              ),
              new Tab(
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.person,
                      size: 20.0,
                    ),
                    new Text('系统'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
