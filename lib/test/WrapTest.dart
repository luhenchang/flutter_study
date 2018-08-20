import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new WrapTest(),
  ));
}

class WrapTest extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<WrapTest> {
  List<Widget> mList;
  List boshlit = new List<BoxShadow>();

  @override
  void initState() {
    boshlit.add(
      new BoxShadow(offset: Offset(0.0, 0.0), color: Colors.redAccent),
    );
    mList = new List();
    for (var i = 0; i < 14; i++) {
      mList.add(
        new Container(
          child: new Row(
            children: <Widget>[
              Icon(
                Icons.important_devices,
                size: 15.0,
              ),
              Text('五牛')
            ],
          ),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
        ),
        /* Wrap({
    Key key,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    List<Widget> children = const <Widget>[],
  }) : super(key: key, children: children);*/
        body: Wrap(
          children: List.generate(
            20,
            (i) => Container(
                margin: new EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  /**/

                 // boxShadow: boshlit,
                  color: Color(0xFFEEEEEE),
                  border: Border(
                      left: BorderSide(
                          color:Color(0xFFE0F7FA), width: 11.9),
                      right: BorderSide(
                          color:Color(0xFFE0F7FA), width: 11.9)),
                ),
                child: ListTile(
                  contentPadding: new EdgeInsets.all(10.9),
                  leading: Icon(Icons.important_devices),
                  title: Text('haha'),
                )),
          ),
        ));
  }
}
