import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDrawerState();
  }
}

class MyDrawerState extends State<MyDrawer> {
  Widget _getHeader() {
    return new Container(
      width: MediaQuery.of(context).size.width * 9 / 11,
      height: MediaQuery.of(context).size.height * 1 / 3,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('images/drawbg.png'), fit: BoxFit.fitWidth)),
      //头像
      child: new Container(
        color: Color(0x42000000),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              margin: new EdgeInsets.only(top: 35.0, left: 20.0, right: 21.0),
              child: Image.asset("images/erweima.png"),
            ),
            Container(
              margin: new EdgeInsets.only(top: 30.0, left: 20.0),
              child: Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment(0.9, -1.0),
                    children: <Widget>[
                      Container(
                        padding: new EdgeInsets.all(3.0),
                        child: ClipOval(
                          child: Image.asset(
                            'images/haha.png',
                            width: 35.0,
                            height: 35.0,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(158.0))),
                      ),
                      ClipOval(
                        child: new Container(
                          color: Colors.redAccent,
                          width: 12.0,
                          height: 12.0,
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      '路很长0O0',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            //星星
            Container(
              margin: new EdgeInsets.only(left: 20.0, top: 4.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.wb_sunny, size: 15.0, color: Color(0xFFF9A825)),
                  Icon(Icons.wb_sunny, size: 15.0, color: Color(0xFFF9A825)),
                  Icon(Icons.wb_sunny, size: 15.0, color: Color(0xFFF9A825)),
                  Icon(Icons.brightness_4,
                      size: 13.0, color: Color(0xFFF9FBE7)), //月亮
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: new EdgeInsets.only(top: 6.0, left: 20.0),
              child: Text(
                '世界我都没去过，哪来世界观',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ConstrainedBox(
        constraints: new BoxConstraints.expand(
            width: MediaQuery.of(context).size.width * 9 / 11),
        // ignore: const_with_non_constant_argument, invalid_constant
        child: new Material(
          elevation: 16.0,
          child: new Container(
            width: MediaQuery.of(context).size.width * 9 / 11,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                //头布局
                _getHeader(),
                //中间内容
                _getContent(),
                //为布局
                new Expanded(
                  child: Container(
                    margin: new EdgeInsets.only(
                        top: 80.0, right: 70.0, bottom: 20.0),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              color: Color(0xFF616161),
                            ),
                            Text(
                              '设置',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.wb_sunny,
                              color: Color(0xFF616161),
                            ),
                            Text(
                              '夜间',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.ac_unit,
                              color: Color(0xFF616161),
                            ),
                            Text(
                              '天津',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _getContent() {
    return new Container(
      child: new Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.add_to_queue,
                      size: 20.0, color: Colors.black87),
                ),
                Text(
                  '了解会员特权',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.tab, size: 20.0, color: Colors.black87),
                ),
                Text(
                  'QQ钱包',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child:
                      Icon(Icons.color_lens, size: 20.0, color: Colors.black87),
                ),
                Text(
                  '个性化装扮',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.collections,
                      size: 20.0, color: Colors.black87),
                ),
                Text(
                  '我的收藏',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.collections,
                      size: 20.0, color: Colors.black87),
                ),
                Text(
                  '我的相册',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.email, size: 20.0, color: Colors.black87),
                ),
                Text(
                  '我的文件',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.bluetooth_connected,
                      size: 20.0, color: Colors.black87),
                ),
                Text(
                  '免流量特性',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
