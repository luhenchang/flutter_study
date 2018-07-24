import 'dart:async';
import 'dart:io';
import 'package:flutter_app/http_utils/HttpUtils.dart';
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

void main() {
  runApp(
    new MaterialApp(
      title: 'app',
      theme: new ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.purple,
        accentColor: Colors.orangeAccent[400],
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

class MyLoginState extends State<MyLoginWidget> {
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

  void getDataForSql()async{
    if(todoProvider.db!=null) {
      var data = await todoProvider.getTodo(1);
      /*
    * final String tableTodo = "todo";
final String columnId = "_id";
final String columnTitle = "title";
final String columnDone = "done";*/
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
    //{"resobj":{"usrName":"haha","passwd":"123456"},"rescode":"000000"}
    try {
      result = await http.get(url).then((http.Response response) {
        print(response.body);
        var data = json.decode(response.body);
        String rescode = data["rescode"];
        print(rescode);
        if (rescode == '999999') {
          showDialog(
              context: context,
              builder: (ctx) => new AlertDialog(
                    content: new Text('登录不成功'),
                  ));
        } else if (rescode == '000000') {
          _writerDataToFile();
          Navigator.of(context).push(new PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return new MyHomePager();
                },
              ));
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: new ExactAssetImage(
                  'images/backgroud6.jpg',
                ),
                fit: BoxFit.fill),
          ),
          child: ListView(
            children: <Widget>[
              new Container(
                //第一个
                alignment: Alignment.centerLeft,
                width: 600.0,
                height: 140.0,
                child: Text('欢迎登陆 Flutter',
                    style: new TextStyle(
                        fontSize: 23.0, fontWeight: FontWeight.w100)),
                padding: new EdgeInsets.only(left: 30.0),
                // foregroundDecoration: new BoxDecoration(image:new DecorationImage(image:NetworkImage('https://www.example.com/images/frame.png')),),
              ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.bottomCenter,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                            child: Text('+86 >'),
                            height: 60.0,
                            padding: new EdgeInsets.only(top: 12.0, right: 5.0),
                          ),
                          new Expanded(
                            child: new Form(
                              key: _formKey,
                              child: new Container(
                                child: TextFormField(
                                  validator: (v) => (v == null || v.isEmpty)
                                      ? "请填写手机号"
                                      : null,
                                  onSaved: (value) => this._userPhone = value,
                                  obscureText: false,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelStyle: theme.textTheme.caption
                                          .copyWith(color: theme.primaryColor),
                                      contentPadding:
                                          new EdgeInsets.only(bottom: 7.4),
                                      fillColor: Colors.blue,
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 300.0)),
                                      hintText: _userPhone == null
                                          ? '请输入手机号'
                                          : _userPhone,
                                      helperText: 'user Phone',
                                      helperStyle: new TextStyle(
                                        fontSize: 11.0,
                                        color: Colors.black26,
                                      ),
                                      hintStyle: new TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.black38)),
                                ), //这里可以让下划线变红色
                                /* decoration: new BoxDecoration(
                                  color: Colors.white,
                                  border: new Border(
                                    bottom: new BorderSide(
                                        color: Colors.teal,
                                        style: BorderStyle.solid),
                                  ),
                                ),*/
                              ),
                            ),
                          ),
                        ],
                      ),
                      height: 70.0,
                      width: 600.0,
                      margin: new EdgeInsets.only(left: 35.0, right: 60.0),
                    ),
                    new Container(
                      width: 600.0,
                      height: 100.0,
                      child: new Form(
                        key: _formKey1,
                        child: new TextFormField(
                          validator: (v) =>
                              (v == null || v.isEmpty) ? "请填写密码" : null,
                          onSaved: (value) => this._passWold = value,
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel),
                                iconSize: 15.0,
                                color: Colors.black26,
                                onPressed: () {
                                  setState(() {
                                    _formKey1.currentState.reset();
                                  });
                                }, /* Icons.cancel,
                                size: 15.0,
                                color: Colors.black26,*/
                              ),
                              fillColor: Colors.blue,
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 300.0)),
                              hintText: '  请输入密码',
                              // prefixIcon: Icon(Icons.add),
                              helperText: 'user Password',
                              helperStyle: new TextStyle(
                                fontSize: 11.0,
                                color: Colors.black26,
                              ),
                              hintStyle: new TextStyle(
                                  fontSize: 13.0, color: Colors.black38)),
                        ),
                      ),
                      margin: new EdgeInsets.only(left: 75.0, right: 60.0),
                    ),
                  ],
                ),
              ),
              new Container(
                child: Container(
                  child: OutlineButton(
                    borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 3.0,
                        style: BorderStyle.none),
                    onPressed: () {
                      final form = _formKey.currentState;
                      final form1 = _formKey1.currentState;
                      if (form.validate()) {
                        form.save();
                      }
                      if (form1.validate()) {
                        form1.save();
                      }
                      //登陆
                      _Login(this._userPhone, this._passWold, context);
                    },
                    child: new Text(
                      '登陆',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  height: 45.0,
                  decoration: new BoxDecoration(
                      color: Color(0xFFB2EBF2),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(58.0))),
                ),
                margin: new EdgeInsets.symmetric(horizontal: 60.0),
              ),
              new Container(
                margin: new EdgeInsets.only(left: 65.0, right: 65.0, top: 20.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new GestureDetector(
                      child: new Container(
                        child: new Text(
                          '验证登录',
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.black38),
                        ),
                      ),
                    ),
                    new GestureDetector(
                      child: new Container(
                        child: new Text(
                          '忘记密码',
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.black38),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Container(
                            child: OutlineButton(
                              onPressed: () {},
                              child: Image.asset('images/weixing.png'),
                              borderSide:
                                  new BorderSide(style: BorderStyle.none),
                            ),
                            width: 60.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                border: new Border.all(color: Colors.black12),
                                //  color: Color(0xFFB2EBF2),
                                borderRadius: BorderRadius
                                    .all(const Radius.circular(58.0))),
                          ),
                          new Container(
                            child: OutlineButton(
                              onPressed: () {},
                              child: Image.asset('images/qq.png'),
                              borderSide:
                                  new BorderSide(style: BorderStyle.none),
                            ),
                            width: 60.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                border: new Border.all(color: Colors.black12),
                                borderRadius: BorderRadius
                                    .all(const Radius.circular(58.0))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                margin: new EdgeInsets.only(top: 100.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
