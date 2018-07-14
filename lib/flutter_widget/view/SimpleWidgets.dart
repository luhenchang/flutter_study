import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_app/Widght_3D.dart';
import 'package:transparent_image/transparent_image.dart';

class SimpleWidgets extends StatefulWidget {
  SimpleWidgets({Key key, this.title, this.index}) : super(key: key);
  final String title;
  final int index;

  @override
  State<StatefulWidget> createState() {
    return SimpleWidgetState(title: title, index: index);
  }
}

class SimpleWidgetState extends State<SimpleWidgets> {
  final String title;
  final int index;

  SimpleWidgetState({Key key, this.title, this.index});

  Widget getListSimple1() {
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
    return new ListView(
      children: <Widget>[
        new Container(
          child: new Text(
            '''
        如下图我们来分析它的结构：水平方向上我们看到它是一个左边文字和小图标的复杂东西，右边是一个图片。于是我们把这个布局分为左右两个布局来分析。所以最外层是一个Row保证左边（复杂图文组合）和右边（只有一个图片）分开。
         
        然后左边：是两行所以是Comun，第一行是五个星星和文字所以用Row两行，左边是五个星星，内部用Row,右边一个Text,下面一行我们可以看看上一个布局摆放中的例子。
        
      ''',
            style: new TextStyle(
              color: Colors.teal,
            ),
          ),
          margin: new EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        ),
        finnalContainer,
        new Image.asset('images/jpejej.png'),
        new Container(
          child: new Text(
            '''
         下面是代码:
        
        
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
        
        ''',
            style: new TextStyle(color: Colors.teal),
          ),
          margin: new EdgeInsets.all(10.0),
        )
      ],
    );
  }

  Widget getSimple2() {
    return ListView(
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.all(14.0),
          child: new Text(
            '这种布局我想在很多地方用过吧。如下图案例，当你需要在一个图标的上部或者小部件上部来显示出一层布局时候用Stack就可以搞定。我想你用了这两个案例分分钟搞定他。第一个布局会在底层，第二个布局位置由Alignment(x,y)其实x和y中间值（0.0,0.0），如果x为1代表第二个布局在低布局的右边，y为-1带边在上边，-1带边相反就可以，',
            style: new TextStyle(color: Colors.teal),
          ),
        ),
        new Center(
          child: new Stack(
            alignment: Alignment(0.1, 0.7),
            children: <Widget>[
              new CircleAvatar(
                backgroundImage: AssetImage('images/lonnv8.jpg'),
                radius: 70.0,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.redAccent),
                child: new Text(
                  'Love you',
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            ],
          ),
        ),
        //第二个
        new Stack(
          alignment: Alignment(1.0, 1.0),
          children: <Widget>[
            new Card(
              margin: new EdgeInsets.all(15.0),
              color: Colors.teal,
              child: new Center(
                child: new Image.asset(
                  'images/haha.png',
                  width: 700.0,
                  height: 200.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.all(12.0),
              child: new Card(
                child: new Container(
                  color: Colors.white,
                  width: 700.0,
                  height: 50.0,
                  child: new Center(
                    child: new Text('hahah'),
                  ),
                ),
              ),
            )
          ],
        ),
        new Text('''
            代码如下：
 new Stack(
          alignment: Alignment(1.0, 1.0),//这里x=1.0所以是紧靠右边的，y=1.0所以是紧靠下边的。
          children: <Widget>[
            new Card(
              margin: new EdgeInsets.all(15.0),
              color: Colors.teal,
              child: new Center(
                child: new Image.asset(
                  'images/haha.png',
                  width: 700.0,
                  height: 200.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.all(12.0),
              child: new Card(
                child: new Container(
                  color: Colors.white,
                  width: 700.0,//这里可以设置小点看看效果。
                  height: 50.0,
                  child: new Center(
                    child: new Text('hahah'),
                  ),
                ),
              ),
            )
          ],
        ),
            ''', style: new TextStyle(color: Colors.teal)),
      ],
    );
  }

  Widget getSimple3() {
    //图片列表加边框
    Container pictureTable = new Container(
      //盒子模型
      decoration: new BoxDecoration(
        color: Colors.teal,
      ),
      child: new Column(
        children: <Widget>[
          //标题
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Row(
              children: <Widget>[
                new Text('这个是图片排列',
                    style: new TextStyle(fontSize: 14.0, color: Colors.teal)),
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
        color: Colors.teal,
      ),
      child: new Column(
        children: [
          new Container(
            margin:
                EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 10.0),
            padding: EdgeInsets.only(left: 10.0),
            width: 600.0,
            height: 50.0,
            color: Colors.redAccent,
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
                    border:
                        new Border.all(width: 11.0, color: Colors.redAccent),
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
                    border:
                        new Border.all(width: 11.0, color: Colors.redAccent),
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
                    border:
                        new Border.all(width: 11.0, color: Colors.redAccent),
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
                    border:
                        new Border.all(width: 11.0, color: Colors.redAccent),
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
      color: Colors.white,
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
              color: Colors.teal,
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
            new Card(
              margin: new EdgeInsets.all(11.0),
              child: Container(
                width: 110.0,
                height: 82.0,
                child: new FadeInImage.memoryNetwork(
                    //让图片慢慢出现网络加载。
                    placeholder: kTransparentImage,
                    image:
                        'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                    width: 100.0,
                    height: 80.0),
                padding: new EdgeInsets.all(5.0),
              ),
            ),
          ],
        ),
      ),
    );
    return ListView(
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.all(14.0),
          child: new Text(
            ' 这里我们结合所学的基础东西可以写一个及其复杂的布局，我们要善于用Flutter的ListView控件去简化及其复杂的小部件，这样可以简化成很多个竖直方向排布的多个自定义小部件。',
            style: new TextStyle(color: Colors.teal),
          ),
        ),
        new Center(
          child: new Stack(
            alignment: Alignment(0.1, 0.7),
            children: <Widget>[
              new CircleAvatar(
                backgroundImage: AssetImage('images/lonnv8.jpg'),
                radius: 70.0,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.redAccent),
                child: new Text(
                  'Love you',
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        //第二个
        new Stack(
          alignment: Alignment(1.0, 1.0),
          children: <Widget>[
            new Card(
              margin: new EdgeInsets.all(15.0),
              color: Colors.teal,
              child: new Center(
                child: new Image.asset(
                  'images/haha.png',
                  width: 700.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.all(12.0),
              child: new Card(
                child: new Container(
                  color: Colors.white,
                  width: 700.0,
                  height: 50.0,
                  child: new Center(
                    child: new Text('hahah'),
                  ),
                ),
              ),
            ),
          ],
        ),
        finnalContainer,
        buttonSection,
        pictureTable,
        container
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      theme: new ThemeData(primaryColor: Colors.white),
      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
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
                  child: Text(title),
                  margin: new EdgeInsets.only(left: 70.0),
                ),
              ],
            ),
          ),
        ),
        body: new Container(
          //第一个界面首页可能放的东西比较多，所以这里我用了android原生里面的ScrollView同样的小部件ListView
          child: index == 2
              ? getListSimple1()
              : index == 3
                  ? getSimple2()
                  : index == 4
                      ? getSimple3()
                      : index == 5
                          ? new Container(
                              margin: new EdgeInsets.only(top: 100.0),
                              child: new Widght_3D(
                                  size: const Size(400.0, 400.0),
                                  path: "assets/NVpose1.obj",
                                  asset:
                                      true), //assets/file.obj为我们的本地obj文件，需要到pubspec.yaml中进行配置
                            )
                          : new Text('haha'),
        ),
      ),
    );
  }
}
