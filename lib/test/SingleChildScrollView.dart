import 'package:flutter/material.dart';
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

class _MyHomePageState extends State<MyHomePager>
    with SingleTickerProviderStateMixin {
  RefreshIndicator refreshIndicator;
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
      body:
      new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: new ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: new IntrinsicHeight(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      // A fixed-height child.
                      color: Colors.yellow,
                      height: 80.0,
                    ),
                    new Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: new Container(
                        color: Colors.blue,
                        height: 120.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

