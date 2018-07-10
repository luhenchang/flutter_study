import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_intent/view/interactioPager.dart';
import 'package:flutter_app/flutter_system/systemPager.dart';
import 'package:flutter_app/flutter_widget/WidgetPager.dart';
import 'package:flutter_app/flutter_widget/view/SmallWidget.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            body: new Container(
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new Stack(
              alignment: Alignment(1.0, 1.0),
              children: <Widget>[
                new GridView.builder(
                  gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 200/280,
                      mainAxisSpacing: 11.0, maxCrossAxisExtent: 210.0),
                  padding: new EdgeInsets.only(left: 20.0, right: 20.0),
                  itemBuilder: (BuildContext context, int index) {
                    return index < 0
                        ? Container(
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
                          )
                        : index == 11 || index == 10
                            ? new Container(
                                child: new Text('第二布局！'),
                                color: Colors.teal,
                              )
                            : new Container(
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
                                decoration:
                                    new BoxDecoration(color: Colors.teal),
                              );
                  },
                  itemCount: 20,
                ),
                new Container(
                  child: new Text('我能咖妃'),
                ),
              ],
            ),
          ),new Container(child: new Text('我爱你啊'),width: 600.0,height: 200.0,color: Colors.teal,)
        ],
      ),
    )));
  }
}
