import 'package:flutter/material.dart';

class WidgetText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WidgetTextState();
  }
}

class WidgetTextState extends State<WidgetText> {
  bool is_true = true;

  _pressIntoText() {
    setState(() {
      is_true = !is_true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start, //这个是纵向管理
        children: <Widget>[
          //这里我为了点击展示文本
          new GestureDetector(
            onTap: _pressIntoText,
            child: new Card(
              child: new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        child: new Text('希望帮助你:',
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0)),
                        width: 700.0,
                        height: 40.0,
                        margin: new EdgeInsets.only(left: 20.0, top: 20.0),
                      ),
                    ),
                    new Container(
                      child: new Text('点击阅读下文我三天的学习历程',
                          style: new TextStyle(
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.bold)),
                      width: 240.0,
                      height: 40.0,
                      margin: new EdgeInsets.only(left: 10.0, top: 20.0),
                    ),
                  ],
                ),
                decoration: new BoxDecoration(color: Colors.orangeAccent),
              ),
              margin: new EdgeInsets.all(1.0),
            ),
          ),
          new Container(
            child: is_true
                ? new Image.asset('images/haha.png')
                : new Text(
                    '''
                                              内容
                                              
           学了三天可以写项目？没骗你，当然了，我希望开发者开发过Android和Ios或者写过前端的人员。我是做安卓开发的，平时没事学学HTML+CSS+JS+JQURY以及接触过一些前端框架，当然了学一门我相信同样随随便便搞定布局和交互，因为不管是android是Web端都是盒子模型去理解布局之间的摆放，同样也有线性布局同样的小部件列和行来进行很好的排版，以及使用Container来构成盒子模型精细左右上下间距。       
           
           1.布局方面我觉得对于一门开发来说是最基本也是很大一部分，所以第一时间我搞布局。我是周一搭建环境的，我建议直接去逛网下载Flutter包，然后配置就可以，git克隆多次失败而且下载确实文件，导致失败率高。二周到下午快下班时候我基本看完布局之后写了好几个多样性复杂的静态布局界面。其实说实话百分之70搞定了。
        
           
           2.交互我周二晚上看了点，周三一早搞定了，然后写了跳转界面以及部分动画，定义方法和点击事件交互等，这部分如果学过java或者OC的人来说很快掌握的。
           
           3.对于系统的调用真得去官方文档里面练习。这个我会在项目中多些写调用。并一直完善。
            ''',
                    style: new TextStyle(color: Colors.teal),
                  ),
            margin: new EdgeInsets.all(10.0),
          )
        ],
      ),
    );
  }
}
