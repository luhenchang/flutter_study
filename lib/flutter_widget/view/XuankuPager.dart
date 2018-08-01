import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_widget/view/XunkuPager2.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor:Color(0xFF00838F)),/*decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    begin:Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[
                      Color(0xFF00838F),
                      Color(0xFF4DD0E1)
                    ],
                  ),
                ),*/
      home: new XuankuPage(),
    ));

class XuankuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _XuankuPageState();
  }
}

class _XuankuPageState extends State<XuankuPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController?.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pictures"),
        elevation: 0.0,
        leading: new IconButton(
          onPressed: () {
            animationController.fling(velocity: isPanelVisible ? -1.0 : 1.0);
          },
          icon: new AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: animationController.view,
          ),
        ),
      ),
      body: new XuankuPage2(
        controller: animationController,
      ),
    );
  }
}
