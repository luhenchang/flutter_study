import 'dart:async';
import 'dart:io';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_intent/NetDataPager.dart';
import 'package:flutter_app/flutter_intent/interactioPager.dart';
import 'package:flutter_app/flutter_system/systemPager.dart';
import 'package:flutter_app/flutter_widget/WidgetPager.dart';
import 'package:flutter_app/flutter_widget/small_widget/SmallWidget.dart';
import 'package:flutter_app/flutter_widget/WidgetText.dart';
import 'package:image_picker/image_picker.dart';

class WidgetPagers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FirstPageState();
  }
}

class FirstPageState extends State<WidgetPagers> {
  @override
  Widget build(BuildContext context) {
    //TODO 第二个布局
    return new Container(
      //距离每个边缘四周32像素
      margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 1.0),
      child: new Card(
        //最外层为一行包裹里面的
        child: new Row(
          //里面包含三个大布局子控件控件【两行文字,文字,五角星】
          children: <Widget>[
            //TODO 第一个子控件里面两行字体,让其占用多余的控件，这样右边的控件所占之外的所有控件都被他所占用这样展开的更长不然右边控件会往左边跑。
            new Container(
              margin: new EdgeInsets.only(
                  left: 9.0, top: 8.0, right: 45.0, bottom: 5.0),
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
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'app',
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF00796B),
        accentColor: Colors.deepOrangeAccent,
      ),
      home: new MyHomePager(),
    ),
  );
}

class ParentWidget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ParentWidgetStates();
  }
}

class ParentWidgetStates extends State<ParentWidget1> {
  bool _isParent = false;

  void _onChanged(bool _getvalue) {
    setState(() {
      _isParent = _getvalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(active: _isParent, onChanged: _onChanged),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaboxcState();
  }
}

class _TaboxcState extends State<TapboxC> {
  bool _hightList = false;

  void _handleTapDown(TapDownDetails details) {
    //按下过程效果
    setState(() {
      _hightList = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    //抬起过程效果
    setState(() {
      _hightList = false;
    });
  }

  void _handleCancle() {
    setState(() {
      _hightList = false;
    });
  }

  void _handleTap() {
    //最终效果
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleCancle,
      onTap: _handleTap,
      /*
       * */
      child: new Container(
        //中间字体
        child: new Center(
          child: new Text(
            widget.active ? '混搭管理方法' : 'so easy',
            style: new TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w400,
                color: widget.active ? Colors.white : Colors.deepOrangeAccent),
          ),
        ),
        width: 600.0,
        height: 50.0,
        //盒子来了，变色
        decoration: new BoxDecoration(
          color: widget.active ? Color(0xFF00796B) : Colors.tealAccent,
          border: _hightList
              ? new Border.all(color: Colors.tealAccent[700], width: 10.0)
              : null,
        ),
        //这里是边框变化
      ),
    );
  }
}

//TODO -------------------------首页交互界面----------------------------START
//TODO 布局一
class FrgmentPagerSecondWidget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FragmentPagerSendcondWidgetState();
  }
}

