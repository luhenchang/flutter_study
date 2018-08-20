import 'dart:async';
import 'dart:io';
import 'package:flutter_app/Widght_3D.dart';
import 'package:flutter_app/flutter_intent/view/AppBar2.dart';
import 'package:flutter_app/flutter_intent/view/SecondPager.dart';
import 'package:flutter_app/flutter_person/PersonPager.dart';
import 'package:flutter_app/flutter_system/SystemPage.dart';
import 'package:flutter_app/flutter_widget/modle/HomePageBean.dart';
import 'package:flutter_app/flutter_widget/view/DouyinPager.dart';
import 'package:flutter_app/flutter_widget/view/MainSearchPager.dart';
import 'package:flutter_app/flutter_widget/view/MyDrawer.dart';
import 'package:flutter_app/flutter_widget/view/MyWell_Screen.dart';
import 'package:flutter_app/flutter_widget/view/NetWidget.dart';
import 'package:flutter_app/flutter_widget/view/XuankuPager.dart';
import 'package:flutter_app/test/SlivScrollListViewTabLayout.dart';
import 'package:flutter_app/test/video_demo.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_intent/view/NetDataPager.dart';
import 'package:flutter_app/flutter_intent/view/interactioPager.dart';
import 'package:flutter_app/flutter_system/systemPager.dart';
import 'package:flutter_app/flutter_widget/WidgetPager.dart';
import 'package:flutter_app/flutter_widget/view/SmallWidget.dart';
import 'package:flutter_app/flutter_widget/WidgetText.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/http_utils/HttpUtils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:pull_to_refresh/pull_to_refresh.dart";

class WidgetPagerss extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FirstPageStates();
  }
}

