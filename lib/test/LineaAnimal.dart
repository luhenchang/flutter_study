import 'package:flutter/material.dart';

class SignaturePainter extends CustomPainter {
  SignaturePainter(this._animation);

  final AnimationController _animation;
  List<Offset> pointss;

  void paint(Canvas canvas, Size size) {
    Path path1 = new Path();
    //y=从200变为150减少了50这里动画，将50看做一个百分百。
    print(_animation.value);
    path1.moveTo(44.0, 200.0 - _animation.value);
    path1.lineTo(44.0, 200.0 - _animation.value);
    var firstControlPoint = Offset(size.width / 4, 200.0);
    var firstPoint = Offset(size.width / 2, 200.0);
    path1.quadraticBezierTo(firstControlPoint.dx-20.0, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    path1.lineTo(size.width - 100, 200.0);
    Paint paint = new Paint();
    paint.color =_animation.isCompleted?Colors.blue:Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3.0;
    canvas.drawPath(path1, paint);
  }

  bool shouldRepaint(SignaturePainter other) => other._animation != _animation;
}

class Signature extends StatefulWidget {
  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> with TickerProviderStateMixin {
  AnimationController _animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation = new AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        lowerBound: 0.0,
        upperBound: 50.0);
  }

  void _startAnimation() {
    _animation.forward(from: 0.0);
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Padding(
          padding:new EdgeInsets.only(top: 50.0),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startAnimation();
            },
          ),
        ),
        new SizedBox(
          height: 200.0,
          child: CustomPaint(
              painter: new SignaturePainter(_animation), size: Size.infinite),
        )
      ],
    );
  }
}

class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) => new Scaffold(body: new Signature());
}

void main() => runApp(new MaterialApp(home: new DemoApp()));
