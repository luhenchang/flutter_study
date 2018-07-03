import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_intent/interactioPager.dart';
import 'package:flutter_app/flutter_system/systemPager.dart';
import 'package:flutter_app/flutter_widget/WidgetPager.dart';
import 'package:flutter_app/flutter_widget/small_widget/SmallWidget.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            body: new Container(
      child: new GridView.builder(
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 11.0, maxCrossAxisExtent: 210.0),
        padding: new EdgeInsets.only(left: 20.0, right: 20.0),
        itemBuilder: (BuildContext context, int index) {

          return Container(
            margin: new EdgeInsets.only(top: 5.0),
            child: new Card(
              child: Container(
                child: new Image.network(
                  "http://img.alicdn.com/imgextra/i4/1069988681/TB277mCgXooBKNjSZPhXXc2CXXa_!!1069988681.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            width: 100.0,
            height: 300.0,
            decoration: new BoxDecoration(color: Colors.teal),
          );
        },
        itemCount: 20,
      ),
    )));
  }
}
