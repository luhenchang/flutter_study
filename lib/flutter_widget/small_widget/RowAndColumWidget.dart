import 'package:flutter/material.dart';

class RowAndColumWidget extends StatefulWidget {
  final int index;
  RowAndColumWidget({Key key,this.index}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return RowAndColumState();
  }
}

class RowAndColumState extends State<RowAndColumWidget> {
  final int index;
  RowAndColumState({Key key,this.index});


  //todo 这个是下面三行lable一行和Text两行
  Container endEnd = new Container(
    child: new Container(
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
      margin: new EdgeInsets.only(top: 5.0),
    ),
    color: Colors.white,
    height: 60.0,
  );

  @override
  Widget build(BuildContext context) {
    Widget image=new Container(child:new Image.asset('images/row.png',width: 300.0,height:300.0,),decoration: new BoxDecoration(color: Colors.red),margin: new EdgeInsets.all(10.0),);
    return new MaterialApp(
        theme: new ThemeData(primaryColor: Color(0xFF00796B)),
        home: new Scaffold(
          backgroundColor: Colors.teal,
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
                    child: Text('小部件排列'),
                    margin: new EdgeInsets.only(left: 70.0),
                  ),
                ],
              ),
            ),
          ),
          body: new ListView(
            children: <Widget>[
              new Text(
                '''                   小部件排列

          行和列这两个小部件，在Flutter里面很好的解决了水平和竖直方向上的部件排列问题。Row：在水平方向上如果想放很多个水平排布的图片和文字那么这时候需要Row将小部件水平排列。如果在一个容器中有小部件都是竖直方向上排列那么，我们可以用Colum，遇到一个容器中既有水平又有数值方向那么这时候需要Colum和Row使用。如下：
          案例一：我们可以看见这是一个水平白色容器中间有三个列，每一列就有三行（图标，加粗英文，小字体时间），这时候我们必须分析清楚：三列如何来？首先一个Contain容器白色背景，然后来一个Row行作为放三列的布局，然后每一个裂用Colum因为每一列是竖直方向排布所以用Colum，每一个Colum里面有三个孩子（图标，文字加粗，文字）就ok了
          ''',
                style: new TextStyle(color: Colors.white, letterSpacing: 4.0),
              ),
              endEnd,
              image,
              new Text('''
              大多数情况应该如您所料，但您可能想知道容器（以粉色显示）。Container是一个小部件，允许您自定义其子部件。如果要添加填充，边距，边框或背景颜色，请使用Container来命名其某些功能。

在此示例中，每个Text小部件都放在Container中以添加边距。整个Row也放在一个Container中，以便在行周围添加填充。

本例中的其余UI由属性控制。使用其color属性设置Icon的颜色。使用Text的style属性设置字体，颜色，重量等。列和行具有允许您指定其子项垂直或水平对齐方式的属性，以及子项应占用的空间大小。


布置一个小部件
重点是什么？

甚至应用程序本身也是一个小部件。
创建一个小部件并将其添加到布局小部件很容易。
要在设备上显示小部件，请将布局小部件添加到应用小部件。
最简单的方法是使用Scaffold，它是 Material Components库中的一个小部件，它提供了一个默认的横幅，背景颜色，并且有用于添加抽屉，小吃店和底部工作表的API。
如果您愿意，可以构建仅使用小部件库中的标准小部件的应用程序。
              
              ''', style: new TextStyle(color: Colors.white, letterSpacing: 2.0),),
            ],
          ),
        ));
  }
}
