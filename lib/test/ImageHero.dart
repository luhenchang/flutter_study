import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_app/test/SlivScrollListViewTabLayout.dart';

void main() {
  runApp(new MaterialApp(
    theme: new ThemeData(
      primaryColor: Color(0xFF00838F),
      primarySwatch: Colors.purple,
      accentColor: Colors.orangeAccent[400],
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: "haha",
          child: InkWell(
            child:Image.network('https://github.com/luhenchang/flutter_study/blob/master/images/long_wuman.jpeg?raw=true',height:220.0,width:110.0,fit:BoxFit.cover,),
            onTap: () {
              Navigator.of(context).push(new PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) {
                     // return new MyAppsss();
                    },
                  ));
            },
          )),
    );
  }
}
