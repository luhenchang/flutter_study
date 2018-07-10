import 'package:flutter/material.dart';

//TODO------------------- 布局二动画------------------------
class AnimalExaple extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AnimalExapleState();
  }
}

class AnimalExapleState extends State<AnimalExaple>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    //来个控制器
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    //来个补间动画0-300在2秒内完成。
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    //监听然后去更新重新绘制。
    animation.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    });
    controller.forward();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: animation.value,
      width: animation.value,
      child: Image.asset('images/haha.png',width:600.0,height:200.0,fit: BoxFit.fitWidth,),
    );
  }
}

//TODO-------------------------------------END--------------------

class interactionPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new interactionPagerState();
  }
}

class interactionPagerState extends State<interactionPager> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Color(0xFF00796B)),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                new Container(
                  child: Text('动画交互学习'),
                  margin: new EdgeInsets.only(left: 70.0),
                ),
              ],
            ),
          ),
        ),
        body: new Container(
          color: Colors.teal,
          child: new ListView(
            children: <Widget>[
              new Container(
                child: Text(
                  '      Flutter动画是一大模块，这里由于时间问题，下面写一个官方的动画，我想发表这篇文章，所以后面的我会在github地址上进行更新代码。',
                  style: new TextStyle(color: Colors.white),
                ),
                margin: new EdgeInsets.only(top: 20.0),
              ),
              AnimalExaple(),
            ],
          ),
        ),
      ),
    );
  }
}
