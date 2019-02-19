import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_app/RegistPager.dart';
import 'package:flutter_app/flutter_WidghtUtils/MyContainUtils.dart';
import 'package:flutter_app/http_utils/HttpUtils.dart';
import 'package:flutter_app/http_utils/Toasty.dart';
import 'package:flutter_app/showmain.dart';
import 'package:flutter_app/test/SqlUtils.dart';
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
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(
    new MaterialApp(
      title: 'app',
      theme: new ThemeData(
        primaryColor:Colors.lightBlueAccent,
      ),
      home: new MyLoginWidget(),
    ),
  );
}
//登录按钮
class LoginButton extends StatelessWidget {
  final String userName;
  final String Password;
  LoginButton({Key k, this.userName, this.Password});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: OutlineButton(
          borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 3.0,
              style: BorderStyle.none),
          onPressed: () {
            if (1212 != '123456' || 1212 != '123456') {
              final snackBar = SnackBar(
                content: Text('用户名和密码错误!'),
                action: SnackBarAction(
                    label: '退出',
                    onPressed: () {
                      Navigator.of(context).pop(this);
                    }),
              );

              // Find the Scaffold in the Widget tree and use it to show a SnackBar!
              Scaffold.of(context).showSnackBar(snackBar);
            }
          },

          child: new Text(
            '登陆',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        height: 45.0,
        decoration: new BoxDecoration(
            color: Color(0xFFB2EBF2),
            borderRadius: BorderRadius.all(const Radius.circular(58.0))),
      ),
      margin: new EdgeInsets.symmetric(horizontal: 60.0),
    );
  }
}

class MyLoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyLoginState();
}

class MyLoginState extends State<MyLoginWidget>  with TickerProviderStateMixin{
  final scaffoldState = GlobalKey<ScaffoldState>();
  var demonPlugin=new MethodChannel('demo.plugin');

  TodoProvider todoProvider = new TodoProvider();
  AppLifecycleState _lastLifecycleState;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  String _userPhone;
  String _passWold;

  //TODO 文件读取:通过文件来读取，如果第一次登陆成功那么就记住用户名
  Future<File> _getLocalFile() async {
    //获取应用程序的私有位置
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/login.txt');
  }

  //写数据
  Future<Null> _writerDataToFile() async {
    print(_userPhone);
    // write the variable as a string to the file
    await (await _getLocalFile()).writeAsString('$_userPhone');
  }
   AnimationController animationController;

  //读数据
  Future<String> _readData() async {
    try {
      File file = await _getLocalFile();
      // read the variable as a string from the file.
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return '123';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=new AnimationController(vsync:this,duration:Duration(milliseconds: 2000));
    //WidgetsBinding.instance.addObserver(this);
    print('进入了');
    iniSqlite();
    getDataForSql();
    _readData().then((inputs) {
      print('inputs=$inputs');
      setState(() {
        _userPhone = inputs;
      });
    });
  }

  void getDataForSql() async {
    if (todoProvider.db != null) {
      var data = await todoProvider.getTodo(1);
      if (data != null) {
        Map map = data as Map;
        print(map['title']);
      } else {
        print('null');
      }
    }
  }

  //实例化数据库
  void iniSqlite() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "demo.db");
    todoProvider.open(path);
  }

  Future<bool> _Login(
      String userName, String password, BuildContext context) async {
    /*//数据库插入语句：
    Todo todo = new Todo();
    todo.title =userName;
    todo.done = true;
     todoProvider.insert(todo);

*/
    String url =
        "http://116.62.149.237:8080/USR000100001?usrName=$userName&passwd=$password";
    bool result;
    try {
      result = await http.get(url).then((http.Response response) {
        print(response.body);
        var data = json.decode(response.body);
        String rescode = data["rescode"];
        print(rescode);
        if (rescode == '999999') {
         /* showDialog(
              context: context,
              builder: (ctx) => new AlertDialog(
                    content: new Text('登录不成功'),
                  ));*/
          Fluttertoast.showToast(
              msg: " 登录失败 ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos:1,

          );
        } else if (rescode == '000000') {
          _writerDataToFile();
          Navigator.of(context).push(new PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return new MyHomePager();
                },
              ));
          Fluttertoast.showToast(
              msg: "  登录成功！ ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
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
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height_screen = MediaQuery.of(context).size.height;
    final width_srcreen = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      key: scaffoldState,
      backgroundColor: Colors.white,
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new Container(
          child: Stack(
            fit: StackFit.expand,
            //alignment: Alignment(0.1, 0.3),
            children: <Widget>[
              new Container(
                alignment: Alignment.topCenter,
                child: MyContainUtils(""),
              ),
              Card(
                color: Colors.white70,
                margin: EdgeInsets.only(
                    top: 190.0, right: 50.0, left: 50.0, bottom: 100.0),
                elevation: 11.0,
                child: Container(
                  alignment: Alignment.center,
                  width: width_srcreen - 120,
                  child: new Container(
                    margin: new EdgeInsets.all(16.0),
                    child: ListView(
                      children: <Widget>[
                        new SizedBox(
                          height: 30.0,
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
                                  fontWeight: FontWeight.w700, fontSize: 13.0),
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
                                  fontWeight: FontWeight.w700, fontSize: 13.0),
                              hintStyle: TextStyle(fontSize: 12.0)),
                        ),
                        new SizedBox(
                          height: 50.0,
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

                              _Login(this._userPhone, this._passWold, context);
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
                                  'Login',
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
                                demonPlugin.invokeMethod('http://jzvd.nathen.cn/d525f756aabf4b0588c2152fb94e07f5/d9f59bef829a472a9ca066620d9b871a-5287d2089db37e62345123a1be272f8b.mp4');
                              },
                              child: Text(
                                'Forget pd',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(new PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) {
                                        return new RegistPager();
                                      },
                                    ));
                              },
                              splashColor: Colors.purpleAccent,
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF4DD0E1),
                                    Color(0xFF00838F)
                                  ],
                                )),
                                child: Text(
                                  'Regist',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.5, 1.0),
              colors: <Color>[Colors.white, Color(0xFFD7CCC8)],
            ),
          ),
        ),
      ),
    );
  }
}
