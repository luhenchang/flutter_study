import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_widget/modle/HotSearchBean.dart';

void main() {
  runApp(new MaterialApp(
    title: '搜索',
    theme: new ThemeData(
        primaryColor: Colors.redAccent,
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.teal)),
        primaryIconTheme: IconThemeData(color: Colors.lightBlue)),
    home: new MainSearchPager(),
  ));
}

class MainSearchPager extends StatefulWidget {
  @override
  _MainSearchPagerState createState() => new _MainSearchPagerState();
}

class _MainSearchPagerState extends State<MainSearchPager> {
  List<HotSearchBean> mHotData;
  List<HotSearchBean> mHostory;

  @override
  void initState() {
    mHotData = new List<HotSearchBean>();
    mHotData.add(
      new HotSearchBean(
        Icons.print,
        '秦桧一品西安小吃',
        Color(0xFFF57F17),
      ),
    );
    mHotData.add(
      new HotSearchBean(
        Icons.print,
        '杨明宇黄焖鸡米饭',
        Color(0xFFF57F17),
      ),
    );
    mHotData.add(
      new HotSearchBean(
        Icons.print,
        '霸王接头小吃',
        Color(0xFFF57F17),
      ),
    );
    mHotData.add(
      new HotSearchBean(
        Icons.print,
        '酱骨头',
        Color(0xFFF57F17),
      ),
    );
    mHotData.add(
      new HotSearchBean(
        Icons.print,
        '如家漂泊 -云酒店入住',
        Color(0xFFF57F17),
      ),
    );

    //历史记录
    mHostory = new List();
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '秦桧一品西安小吃',
        Color(0xFF757575),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '杨明宇黄焖鸡米饭',
        Color(0xFF757575),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '霸王接',
        Color(0xFF757575),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '酱骨头',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '如家漂泊 -云酒店入住',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '秦桧一品西安小吃',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '杨明宇黄焖鸡米饭',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '霸王接头小吃',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '消炎药',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '如家漂泊 -云酒店入住',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '秦桧一品西安小吃',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '杨明宇黄焖鸡米饭',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '霸王接头小吃',
        Color(0xFFF57F17),
      ),
    );
    mHostory.add(
      new HotSearchBean(
        Icons.print,
        '杨明宇黄焖鸡米饭',
        Color(0xFFF57F17),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          titleSpacing: 0.0,
          textTheme: TextTheme(title: TextStyle(color: Colors.redAccent)),
          automaticallyImplyLeading: false,
          title: new Container(
            child: new Card(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      child: IconButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        icon:Icon( Icons.keyboard_arrow_left),
                        color: Colors.grey,
                      ),
                      margin: new EdgeInsets.only(
                          left: 0.0, top: 8.0, bottom: 12.0),
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
                        margin: new EdgeInsets.only(left: 1.0),
                      ),
                    ),
                    new Container(
                      margin: new EdgeInsets.only(left: 5.0, right:5.0),
                      padding: new EdgeInsets.only(left: 10.0),
                      height: 30.0,
                      width: 220.0,
                      decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(58.0))),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            size: 20.0,
                            color: Colors.black54,
                          ),
                          Container(
                            child: Container(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: Center(
                                child: Form(
                                  autovalidate: true,
                                  child: TextFormField(
                                    style: new TextStyle(color: Colors.teal),
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration.collapsed(
                                      fillColor: Colors.white,
                                      hintText: '杨米宇黄焖鸡米饭...',
                                      hintStyle: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.black45),
                                      filled: false,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            width: 130.0,
                            height: 35.0,
                          ),
                        ],

                      ),
                    ),
                    IconButton(padding:new EdgeInsets.all(1.0),icon: Icon(Icons.search), onPressed: () {})
                  ],
                ),
                width: 600.0,
                height: 55.0,
              ),
              margin: new EdgeInsets.only(top: 1.0, bottom: 2.0),
            ),
          )),
      body: ListView(
        children: <Widget>[
          Container(
            margin: new EdgeInsets.only(left: 12.0, top: 20.0),
            child: new Text(
              '热门搜索',
              style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: new EdgeInsets.only(left: 6.0),
            child: Wrap(
              children: List.generate(
                mHotData.length,
                (i) => Container(
                      height: 32.0,
                      margin: new EdgeInsets.all(5.9),
                      padding: new EdgeInsets.only(
                          left: 10.0, right: 5.0, top: 8.0, bottom: 11.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.9),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          i < 2
                              ? Icon(
                                  mHotData[i].icon_Icon,
                                  size: 15.0,
                                  color: mHotData[i].color_icon,
                                )
                              : Container(),
                          new Text(
                            mHotData[i].title_string,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
              ),
            ),
          ),
          Container(
            margin: new EdgeInsets.only(left: 12.0, top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  '历史记录',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: new EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.delete_forever,
                    size: 22.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: new EdgeInsets.only(left: 6.0),
            child: Wrap(
              children: List.generate(
                mHostory.length,
                (i) => Container(
                      height: 32.0,
                      margin: new EdgeInsets.all(4.9),
                      padding: new EdgeInsets.only(
                          left: 10.0, right: 5.0, top: 8.0, bottom: 11.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.9),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          i < 2
                              ? Icon(
                                  mHostory[i].icon_Icon,
                                  size: 15.0,
                                  color: mHostory[i].color_icon,
                                )
                              : Container(),
                          new Text(
                            mHostory[i].title_string,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
