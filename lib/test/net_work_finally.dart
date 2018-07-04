import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_app/test/flutter_intent.dart';
import 'package:flutter_app/test/layout_study01.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new MaterialApp(
    title: 'app',
    home: new MyApp(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: _image == null
                    ? new Text('No image selected.')
                    : new Container(
                        child: new Image.file(_image),
                        width: 600.0,
                        height: 200.0,
                      ),
              ),
            ],
          ),
        ),
        new FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: new Icon(Icons.add_a_photo),
        ),
      ],
    );
  }
}

//动态小部件
class WidgetStateless extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _WidgetFuss();
  }
}

class _WidgetFuss extends State<WidgetStateless> {
  //这个判断是否
  bool _isRed = true;
  int _count = 41;

  void _press_WidgeFuss() {
    setState(() {
      if (_isRed) {
        _isRed = false;
        _count -= 1;
      } else {
        _isRed = true;
        _count += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          child: new IconButton(
              icon: _isRed ? new Icon(Icons.star) : new Icon(Icons.star_border),
              color: Colors.redAccent,
              onPressed: _press_WidgeFuss),
        ),
        new SizedBox(
          width: 28.0,
          child: new Container(
            child: new Text('$_count'),
          ),
        )
      ],
    );
  }
}

//上面是静态的，我来一个网络加载的哦！
class ArticalWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ArticalState();
  }
}

//
class ArticalState extends State<ArticalWidget> {
  //用来装载数据的。
  List widghs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoaData();
  }

  void _Pressed() {
    setState(() {
      widghs.clear();
      LoaData();
    });
  }

  Widget getWidget() {
    if (widghs.length == 0) {
      return Container(
        width: 10.0,
        height: 50.0,
        child: new CircularProgressIndicator(),
        margin: new EdgeInsets.fromLTRB(155.0, 0.0, 155.0, 0.0),
        decoration: new BoxDecoration(
            // color: Colors.deepOrangeAccent,
            ),
      );
    } else {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.black12,
            ),
            child: new Row(
              children: <Widget>[
                new Text(
                  '点击后面的加载数据按钮，获取网络数据哦！',
                  style: new TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0),
                ),
                new IconButton(
                  icon: new Icon(Icons.autorenew),
                  onPressed: _Pressed,
                  color: Colors.blueGrey,
                )
              ],
            ),
            margin: new EdgeInsets.all(1.0),
            padding: new EdgeInsets.all(2.0),
          ),
          new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new Text(
              " ${widghs[0]["title"]}" +
                  " ${widghs[1]["title"]}" +
                  " ${widghs[2]["title"]}",
              style: new TextStyle(
                  color: Colors.blueGrey, fontSize: 12.0, letterSpacing: 1.0),
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return getWidget();
  }

  void LoaData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widghs = json.decode(response.body);
    });
  }
}
//输入文本

class SampleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  String _errorText;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TextField(
        onSubmitted: (String text) {
          setState(() {
            if (!isEmail(text)) {
              _errorText = 'Error: This is not an email';
            } else {
              _errorText = null;
            }
          });
        },
        decoration: new InputDecoration(
            hintText: "请输入邮箱哦",
            errorText: _getErrorText(),
            hintStyle: new TextStyle(
                color: Colors.black26, fontSize: 10.0, inherit: false),
            errorStyle: new TextStyle(color: Colors.blueGrey)),
      ),
      margin: new EdgeInsets.all(20.0),
      decoration: new BoxDecoration(),
    );
  }

  _getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegexp);
    return regExp.hasMatch(em);
  }
}

