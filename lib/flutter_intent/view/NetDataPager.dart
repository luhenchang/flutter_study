import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//TODO-------------------------------------END--------------------

class NetDataPager extends StatefulWidget {
  final index;

  NetDataPager({Key key, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new NetDataPagerState(index);
  }
}

class NetDataPagerState extends State<NetDataPager> {
  List widgets = [];
  int index;

  NetDataPagerState(this.index);

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Color(0xFF00796B)),
      home: new Scaffold(
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
                  child: Text(index == 0 ? '网络交互学习' : '更新中'),
                  margin: new EdgeInsets.only(left: 70.0),
                ),
              ],
            ),
          ),
        ),
        body: new Container(
            color: Colors.teal,
            child: widgets.length == 0
                ? new Center(
                    child: CircleAvatar(
                      child: new CircularProgressIndicator(backgroundColor: Colors.white,),
                    ),
                  )
                : ListView.builder(
                    itemCount: index == 0 ? widgets.length : 1,
                    itemBuilder: (BuildContext context, int position) {
                      return getRow(position);
                    })),
      ),
    );
  }

  Widget getRow(int position) {
    return index == 0
        ? Container(
            child: new Stack(
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
                        child: new Text("Row ${widgets[position]["title"]}"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : new Text('更新中...');
  }
}
