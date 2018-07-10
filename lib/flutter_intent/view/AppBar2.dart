import 'package:flutter/material.dart';

class AppBar2 extends StatelessWidget {
  final int index1;

  AppBar2({Key key, this.index1}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 600.0,
        child: index1 == 0
            ? new Container(
          width: 600.0,
          child: index1 == 0
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
                            color: Color(0xFFEEEEEE),
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
                                        hintText: '杨米宇黄焖鸡米饭...',
                                        hintStyle: TextStyle(
                                            fontSize: 13.0,
                                            color:
                                            Colors.black45),
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
              : new Text(index1 == 1 ? 'Flutter-交互' : 'Flutter--系统调用'),
        ) : new Container(
          child: new Card(
            child: Container(
              child: Row(
                children: <Widget>[
                  new Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.map,
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
                  new SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 3 - 10,
                    child: Container(
                      child: Text(
                        '万科金奥国际',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: new EdgeInsets.only(left: 11.0),
                    ),
                  ),
                  new Icon(Icons.expand_more, color: Colors.black45),
                  new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      padding: new EdgeInsets.only(left: 10.0),
                      height: 30.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.all(
                              const Radius.circular(5.0))),
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
                                      hintText: '找附近吃喝玩乐...',
                                      hintStyle: TextStyle(
                                          fontSize: 13.0,
                                          color:
                                          Colors.black45),
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
                            width: 80.0,
                            height: 35.0,
                          ),
                        ],
                      )),
                ],
              ),
              width: 600.0,
              height: 55.0,
            ),
            margin: new EdgeInsets.only(top: 1.0, bottom: 2.0),
          ),
        )
    );
  }


}