//TODO 顶部
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO 第二个布局
    Widget titleSection = new Container(
      //距离每个边缘四周32像素
      margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
      child: new Card(
        //最外层为一行包裹里面的
        child: new Row(
          //里面包含三个大布局子控件控件【两行文字,文字,五角星】
          children: <Widget>[
            //TODO 第一个子控件里面两行字体,让其占用多余的控件，这样右边的控件所占之外的所有控件都被他所占用这样展开的更长不然右边控件会往左边跑。
            new Container(
              margin: new EdgeInsets.only(
                  left: 15.0, top: 8.0, right: 45.0, bottom: 5.0),
              //这个列里面装两行文字
              child: new Column(
                //文字从这个左边开始
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    //距离下面一个文字8像素
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      'Flutter-程序员睡白富美秘籍宝典',
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
            new WidgetStateless(),
          ],
        ),
      ),
    );

    //TODO 第三个按钮布局
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      color: Colors.blueGrey,
      //TODO 跟视图1.0
      padding: new EdgeInsets.only(top: 5.0),
      child: new Row(
        //TODO 第一行2.0
        //均匀分布展开
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //TODO 第三行中的列，3.0
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.account_balance, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    //TODO 第四部分 所有文字文本
    Widget artical = new Container(
      color: Colors.blueGrey,
      padding: new EdgeInsets.all(26.0),
      child: new Text(
        '''
       星期四的这天晚上，我有点想家。

嗯。我确定我是想家了。
因为我总是回想起很多东西。关于家乡的东西。

想起湛蓝天空棉花糖般的云朵，想起躺在打谷场时试图抓住的星星点点的阳光，想起鼻尖香醇的麦秸秆，想起三轮车座下烫的烂熟的果子，想起野孩子一般穿行在深沟里的日子。

啊呀，真是美好的不像话。

越想越开心，越想越孤单。在这个离家一千多公里的陌生的城市，我越想越心酸。

你可以告诉我啊。
不，我不能告诉你。

这是我的东西。为数不多的财富。我不能告诉你，然后听你说不能理解或是敷衍附和。
我不能。

人真的很奇怪。小时候很多根本没注意过的东西，在长大后的回忆中却清晰如初。
我越想越细致，越想越感慨。
上帝创造记忆这种东西，就是为了在这种时候给我们慰藉吧。

因为这个原因，我姑且在今晚承认，有时候，信仰真的比安慰有用多了。
嗯，至少比我告诉你要有用的多。

虽然我意识到我想家，可也不能一直想。抱着离开家乡念头的人是不能一直想家的。
这是我的软弱。
可以偶尔软弱却不能沉溺。
人一旦沉迷于自身的软弱，便会一昧的软弱下去，会在众人的目光中倒在街头，倒在地上，倒在比地面还要低的地方。

我很怕被人围观这弱点，更怕在众目睽睽之下倒下去。
唔，这大概就是虚伪。
可是，有的虚伪不该受到谴责，因为这是为了活着啊。

飞机飞过这车水马龙的城市，所有的春天来到。
火车带走热情奔放的花朵，所有的夏天就绪。

我必须赶在春天的尾巴悄悄埋一个愿望，发芽了也好，不发芽也没人知道。
这样看来，我的确是个无趣的人。

不想分享故事，不愿迎合笑脸。
我记得以前的教训：想跟你分享有趣的事，却被看作是炫耀，这确实是件很让人落寞的事。

无怪乎当前这么多人以己身为队伍，而不是与人诉衷肠。
呐，谁又肯相信谁呢。
可是这样又形成了一种怪现象，即因为不了解所以窥探别人的故事。

对这种人我只想说，有那窥天探地的心气儿，可有摧枯拉朽的本事？

前不久，收到幼时伙伴的结婚邀请，让人欢喜又震撼。
我一直都还觉得自己不够长大。
故而一时间有种无所适从的慌张。

好像自以为是的留在时光的原地，一瞬间却发现早已被洪流吹到了陌生的地方。

时光洪流吹走了少年、青年时期，我也算为我的年轻付出了代价吧。
而具体什么代价，我竟也悲伤羞臊的说不出话。
但我终于也算明白，年轻总是要付出代价的。

那时候的心很硬又很脆，感情真挚又羸弱。
我相信，在以后的人生里，你可以见形形色色的人生，却再也不会忘记少时不够从容的心碎。

万幸，身边从未短缺亲友。阳光下年轻的父亲母亲一步步走致衰老，却始终未曾远离。
爱是如此宽广，无论醒来是否荒凉。

文字是多么贫乏的东西，我要说的东西到目前还不到三分之一。
可也仅此而已了。毕竟，一时冲动这种事情，实在不该出现在这个年纪的我身上了。
        ''',
        textAlign: TextAlign.left,
        softWrap: true,
      ),
    );

    Center pictureEnd = new Center(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new Image.asset(
              'images/long_wuman1.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
          ),
          new Expanded(
            child: new Image.asset(
              'images/lonnv8.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
    Center pictureTitle = new Center(
      child: new Text(
        '''         如果布局太大而不适合设备，则会在受影响的边缘出现红色条纹。用扩展小部件(Expanded)可以解决哦
      ''',
        style: new TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey,
          decorationColor: Colors.purple,
          letterSpacing: 4.0,
          textBaseline: TextBaseline.ideographic,
        ),
      ),
    );

    //Todo 这个是左边文字复杂，右边图片加起来的复杂搭配哦
    Container complexArticlAndPicture = new Container(
      padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 1.5,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );

    //todo 这个是下面三行lable一行和Text两行
    Container endEnd = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //一行一列，一行
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Icon(
                Icons.account_balance,
                color: Colors.blueGrey,
                size: 20.0,
              ),
              new Text("PREP",
                  style: new TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 12.0,
                  )),
              new Text(
                "25min",
                style: new TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              new Icon(
                Icons.access_alarm,
                color: Colors.blueGrey,
                size: 20.0,
              ),
              new Text(
                "CLOCKER",
                style: new TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 12.0,
                ),
              ),
              new Text(
                "25min",
                style: new TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              new Icon(
                Icons.access_time,
                color: Colors.blueGrey,
                size: 20.0,
              ),
              new Text(
                "TIME",
                style: new TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 12.0,
                ),
              ),
              new Text(
                "25min",
                style: new TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ],
          )
        ],
      ),
    );

    //左边作为集合
    var leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
      child: new Column(
        children: <Widget>[
          complexArticlAndPicture,
          endEnd,
        ],
      ),
    );

    //右边
    Container finnalContainer = new Container(
      margin: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      height: 180.0,
      child: new Card(
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: leftColumn,
            ),
            new Expanded(
              child: new Image.asset(
                'images/lonnv6.jpg',
                height: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
    //图片列表加边框
    Container pictureTable = new Container(
      //盒子模型
      decoration: new BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: new Column(
        children: <Widget>[
          //标题
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Row(
              children: <Widget>[
                new RaisedButton(
                  child: new Text(
                    '这个是图片排列',
                    style: new TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){

                      return new MyAppssss();
                    }));
                  },
                ),
              ],
            ),
          ),
          //下面的图片
          new Container(
            padding: EdgeInsets.only(top: 1.0),
            decoration: new BoxDecoration(color: Colors.purple),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new Image.asset(
                  'images/lonnv6.jpg',
                  width: 600.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                )),
                new Expanded(
                    child: new Image.asset(
                  'images/lonnv10.jpg',
                  width: 600.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                )),
                new Expanded(
                    child: new Image.asset(
                  'images/lonnv8.jpg',
                  width: 600.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                )),
              ],
            ),
          ),
        ],
      ),
    );

    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: new Column(
        children: [
          new Container(
            margin:
                EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 10.0),
            padding: EdgeInsets.only(left: 10.0),
            width: 600.0,
            height: 50.0,
            color: Colors.blue,
            child: new Row(
              children: <Widget>[
                new Text(
                  '这个是盒子模型学习哦！和Html相似',
                  style: new TextStyle(color: Colors.white, fontSize: 14.0),
                )
              ],
            ),
          ),
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 11.0, color: Colors.cyan),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset(
                    'images/haha.png',
                    width: 120.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 11.0, color: Colors.cyan),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset(
                    'images/long_wuman1.jpg',
                    width: 120.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 11.0, color: Colors.cyan),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset(
                    'images/lonvn9.jpg',
                    width: 120.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 11.0, color: Colors.cyan),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset(
                    'images/longwuman3.jpg',
                    width: 120.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    List<Container> _buildGridTileList(int count) {
      return new List<Container>.generate(
          count,
          (int index) => new Container(
              child: new Image.asset('images/pic${index + 1}.jpg')));
    }

    ;
    Widget buildGrid() {
      return new GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGridTileList(30),
      );
    }

    //GridView列表图片加载
    Center gradiview = new Center(
      child: buildGrid(),
    );

    //显示运行代码
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Flutter布局第二章：网络数据的加载！',
          style: new TextStyle(fontSize: 15.0),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          finnalContainer,
          pictureTable,
          //new ArticalWidget(),
          new MyHomePage(),
          new SampleAppPage(),
        ],
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二个页面'),
        backgroundColor: Colors.brown,
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('返回'),
        ),
      ),
    );
  }
}
class MyAppssss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二个页面'),
        backgroundColor: Colors.brown,
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('返回'),
        ),
      ),

    );
  }
}
