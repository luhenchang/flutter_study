import 'package:flutter/material.dart';
class SmallWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new SmallPagerState();
  }

}

class SmallPagerState extends State<SmallWidget>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blueGrey),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(child: new Text('小部件学习')),
        ),
        body: new Center(
          child: new Text('小部件学习界面'),
        ),
      ),
    );
  }

}