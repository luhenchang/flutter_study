import 'dart:async';
import 'dart:io';
import 'package:flutter_app/flutter_WidghtUtils/MyContainImageUtils.dart';
import 'package:flutter_app/flutter_WidghtUtils/MyContainUtils.dart';
import 'package:flutter_app/http_utils/HttpUtils.dart';
import 'package:flutter_app/showmain.dart';
import 'package:flutter_app/test/SqlUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './Widght_3D.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/http_utils/HttpUtils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RegistPagerState();
  }
}

class RegistPagerState extends State<RegistPager>
    with SingleTickerProviderStateMixin {
  String _userPhone;
  String _passWold;

  _Register(String userName, String password, BuildContext context) async {
    String url =
        "http://116.62.149.237:8080/USR000100000?usrName=$userName&&User_passwd=$password";
    bool result;
    try {
      result = await http.get(url).then((http.Response response) {
        print(response.body);
        var data = json.decode(response.body);
        String rescode = data["rescode"];
        print(rescode);
        if (rescode == '999999') {
          Fluttertoast.showToast(
              msg: "注册失败",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos:1,
          );
        } else if (rescode == '000000') {
          Fluttertoast.showToast(
              msg: "注册正确",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos:1,
          );
        }
      });
    } catch (e) {
      return result;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final height_screen = MediaQuery.of(context).size.height;
    final width_srcreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              color: Colors.blue,
              gradient: new LinearGradient(
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.5, 1.0),
                colors: <Color>[Color(0xFF4DD0E1), Colors.white70],
              ),
            ),
            padding: new EdgeInsets.only(top: 150.0),
            child: SizedBox(
              height: height_screen * 4 / 7,
              child: Card(
                elevation: 10.0,
                margin: EdgeInsets.only(
                    top: 0.0, left: 40.0, right: 40.0, bottom: 60.0),
                child: Stack(
                  alignment: Alignment(0.0, 1.0),
                  children: <Widget>[
                    MyContainImageUtils(""),
                    Container(
                      child: Container(
                        margin:EdgeInsets.only(left: 40.0,right:40.0),
                        child: ListView(
                          children: <Widget>[
                            new SizedBox(
                              height: 150.0,
                            ),
                            new TextField(
                              onChanged: (phone) => _userPhone = phone,
                              // enabled: !snapshot.data,
                              style: new TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              decoration: new InputDecoration(
                                  hintText: 'please input you userName',
                                  labelText: "User Name",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.0),
                                  hintStyle: TextStyle(fontSize: 12.0)),
                            ),

                            new SizedBox(
                              height: 10.0,
                            ),
                            new TextField(
                              onChanged: (world) => _passWold = world,
                              // enabled: !snapshot.data,
                              style: new TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              decoration: new InputDecoration(
                                  hintText: 'please input you password',
                                  labelText: "User password",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.0),
                                  hintStyle: TextStyle(fontSize: 12.0)),
                            ),
                            new SizedBox(
                              height: 40.0,
                            ),
                            Material(
                              //带给我们Material的美丽风格美滋滋。你也多看看这个布局
                              elevation: 10.0,
                              color: Colors.transparent,
                              shape: const StadiumBorder(),
                              child: InkWell(
                                onTap: () {
                                  //登陆
                                  print(_userPhone);
                                  print(_passWold);
                                  _Register(
                                      this._userPhone, this._passWold, context);
                                },
                                //来个飞溅美滋滋。
                                splashColor: Colors.purpleAccent,
                                child: Ink(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF4DD0E1),
                                      Color(0xFF00838F)
                                    ],
                                  )),
                                  child: Center(
                                    child: Text(
                                      'Register',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Go Login',
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