class FirstPageStates extends State<WidgetPagerss> {
  @override
  Widget build(BuildContext context) {
    //TODO 第二个布局
    return new Container(
      //距离每个边缘四周32像素
      color: Colors.white30,
      margin: EdgeInsets.all(3.0),
      child: new Container(
        color: Colors.white,
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
                      '2018年度好看电视剧',
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
                        '冰与火之歌',
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
        primarySwatch: Colors.amber,
        primaryColor: Colors.white,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: MyHomePager(),
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

//TODO 第一个界面
class MyHomePager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

enum _RadioGroup { foo1, foo2 }

class _MyHomePageState extends State<MyHomePager>
    with TickerProviderStateMixin {
  List mImagesAdate;
  RefreshController _refreshController;
  bool preed_is = true;
  bool preed_is_second = false;
  bool preed_is_threed = false;
  bool preed_is_four = false;
  int index = 0;
  _RadioGroup _itemType = _RadioGroup.foo1;
  var BannerList;
  List<Step> steplist = new List();

  var step_index = 0;

  Future<File> _getDirPath() async {
    String paths = (await getApplicationDocumentsDirectory()).path;
    return new File('$paths/login.txt');
  }

  Future<String> _readDataFromFile() async {
    try {
      File file = await _getDirPath();
      String context = await file.readAsString();
      return context;
      /*_getDirPath().then((file){

    });*/
    } catch (e) {
      return e.toString();
    }
  }

  void enterRefresh() {
    _refreshController.requestRefresh(true);
  }

  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
  }

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
      if (preed_is_four) {
        preed_is_four = !preed_is_four;
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
      if (preed_is_four) {
        preed_is_four = !preed_is_four;
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
      if (preed_is_four) {
        preed_is_four = !preed_is_four;
      }
    });
  }

  _pressedChangerd_four() {
    setState(() {
      if (index != 3) {
        index = 3;
        preed_is_four = !preed_is_four;
      }
      if (preed_is_second) {
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
    /*/* https://github.com/luhenchang/flutter_study/blob/master/images/longnv5.jpeg?raw=true
*  https://github.com/luhenchang/flutter_study/blob/master/images/long_wuman.jpeg?raw=true
*  https://github.com/luhenchang/flutter_study/blob/master/images/longwuman3.jpg?raw=true
* https://github.com/luhenchang/flutter_study/blob/master/images/lonnv6.jpg?raw=true
* https://github.com/luhenchang/flutter_study/blob/master/images/lonnv10.jpg?raw=true
*  https://github.com/luhenchang/flutter_study/blob/master/images/longnv5.jpeg?raw=true
*  https://github.com/luhenchang/flutter_study/blob/master/images/long_wuman.jpeg?raw=true
*  https://github.com/luhenchang/flutter_study/blob/master/images/longwuman3.jpg?raw=true
* https://github.com/luhenchang/flutter_study/blob/master/images/lonnv6.jpg?raw=true
* https://github.com/luhenchang/flutter_study/blob/master/images/lonnv10.jpg?raw=true
* */
    * */
    mImagesAdate = List<String>();
    mImagesAdate.clear();
    mImagesAdate.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/longnv5.jpeg?raw=true");
    mImagesAdate.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/long_wuman.jpeg?raw=true");
    mImagesAdate.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/longwuman3.jpg?raw=true");
    mImagesAdate.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/lonvn9.jpg?raw=true");
    _refreshController = new RefreshController();
    loadData();
    initData();

    /*_*/ /*counter = _prefs.then((SharedPreferences prefs) {
      namess = prefs.getString('counter');*/ /*
      return (prefs.getString('counter') ?? 0);
    });*/
  }

  Widget _headerCreate(BuildContext context, int mode) {
    return new ClassicIndicator(
      mode: mode,
      refreshingText: "",
      idleIcon: new Container(),
      idleText: "Load more...",
    );
  }

  Widget getItemWidget(String url) {
    return Material(
      child: new InkWell(
        onTap: () {
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) {
                return new MyWell_Screen();
              },
            ),
          );
        },
        child: Image.asset(
          url,
          fit: BoxFit.cover,
          width: 80.0,
          height: 80.0,
        ),
      ),
    );
  }

  List<Widget> _ItemList() {
    List<Widget> widgetList = new List();
    widgetList.add(getItemWidget('images/item1.png'));
    widgetList.add(getItemWidget('images/item2.png'));
    widgetList.add(getItemWidget('images/item3.png'));
    widgetList.add(getItemWidget('images/item4.png'));
    return widgetList;
  }

  void initData() async {
    await HomePageBean.setData();
    String tiltle = await _readDataFromFile();
  }

  void changeItemType(_RadioGroup type) {
    setState(() {
      _itemType = type;
    });
  }

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: index == 0
          ? new AppBar(
              titleSpacing: 0.0,
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap:(){
                  Navigator.of(context).push(new PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) {
                      return new MainSearchPager();
                    },
                  ));
                },
                child: AppBar2(
                  index1: index,
                ),
              ),
            )
          : index == 1
              ? AppBar(
                  titleSpacing: 0.0,
                  automaticallyImplyLeading: false,
                  title: AppBar2(
                    index1: index,
                  ))
              : null,
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new Container(
              //这里我们需要用index判断切换的界面内容显示哦！三元就行，真的说实话，百度这么强大没有一个人写出这种场见的android应用切换碎片场景。用TabBarView和bottomNavigationBar根本就没法去掉下面的导航栏。可能是我目前水平不够吧。这里我根据android fragment占用位置用Fragment去替换内容从而实现切换，思路一模一样。
              //所显示更具index判断点击的是那个按钮，然后做响应的内容小部件显示就可以了。下面用一个很长很长的三元计算写了出来，如果点击是第一个那么，替换为第一个内容小部件，如果是index=2第二个
              //依次往右边走就可以。first blood
              child: index == 0
                  ? new GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: new SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        controller: _refreshController,
                        onRefresh: (up) {
                          if (up)
                            new Future.delayed(
                                const Duration(milliseconds: 2009)).then((val) {
                              _refreshController.scrollTo(
                                  _refreshController.scrollController.offset +
                                      100.0);
                              _refreshController.sendBack(
                                  true, RefreshStatus.idle);
                              setState(() {});
//                refresher.sendStatus(RefreshStatus.completed);
                            });
                          else {
                            new Future.delayed(
                                const Duration(milliseconds: 2009)).then((val) {
                              setState(() {});
                              _refreshController.sendBack(
                                  false, RefreshStatus.idle);
                            });
                          }
                        },
                        onOffsetChange: _onOffsetCallback,
                        child: new ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: new EdgeInsets.all(1.0),
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
                                control: new SwiperControl(
                                    color: Colors.lightBlueAccent),
                                itemBuilder: (BuildContext context, int index) {
                                  return BannerList.length > 0
                                      ? new Image.network(
                                          BannerList[index]['banner_url'],
                                          fit: BoxFit.cover,
                                        )
                                      : new Container();
                                },
                                itemCount:
                                    BannerList != null ? BannerList.length : 0,
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
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.of(context).push(
                                              new PageRouteBuilder(pageBuilder:
                                                  (BuildContext, _, __) {
                                            return new MaterialApp(
                                              theme: new ThemeData(
                                                primarySwatch: Colors.amber,
                                                primaryColor: Colors.blue,
                                                accentColor:
                                                    Colors.deepOrangeAccent,
                                              ),
                                              home: new VideoDemo(),
                                            );
                                            ;
                                          }));
                                        });
                                      },
                                      child: new Container(
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
                                                    HomePageBean.images[index],
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Text(
                                              HomePageBean.namesss[index],
                                              style: TextStyle(
                                                  color: Color(0xFF757575),
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        margin: new EdgeInsets.only(
                                            left: 15.0, right: 6.0),
                                      ),
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
                                  itemCount: (HomePageBean.inforData.length / 2)
                                      .toInt(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return new Container(
                                      color: Colors.white,
                                      child: new Column(
                                        children: <Widget>[
                                          new GestureDetector(
                                            onTap: () {
                                              Navigator
                                                  .of(context)
                                                  .push(new PageRouteBuilder(
                                                pageBuilder:
                                                    (BuildContext context, _,
                                                        __) {
                                                  return new XuankuPage();
                                                },
                                              ));
                                            },
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Icon(
                                                    HomePageBean
                                                        .inforData[index * 2]
                                                        .Item_Icon,
                                                    color: HomePageBean
                                                        .inforData[index * 2]
                                                        .color,
                                                  ),
                                                  new Container(
                                                    child: Text(
                                                      HomePageBean
                                                          .inforData[index * 2]
                                                          .name,
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
                                          ),
                                          new Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Icon(
                                                  HomePageBean
                                                      .inforData[index * 2 + 1]
                                                      .Item_Icon,
                                                  color: HomePageBean
                                                      .inforData[index * 2 + 1]
                                                      .color,
                                                ),
                                                new Container(
                                                  child: Text(
                                                    HomePageBean
                                                        .inforData[
                                                            index * 2 + 1]
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
                            //网格布局
                            new Container(
                                color: Colors.white,
                                height:
                                    MediaQuery.of(context).size.width / 2 + 15,
                                width: MediaQuery.of(context).size.width,
                                child: new GridView.count(
                                  childAspectRatio: 2.0,
                                  primary: false,
                                  padding: const EdgeInsets.all(10.0),
                                  crossAxisSpacing: 10.0,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 6.0,
                                  children: _ItemList(),
                                )),
                            WidgetPagerss(),
                            new Container(
                                color: Colors.white,
                                height:
                                    MediaQuery.of(context).size.width / 2 + 15,
                                width: MediaQuery.of(context).size.width,
                                child: new GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 11.0,
                                          mainAxisSpacing: 11.0,
                                          childAspectRatio: 2.0),
                                  primary: false,
                                  itemCount: mImagesAdate.length,
                                  padding: const EdgeInsets.all(10.0),
                                  itemBuilder: (BuildContext context, int i) {
                                    return Container(
                                      height: 400.0,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.teal,
                                      child: Hero(
                                        tag: mImagesAdate[i],
                                        child: Material(
                                          child: InkWell(
                                            child: new FadeInImage(
                                              image: new NetworkImage(
                                                  mImagesAdate[i]),
                                              fit: BoxFit.cover,
                                              placeholder: new AssetImage(
                                                  'images/wallfy.png'),
                                            ),
                                            onTap: () {
                                              Navigator
                                                  .of(context)
                                                  .push(new PageRouteBuilder(
                                                    opaque: false,
                                                    pageBuilder:
                                                        (BuildContext context,
                                                            _, __) {
                                                      return new MyAppsss(
                                                          mImagesAdate[i],
                                                          mImagesAdate[i]);
                                                    },
                                                  ));
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )),

                            WidgetPagers(),
                            new WidgetStudy(),
                            new WidgetText(),

                            /* 这是优化之前的代码很烦，index == 0
                        ? new ImageAnimal()
                        : index == 1 ? WidgetStudy() : new MyFadeTest(),*/
                          ],
                        ),
                      ),
                    )
                  : index == 1
                      ? new Container(
                          child: SecondPager(),
                          color: Colors.black12,
                        )
                      : index == 2
                          ? new SystemPage()
                          : new MaterialApp(
                              theme: new ThemeData(
                                primarySwatch: Colors.amber,
                                primaryColor: Colors.blue,
                                accentColor: Colors.deepOrangeAccent,
                              ),
                              home: new PersonPager(),
                            ),
              /*new MaterialApp(
      title: 'app',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.white,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: MyHomePager(),
    ),*/
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
                            color:
                                preed_is ? Colors.orangeAccent : Colors.black45,
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
                            Icons.settings_system_daydream,
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
                  new GestureDetector(
                    onTap: _pressedChangerd_four,
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Icon(
                            Icons.person,
                            color: preed_is_four
                                ? Colors.orangeAccent
                                : Colors.black45,
                          ),
                          new Text(
                            '我的',
                            style: new TextStyle(
                                color: preed_is_four
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
      ),
      drawer: new MyDrawer(),
    );
  }

  void loadData() async {
    //http://116.62.149.237:8080/USR000100002
    await http
        .get('http://116.62.149.237:8080/USR000100002')
        .then((http.Response response) {
      print(response.body);
      var datas = json.decode(response.body);
      String rescode = datas["rescode"];
      var listData = datas["resobj"];
      setState(() {
        BannerList = listData;
      });
    });
  }

  void getStep() async {
    steplist.clear();
    steplist.add(new Step(
        title: new Row(
          children: <Widget>[
            Text('水果'),
            Icon(
              Icons.input,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        content: new Container(
          child: new Text('这里的水果天下无敌！'),
        )));
    steplist.add(
      new Step(
        title: new Row(
          children: <Widget>[
            Text('小吃'),
            Icon(
              Icons.input,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        content: new GestureDetector(
          child: Container(
            color: Colors.lightBlueAccent,
            child: new Text('投吧'),
          ),
        ),
      ),
    );
    steplist.add(new Step(
        title: new Row(
          children: <Widget>[
            Text('肉肉'),
            Icon(
              Icons.input,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        content: new Container(
          color: Colors.lightBlueAccent,
          child: new Text('蛋疼'),
        )));
    steplist.add(new Step(
        title: new Row(
          children: <Widget>[
            Text('冷饮'),
            Icon(
              Icons.input,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        content: new Container(
          color: Colors.lightBlueAccent,
          child: new Text('无语'),
        )));
  }

  void _onRefresh(bool up) {
    if (up) {
      //headerIndicator callback
      new Future.delayed(const Duration(milliseconds: 2009)).then((val) {
        _refreshController.sendBack(true, RefreshStatus.failed);
      });
    } else {
      //footerIndicator Callback
    }
  }
}
