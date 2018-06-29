import 'package:flutter/material.dart';
class systemPager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new systemPagerState();
  }

}

class systemPagerState extends State<systemPager>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blueGrey),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(child: new Text('系统学习')),
        ),
        body: new Center(
          child: new Text('这是第三个界面'),
        ),
      ),
    );
  }

}