import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_widget/view/RowAndColumWidget.dart';
import 'package:flutter_app/flutter_widget/view/SimpleWidgets.dart';
import 'package:flutter_app/flutter_widget/view/SmallWidget.dart';
import 'package:flutter_app/test/layout_study01.dart';
//TODO 1.0--------------------开始------------------------------------
//这里是给第一个图片加一个动画。从00到它展开
class ImageAnimal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ImageWidgetState();
  }
}

class AnimalWidgets extends AnimatedWidget {
  AnimalWidgets({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      width: animation.value,
      child: Image.asset(
        'images/long_wuman1.jpg',
        width: 600.0,
        height: 120.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ImageWidgetState extends State<ImageAnimal>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 600.0).animate(controller)
      ..addStatusListener(/*(statu)=>print('$statu')*/ (status) {
        //这里会让动画一直执行很烦的,官方文档这里做过演示的
        /* if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }*/
      })
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    //通过AnimatedWidget进行封装起来。AnimatedWidget类允许您从setState()调用中的动画代码中分离出窗口小部件代码。AnimatedWidget不需要维护一个State对象来保存动画。
    //在下面的重构示例中，LogoApp现在来自AnimatedWidget而不是StatefulWidget。AnimatedWidget在绘制时使用动画的当前值。LogoApp仍然管理着AnimationController和Tween。
    return new AnimalWidgets(
      animation: animation,
    );
    /*
      //这里没有封装的:
      return Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      height: animation.value/3,
      width: animation.value,
      child: Image.asset(
        'images/long_wuman1.jpg',
        width: 600.0,
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );
   */
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
//TODO 1.0--------------------结束------------------------------------

//TODO 2.0--------------------开始-----------------------------------------

//这里分模块学习Flutter
//TODO 2.0--------------------结束-----------------------------------------
class WidgetStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WidgetStudyState();
  }
}

class WidgetStudyState extends State<WidgetStudy> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.0,
      height: 188.0,
      color: Colors.white,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Row(
              //第一行
              children: <Widget>[
                new Container(
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (_) {
                          return new SmallWidget();
                        },
                      )); //页面跳转
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Icon(
                            Icons.widgets,
                            color: Color(0xFF00796B),
                          ),
                          new Text('小部件',
                              style: new TextStyle(
                                  color: Color(0xFF00796B), fontSize: 12.0))
                        ],
                      ),
                      margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    ),
                    disabledColor: Colors.white,
                    color: Colors.white,
                  ),
                  padding: new EdgeInsets.only(left: 31.0),
                  decoration: new BoxDecoration(color: Colors.white),
                ),
                new Container(
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return new RowAndColumWidget(index: 0,);
                            },
                          )); //页面跳转
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Icon(
                            Icons.move_to_inbox,
                            color: Color(0xFF00796B),
                          ),
                          new Text('布局摆放',
                              style: new TextStyle(
                                  color: Color(0xFF00796B), fontSize: 12.0))
                        ],
                      ),
                      margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    ),
                    disabledColor: Colors.white,
                    color: Colors.white,
                  ),
                  padding: new EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(color: Colors.white),
                ),
                new Container(
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return new SimpleWidgets(index: 2,title:'案例一');
                            },
                          )); //页面跳转
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Icon(
                            Icons.widgets,
                            color: Color(0xFF00796B),
                          ),
                          new Text('案例一',
                              style: new TextStyle(
                                  color: Color(0xFF00796B), fontSize: 12.0))
                        ],
                      ),
                      margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    ),
                    disabledColor: Colors.white,
                    color: Colors.white,
                  ),
                  padding: new EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(color: Colors.white),
                ),
              ],
            ),
            width: 700.0,
            padding: new EdgeInsets.only(left: 8.0),
            decoration: new BoxDecoration(color: Colors.white),
          ),
          new Container(
            child: new Row(
              //第一行
              children: <Widget>[
                new Container(
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return new SimpleWidgets(index:3,title:'案例二');
                            },
                          )); //页面跳转
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Icon(
                            Icons.widgets,
                            color: Color(0xFF00796B),
                          ),
                          new Text('案例二',
                              style: new TextStyle(
                                  color: Color(0xFF00796B), fontSize: 12.0))
                        ],
                      ),
                      margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    ),
                    disabledColor: Colors.white,
                    color: Colors.white,
                  ),
                  padding: new EdgeInsets.only(left: 31.0),
                  decoration: new BoxDecoration(color: Colors.white),
                ),
                new Container(
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return new SimpleWidgets(index:4,title:'最终案例');

                            },
                          )); //页面跳转
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Icon(
                            Icons.move_to_inbox,
                            color: Color(0xFF00796B),
                          ),
                          new Text('大杂烩',
                              style: new TextStyle(
                                  color: Color(0xFF00796B), fontSize: 12.0))
                        ],
                      ),
                      margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    ),
                    disabledColor: Colors.white,
                    color: Colors.white,
                  ),
                  padding: new EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(color: Colors.white),
                ),
                new Container(
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return new SimpleWidgets(index:5,title:'3D实现');

                            },
                          )); //页面跳转
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Icon(
                            Icons.widgets,
                            color: Color(0xFF00796B),
                          ),
                          new Text('更新..',
                              style: new TextStyle(
                                  color: Color(0xFF00796B), fontSize: 12.0))
                        ],
                      ),
                      margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    ),
                    disabledColor: Colors.white,
                    color: Colors.white,
                  ),
                  padding: new EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(color: Colors.white),
                ),
              ],
            ),
            width: 700.0,
            padding: new EdgeInsets.only(left: 8.0),
            decoration: new BoxDecoration(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class WidgetPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FirstPageState();
  }
}

class FirstPageState extends State<WidgetPager> {
  @override
  Widget build(BuildContext context) {
    //TODO 第二个布局
    Widget titleSection = new Container(
      //距离每个边缘四周31像素
      margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 1.0),
      child: new Card(
        //最外层为一行包裹里面的
        child: new Row(
          //里面包含三个大布局子控件控件【两行文字,文字,五角星】
          children: <Widget>[
            //TODO 第一个子控件里面两行字体,让其占用多余的控件，这样右边的控件所占之外的所有控件都被他所占用这样展开的更长不然右边控件会往左边跑。
            new Container(
              margin: new EdgeInsets.only(
                  left: 18.0, top: 8.0, right: 48.0, bottom: 8.0),
              //这个列里面装两行文字
              child: new Column(
                //文字从这个左边开始
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    //距离下面一个文字8像素
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      'Flutter-三方面入手:布局，交互，系统',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //第二行灰色的文字标题,当然了这里可以直接去掉new Container因为不需要修改
                  new Container(
                      //这里不需要距离上下边距。所以new Container是可以不用写的哦
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: new Text(
                        'Flutter开始篇章',
                        style: new TextStyle(color: Colors.grey[500]),
                      )),
                ],
              ),
            ),
            //TODO 第二个五角星
          ],
        ),
      ),
    );
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blueGrey),

      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(child: new Text('三天搞定Flutter')),
        ),
        body: new Container(
            //第一个界面首页可能放的东西比较多，所以这里我用了android原生里面的ScrollView同样的小部件ListView
            child: new ListView(
          children: <Widget>[
            new ImageAnimal(),
            titleSection,
            WidgetStudy(),
          ],
        )),
      ),
    );
  }
}
