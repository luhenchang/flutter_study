import 'package:flutter/material.dart';
class interactionPager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new interactionPagerState();
  }

}

class interactionPagerState extends State<interactionPager>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blueGrey),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(child: new Text('交互学习')),
        ),
        body: new Center(
          child: new Text('儿歌'),
        ),
          bottomNavigationBar:null,
      ),
    );
  }

}