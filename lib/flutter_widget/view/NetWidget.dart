import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/http_utils/HttpUtils.dart';

//导入网络请求相关的包
import 'package:http/http.dart' as http;

class NetWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NetWidgetState();
  }
}

class NetWidgetState extends State<NetWidget> {
  List list;

  //https://qy.healthinfochina.com:8080/DOC000010041?ishot=1&pageSize=2&currentPage=1
  //'http://www.wanandroid.com/project/list/1/json?cid=1'
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, String> parames = new Map();
    parames['ishot'] = '1';
    parames['pageSize'] = '2';
    parames['currentPage'] = '1';

    new HttpUtils('http://www.wanandroid.com/project/list/1/json?cid=1')
        .get()
        .then((dynamic res) {
      setState(() {
        list = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(children: list != null ? _getItem() : _loading()),
    );
  }

  //预加载布局
  List<Widget> _loading() {
    return <Widget>[
      new Container(
        height: 300.0,
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            new Text("正在加载"),
          ],
        )),
      )
    ];
  }

  List<Widget> _getItem() {
    return list.map((item) {
      return new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: _getRowWidget(item),
        ),
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),
      );
    }).toList();
  }

  Widget _getRowWidget(item) {
    return new Row(
      children: <Widget>[
        new Flexible(
            flex: 1,
            fit: FlexFit.tight, //和android的weight=1效果一样
            child: new Stack(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Text("${item["title"]}".trim(),
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.left),
                    new Text(
                      "${item["desc"]}",
                      maxLines: 3,
                    )
                  ],
                )
              ],
            )),
        new ClipRect(
          child: new FadeInImage.assetNetwork(
            placeholder: "images/haha.png",
            //如果没有加载那么默认一张本地的哦
            image: "${item['envelopePic']}",
            width: 50.0,
            height: 50.0,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