class FragmentPagerSendcondWidgetState
    extends State<FrgmentPagerSecondWidget1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).push(new PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return new interactionPager();
                      },
                    ));
              });
            },
            child: Container(
              child: new Column(
                children: <Widget>[
                  new Icon(
                    Icons.mood,
                    size: 30.0,
                    color: Colors.redAccent,
                  ),
                  new Container(
                    child: new Text(
                      '动画',
                      style:
                          new TextStyle(color: Colors.black54, fontSize: 13.0),
                    ),
                    margin: new EdgeInsets.all(10.0),
                  ),
                ],
              ),
              margin: new EdgeInsets.only(top: 20.0, bottom: 9.0),
            ),
          ),
          new GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).push(new PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return new NetDataPager(index: 0);
                      },
                    ));
              });
            },
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Icon(
                    Icons.access_alarm,
                    size: 30.0,
                    color: Colors.orangeAccent,
                  ),
                  new Container(
                    child: new Text(
                      '网络交互',
                      style:
                          new TextStyle(color: Colors.black54, fontSize: 13.0),
                    ),
                    margin: new EdgeInsets.all(10.0),
                  ),
                ],
              ),
              margin: new EdgeInsets.only(top: 20.0, bottom: 9.0),
            ),
          ),
          new GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).push(new PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return new NetDataPager(index: 1);
                      },
                    ));
              });
            },
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Icon(
                    Icons.send,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                  new Container(
                    child: new Text(
                      '传值',
                      style:
                          new TextStyle(color: Colors.black54, fontSize: 13.0),
                    ),
                    margin: new EdgeInsets.all(10.0),
                  ),
                ],
              ),
              margin: new EdgeInsets.only(top: 20.0, bottom: 9.0),
            ),
          ),
          new GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).push(new PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return new NetDataPager(index: 2);
                      },
                    ));
              });
            },
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Icon(
                    Icons.exposure,
                    size: 30.0,
                    color: Colors.green,
                  ),
                  new Container(
                    child: new Text(
                      '案例',
                      style:
                          new TextStyle(color: Colors.black54, fontSize: 13.0),
                    ),
                    margin: new EdgeInsets.all(10.0),
                  ),
                ],
              ),
              margin: new EdgeInsets.only(top: 20.0, bottom: 9.0),
            ),
          ),
          new GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).push(new PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return new NetDataPager(index: 3);
                      },
                    ));
              });
            },
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Icon(
                    Icons.update,
                    size: 30.0,
                    color: Colors.green,
                  ),
                  new Container(
                    child: new Text(
                      '更新',
                      style:
                          new TextStyle(color: Colors.black54, fontSize: 13.0),
                    ),
                    margin: new EdgeInsets.all(10.0),
                  ),
                ],
              ),
              margin: new EdgeInsets.only(top: 20.0, bottom: 9.0),
            ),
          ),
        ],
      ),
      margin: new EdgeInsets.all(0.0),
      color: Colors.white,
    );
  }
}

class FragmentPagerSecond extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FragmentPagerSecondState();
  }
}

class FragmentPagerSecondState extends State<FragmentPagerSecond> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //这里是交互界面
        new FrgmentPagerSecondWidget1(),
        new Container(
          child: new Row(
            //fork
            children: <Widget>[
              Container(
                child: Text('学习Flutter官网'),
                margin: new EdgeInsets.only(left: 10.0),
              ),
            ],
          ),
          height: 50.0,
          color: Colors.white,
          margin: new EdgeInsets.only(top: 10.0),
        ),
        FrgmentPagerSecondWidget2(),
        FrgmentPagerSecondWidget3(),
      ],
    );
  }
}

//TODO 布局二
class FrgmentPagerSecondWidget2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FragmentPagerSecond2State();
  }
}

class FragmentPagerSecond2State extends State<FrgmentPagerSecondWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '1000元~50万元',
                  style: new TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '测测我的额度',
                      style: new TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.computer,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ],
            ),
            height: 45.0,
            color: Colors.white,
            padding: new EdgeInsets.only(left: 10.0, top: 6.0),
            margin: new EdgeInsets.only(top: 2.0),
          ),
          Container(
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  alignment: Alignment(0.0, 0.0),
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/haha.png',
                        width: 160.0,
                        height: 80.0,
                        fit: BoxFit.fill,
                      ),
                      margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    new Column(
                      children: <Widget>[
                        Text(
                          '大额利息专属',
                          style: new TextStyle(
                              color: Colors.white, fontSize: 15.0),
                        ),
                        Text(
                          '500-50万人',
                          style: new TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0.0, 0.0),
                  children: <Widget>[
                    new Container(
                      child: Image.asset(
                        'images/lonnv6.jpg',
                        width: 160.0,
                        height: 80.0,
                        fit: BoxFit.fill,
                      ),
                      margin: new EdgeInsets.all(10.0),
                    ),
                    new Column(
                      children: <Widget>[
                        Text(
                          '大额利息专属',
                          style: new TextStyle(
                              color: Colors.white, fontSize: 15.0),
                        ),
                        Text(
                          '500-50万人',
                          style: new TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//TODO 布局三---------------------------------------------------------------

//TODO 布局S
class FrgmentPagerSecondWidget3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FragmentPagerSecond3State();
  }
}

class FragmentPagerSecond3State extends State<FrgmentPagerSecondWidget3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '今日产品榜',
                  style: new TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    new Container(
                      child: Text(
                        '更多 >',
                        style: new TextStyle(
                            color: Colors.black26,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      padding: new EdgeInsets.only(right: 10.0),
                    ),
                  ],
                ),
              ],
            ),
            height: 45.0,
            color: Colors.white,
            padding: new EdgeInsets.only(left: 10.0, top: 6.0),
            margin: new EdgeInsets.only(top: 12.0),
          ),
          Container(
            color: Colors.white,
            child: new Image.asset('images/aaaaa.png'),
            margin: new EdgeInsets.only(top: 1.0),
          ),
        ],
      ),
    );
  }
}

