import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_widget/view/XunkuPager2.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor:Color(0xFF00838F)),
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
            //这里给滑动的速度来设置一个阻尼速度的大小。-1.0如果动画完成了或者在开始前往运行过程时候阻尼速度为-1.0向下运行，当动画消失或者返回是速度为1.0正方形向上，
            animationController.fling(velocity: isPanelVisible ?-1.0 :1.0);
          },
          icon: new AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: animationController.view,
          ),
        ),
      ),
      body:new XuankuPage2(
        controllers: animationController,
      ),
    );
  }
}
/*new XuankuPage2(
        controllers: animationController,
      ),*/