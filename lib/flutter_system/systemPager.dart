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

class systemPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new systemPagerState();
  }
}

class systemPagerState extends State<systemPager> {
  File _image;
  bool _visible = false;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Offset> _points = <Offset>[];
    return new ListView(
      children: <Widget>[
        new Container(
          color: Colors.teal,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        new Opacity(
          opacity: _visible ? 1.0 : 0.0,
          child: const Text('Now you see me, now you don\'t!'),
        ),
        //交叉
        new Container(
          child: new Transform(
            alignment: Alignment.center,
            transform: new Matrix4.skewX(44.0)..rotateZ(90.0),
            //transform: new Matrix4.skewY(0.3)..rotateZ(-155.0),
            child: SizedBox(
              width: 10.0,
              height: 50.0,
              child: new Container(
                width: 10.0,
                height: 30.0,
                padding: const EdgeInsets.all(1.0),
                color: const Color(0xFFE8581C),
                child: Image.asset(
                  'images/haha.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          width: 600.0,
          height: 100.0,
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/haha.png'), fit: BoxFit.fill)),
        ),
        new Container(
          color: Colors.redAccent,
          width: 44.0,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return new RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            child: Center(
                //stupid
                child: Text(
              '哈哈',
              style: TextStyle(
                  color: Colors.lightBlue, fontWeight: FontWeight.bold),
            )),
          ),
        ),
        new Placeholder(
          fallbackHeight: 10.0,
          fallbackWidth: 100.0,
          strokeWidth: 10.0,
          color: Colors.yellow,
        ),
        new Opacity(
          opacity: _visible ? 1.0 : 0.0,
          child: const Text('Now you see me, now you don\'t!'),
        ),
        //
        new GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox referenceBox = context.findRenderObject();
              Offset localPosition =
                  referenceBox.globalToLocal(details.globalPosition);
              _points = new List.from(_points)..add(localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: new CustomPaint(painter: new SignaturePainter(_points)),
        ),
        new MyFadeTest(),
        new MyFadeTest(),
        new MyFadeTest(),
        new MyFadeTest(),
        new MyFadeTest(),
        new MyFadeTest(),
        new MyFadeTest(),

        /*new Opacity(
          opacity: _visible ? 1.0 : 0.0,
          child: const Text('Now you see me, now you don\'t!'),
        ),
        new Container(
          child: new Transform(
            alignment: Alignment.center,
            transform: new Matrix4.skewX(44.0)..rotateZ(90.0),
            //transform: new Matrix4.skewY(0.3)..rotateZ(-155.0),
            child: SizedBox(
              width: 10.0,
              height: 50.0,
              child: new Container(
                width: 10.0,
                height: 30.0,
                padding: const EdgeInsets.all(1.0),
                color: const Color(0xFFE8581C),
                child: Image.asset('images/haha.png',fit: BoxFit.cover,),
              ),
            ),
          ),
          width: 600.0,
          height: 100.0,
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/haha.png'), fit: BoxFit.fill)),
        ),
        new Container(
          color: Colors.redAccent,
          width: 44.0,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return new RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            child: Center(
                child: Text(
              '哈哈',
              style: TextStyle(
                  color: Colors.lightBlue, fontWeight: FontWeight.bold),
            )),
          ),
        ),
        new Placeholder(
          fallbackHeight: 10.0,
          fallbackWidth: 100.0,
          strokeWidth: 10.0,
          color: Colors.yellow,
        ),
        new Opacity(
          opacity: _visible ? 1.0 : 0.0,
          child: const Text('Now you see me, now you don\'t!'),
        )*/
        // new Text(namess == null ? "没有储存成功" : namess),
      ],
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Signature extends StatefulWidget {
  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
              referenceBox.globalToLocal(details.globalPosition);
          _points = new List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: new CustomPaint(painter: new SignaturePainter(_points)),
    );
  }
}

class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) => new Scaffold(body: new Signature());
}