//TODO -------------------------首页交互界面----------------------------END

//动画
class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFadeTest createState() => new _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;
  Animation<double> afteranimao;
  bool isInout = true;

  void _pressdHe() {
    setState(() {
      isInout = !isInout;
    });
  }

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    afteranimao = new Tween(begin: 0.0, end: 300.0).animate(controller);
    curve = new CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Center(
          child: new Container(
            child: new FadeTransition(
              opacity: isInout ? afteranimao : curve,
              child: new FlutterLogo(
                size: 100.0,
              ),
            ),
          ),
        ),
        new FloatingActionButton(
          tooltip: 'Fade',
          child: new Icon(Icons.brush),
          onPressed: () {
            _pressdHe;
            controller.forward();
          },
        ),
      ],
    );
  }
}

class MyHomePager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

class Information {
  IconData Item_Icon;
  String name;
  ColorSwatch color;

  Information(this.Item_Icon, this.name, this.color);
}

class _MyHomePageState extends State<MyHomePager>
    with SingleTickerProviderStateMixin {
  List<Information> inforData = new List<Information>();

  List<String> images = [
    'images/haha.png',
    'images/long_wuman1.jpg',
    'images/lonvn9.jpg',
    'images/longnv5.jpeg',
    'images/lonnv8.jpg'
  ];
  List<String> namesss = ['美食', '电影/演出', '酒店住宿', '休闲娱乐', '外卖'];
  bool preed_is = true;
  bool preed_is_second = false;
  bool preed_is_threed = false;
  int index = 0;
  GlobalKey<FormState> _formstate = new GlobalKey();

  _pressedChangerd() {
    /*Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new WidgetPager();
        },
      ),
    );*/
    setState(() {
      if (index != 0) {
        index = 0;
        preed_is = !preed_is;
      }
      if (preed_is_second) {
        preed_is_second = !preed_is_second;
      }
      if (preed_is_threed) {
        preed_is_threed = !preed_is_threed;
      }
    });
  }

  _pressedChangerd_Second() {
    setState(() {
      if (index != 1) {
        index = 1;
        preed_is_second = !preed_is_second;
      }
      if (preed_is) {
        preed_is = !preed_is;
      }
      if (preed_is_threed) {
        preed_is_threed = !preed_is_threed;
      }
    });
  }

  _pressedChangerd_Threed() {
    setState(() {
      if (index != 2) {
        index = 2;
        preed_is_threed = !preed_is_threed;
      }
      if (preed_is_second) {
        preed_is_second = !preed_is_second;
      }
      if (preed_is) {
        preed_is = !preed_is;
      }
    });
  }

  @override
  void dispose() {
    //页面失去焦点时候
    super.dispose();
  }

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  /* Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _counter;
  String namess;

  Future<Null> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final String counter =
        prefs.getString('counter').length > 0 ? 'Love You' : 'Love Flutter';
    setState(() {
      _counter = prefs.setString("counter", counter).then((bool success) {
        return counter;
      });
    });
  }*/

  @override
  void initState() {
    super.initState();
    initData();
    /*_*/ /*counter = _prefs.then((SharedPreferences prefs) {
      namess = prefs.getString('counter');*/ /*
      return (prefs.getString('counter') ?? 0);
    });*/
  }

  void initData() async {
    setState(() {
      inforData
          .add(new Information(Icons.account_balance, '超市/生鲜', Colors.blue));
      inforData.add(new Information(Icons.home, '名宿/公寓', Colors.yellowAccent));
      inforData.add(
          new Information(Icons.beach_access, '周边/旅游', Colors.lightBlueAccent));
      inforData.add(new Information(
          Icons.card_membership, '机票/火车票', Colors.lightBlueAccent));
      inforData.add(
          new Information(Icons.accessible, '膜拜单车', Colors.lightBlueAccent));
      inforData.add(new Information(Icons.camera_roll, '景点/门票', Colors.red));
      inforData.add(new Information(Icons.local_play, '学习培训', Colors.blue));
      inforData.add(
          new Information(Icons.card_membership, '亲子/乐园', Colors.greenAccent));
      inforData
          .add(new Information(Icons.perm_media, '健身中心', Colors.redAccent));
      inforData.add(new Information(Icons.widgets, '全部分类', Colors.blue));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: index == 0
            ? new AppBar(
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                title: new Container(
                  width: 600.0,
                  child: index == 0
                      ? new Container(
                          child: new Card(
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  new Container(
                                    child: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.beach_access,
                                          size: 20.0,
                                        ),
                                        Container(
                                          child: Text(
                                            '27*',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45),
                                          ),
                                          margin:
                                              new EdgeInsets.only(left: 4.0),
                                        ),
                                      ],
                                    ),
                                    margin: new EdgeInsets.only(
                                        left: 15.0, top: 12.0, bottom: 2.0),
                                  ),
                                  new Container(
                                    child: Container(
                                      child: Text(
                                        '天津',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      margin: new EdgeInsets.only(left: 11.0),
                                    ),
                                  ),
                                  new Container(
                                      margin: new EdgeInsets.only(left: 10.0),
                                      padding: new EdgeInsets.only(left: 10.0),
                                      height: 30.0,
                                      width: 200.0,
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(58.0))),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.search,
                                            size: 20.0,
                                            color: Colors.black54,
                                          ),
                                          Container(
                                            child: Container(
                                              padding: new EdgeInsets.only(
                                                  left: 10.0),
                                              child: Center(
                                                child: Form(
                                                  autovalidate: false,
                                                  child: TextFormField(
                                                    style: new TextStyle(
                                                        color: Colors.teal),
                                                    textAlign: TextAlign.start,
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      fillColor: Colors.white,
                                                      /*prefixIcon: Container(
                                child: Icon(Icons.search),
                                padding: new EdgeInsets.only(left: 5.0),
                              ),*/
                                                      hintText: '请输入喜好',
                                                      hintStyle: TextStyle(
                                                          color:
                                                              Colors.black12),
                                                      //contentPadding: new EdgeInsets.only(left: 1.0,top: 16.0),
                                                      //isDense: false,
                                                      filled: false,
                                                      /*border: new OutlineInputBorder(

                                borderRadius: BorderRadius.all(Radius.circular(44.0)),
                                borderSide:  BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.none),
                              ),*/
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            width: 130.0,
                                            height: 35.0,
                                          ),
                                        ],
                                      )),
                                  new Container(
                                    child: Icon(
                                      Icons.add,
                                      size: 28.0,
                                    ),
                                    padding: new EdgeInsets.only(left: 10.0),
                                  ),
                                ],
                              ),
                              width: 600.0,
                              height: 55.0,
                            ),
                            margin: new EdgeInsets.only(top: 1.0, bottom: 2.0),
                          ),
                        )
                      : new Text(index == 1 ? 'Flutter-交互' : 'Flutter--系统调用'),
                ),
              )
            : new AppBar(
                title: new Center(
                  child: index == 0
                      ? new Container()
                      : new Text(index == 1 ? 'Flutter-交互' : 'Flutter--系统调用'),
                ),
              ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: new Container(
                //这里我们需要用index判断切换的界面内容显示哦！三元就行，真的说实话，百度这么强大没有一个人写出这种场见的android应用切换碎片场景。用TabBarView和bottomNavigationBar根本就没法去掉下面的导航栏。可能是我目前水平不够吧。这里我根据android fragment占用位置用Fragment去替换内容从而实现切换，思路一模一样。
                //所显示更具index判断点击的是那个按钮，然后做响应的内容小部件显示就可以了。下面用一个很长很长的三元计算写了出来，如果点击是第一个那么，替换为第一个内容小部件，如果是index=2第二个
                //依次往右边走就可以。
                child: index == 0
                    ? new GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        child: new ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            // new ImageAnimal(),
                            new SizedBox(
                              width: 200.0,
                              height: 100.0,
                              child: new Swiper(
                                pagination: SwiperPagination(),
                                loop: true,
                                autoplay: true,
                                duration: 2000,
                                itemBuilder: (BuildContext context, int index) {
                                  return new Image.asset(
                                    images[index],
                                    fit: BoxFit.cover,
                                  );
                                },
                                itemCount: 5,
                              ),
                            ),
                            new SizedBox(
                              width: 600.0,
                              height: 100.0,
                              child: Container(
                                color: Colors.white,
                                child: new ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return new Container(
                                      color: Colors.white,
                                      child: new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          new ClipOval(
                                            //这个一般可以作为圆形的裁剪哦。
                                            child: new SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: Container(
                                                child: new Image.asset(
                                                  images[index],
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          new Text(
                                            namesss[index],
                                            style: TextStyle(
                                                color: Color(0xFF757575),
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      margin: new EdgeInsets.only(
                                          left: 15.0, right: 6.0),
                                    );
                                  },
                                ),
                              ),
                            ),
                            new Container(
                              width: 600.0,
                              height: 1.0,
                              color: Colors.white,
                              child: new Container(
                                color: Colors.black12,
                              ),
                              padding:
                                  new EdgeInsets.only(left: 10.0, right: 10.0),
                            ),
                            new SizedBox(
                              width: 600.0,
                              height: 140.0,
                              child: Container(
                                color: Colors.white,
                                child: new ListView.builder(
                                  itemCount: (inforData.length / 2).toInt(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return new Container(
                                      color: Colors.white,
                                      child: new Column(
                                        children: <Widget>[
                                          new Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Icon(
                                                  inforData[index * 2]
                                                      .Item_Icon,
                                                  color: inforData[index * 2]
                                                      .color,
                                                ),
                                                new Container(
                                                  child: Text(
                                                    inforData[index * 2].name,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF757575),
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  margin: new EdgeInsets.only(
                                                      top: 5.0),
                                                ),
                                              ],
                                            ),
                                            margin: new EdgeInsets.only(
                                                left: 10.0,
                                                right: 4.0,
                                                top: 14.0,
                                                bottom: 14.0),
                                          ),
                                          new Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Icon(
                                                  inforData[index * 2 + 1]
                                                      .Item_Icon,
                                                  color:
                                                      inforData[index * 2 + 1]
                                                          .color,
                                                ),
                                                new Container(
                                                  child: Text(
                                                    inforData[index * 2 + 1]
                                                        .name,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF757575),
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  margin: new EdgeInsets.only(
                                                      top: 3.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      margin: new EdgeInsets.only(
                                          bottom: 10.0, left: 12.0, right: 6.0),
                                    );
                                  },
                                ),
                                margin: new EdgeInsets.all(4.0),
                              ),
                            ),
                            WidgetPagers(),
                            new WidgetStudy(),
                            new WidgetText(),
                            /* 这是优化之前的代码很烦，index == 0
                        ? new ImageAnimal()
                        : index == 1 ? WidgetStudy() : new MyFadeTest(),*/
                          ],
                        ),
                      )
                    : index == 1
                        ? new Container(
                            child: FragmentPagerSecond(),
                            color: Colors.black12,
                          )
                        : new systemPager(),
                width: 600.0,
                height: 900.0,
              ),
            ),
            new Card(
              child: Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new GestureDetector(
                      onTap: _pressedChangerd,
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Icon(
                              Icons.home,
                              color: preed_is
                                  ? Colors.orangeAccent
                                  : Colors.black45,
                            ),
                            new Text(
                              '布局',
                              style: new TextStyle(
                                  color: preed_is
                                      ? Colors.orangeAccent
                                      : Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: _pressedChangerd_Second,
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Icon(
                              Icons.computer,
                              color: preed_is_second
                                  ? Colors.orangeAccent
                                  : Colors.black45,
                            ),
                            new Text(
                              '交互',
                              style: new TextStyle(
                                  color: preed_is_second
                                      ? Colors.orangeAccent
                                      : Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: _pressedChangerd_Threed,
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Icon(
                              Icons.person,
                              color: preed_is_threed
                                  ? Colors.orangeAccent
                                  : Colors.black45,
                            ),
                            new Text(
                              '系统',
                              style: new TextStyle(
                                  color: preed_is_threed
                                      ? Colors.orangeAccent
                                      : Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                width: 600.0,
                height: 60.0,
                color: Colors.white,
                padding: new EdgeInsets.only(top: 5.0),
              ),
              color: Colors.white,
              margin: new EdgeInsets.only(top: 2.0, bottom: 2.0),
            ),
          ],
        ));
  }
}
