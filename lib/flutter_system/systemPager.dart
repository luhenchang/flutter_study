import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
//动画
class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFadeTest createState() => new _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;
  Animation<double> afteranimao;
  bool isInout = true;

  void _pressdHe() {
    setState(() {
      isInout = !isInout;
    });
  }

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    afteranimao = new Tween(begin: 0.0, end: 300.0).animate(controller);
    curve = new CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Center(
          child: new Container(
            child: new FadeTransition(
              opacity: isInout ? afteranimao : curve,
              child: new FlutterLogo(
                size: 100.0,
              ),
            ),
          ),
        ),
        new FloatingActionButton(
          tooltip: 'Fade',
          child: new Icon(Icons.brush),
          onPressed: () {
            _pressdHe;
            controller.forward();
          },
        ),
      ],
    );
  }
}


class systemPager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new systemPagerState();
  }

}

class systemPagerState extends State<systemPager>{
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Container(
          color: Colors.teal,
          child: new Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                color: Colors.teal,
                child: new ClipOval(
                  //这个一般可以作为圆形的裁剪哦。
                  child: new SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: _image == null
                        ? new Text('点击右边的按钮添加图片')
                        : new Image.file(
                      _image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                /*
                                      *
                                      */ /*
                                      child: _image == null
                                          ? new Text('点击右边的按钮添加图片')
                                          : new Image.file(
                                              _image,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.fill,
                                            ),*/
              ),
              new FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: new Icon(Icons.add_a_photo),
              ),
            ],
          ),
          width: 600.0,
          height: 200.0,
        ),
        new MyFadeTest(),

        new Placeholder(
          fallbackHeight: 100.0,
          fallbackWidth: 100.0,
          strokeWidth: 10.0,
          color: Colors.teal,
        ),
        // new Text(namess == null ? "没有储存成功" : namess),
      ],
    );
  }

}