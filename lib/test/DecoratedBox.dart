import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'app',
      theme: new ThemeData(primaryColor: Colors.blueGrey),
      home: new MyHomePager(),
    ),
  );
}

class MyHomePager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

class Pontt {
  double a, b;

  Pontt(this.a, this.b);
}

class _MyHomePageState extends State<MyHomePager>
    with SingleTickerProviderStateMixin {
  RefreshIndicator refreshIndicator;
  TabController controller;
  List<Pontt> mlist;

  @override
  void initState() {
    super.initState();
    mlist = [Pontt(0.9, 1.0), Pontt(0.1, 1.0), Pontt(0.5, 0.8)];
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    //页面失去焦点时候
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
      children: <Widget>[
        new Material(
          color: Colors.teal[900],
          child: new Center(
            child: new Ink(
              color: Colors.yellow,
              width: 200.0,
              height: 100.0,
              child: new InkWell(
                  onTap: () {
                    /* ... */
                  },
                  child: new Center(
                    child: new Image.asset(
                      'images/haha.png',
                      fit: BoxFit.fitWidth,
                    ),
                  )),
            ),
          ),
        ),
        new Material(
          color: Colors.grey[800],
          child: new Center(
            child: new Ink.image(
              image: new AssetImage('images/haha.png'),
              fit: BoxFit.cover,
              width: 900.0,
              height: 200.0,
              child: new InkWell(
                  onTap: () {
                    /* ... */
                  },
                  child: new Align(
                    alignment: Alignment.topLeft,
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Text('KITTEN',
                          style: new TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white)),
                    ),
                  )),
            ),
          ),
        ),
        new Text('haha'),
        new DecoratedBox(
          child: new Container(
            width: 330.0,
            height: 100.0,
          ),
          decoration: new BoxDecoration(
            gradient: new RadialGradient(
              center: const Alignment(-0.5, -0.6),
              radius: 0.15,
              colors: <Color>[
                const Color(0xFFEEEEEE),
                const Color(0xFF546E7A),
              ],
              stops: <double>[mlist[0].a, mlist[0].b],
            ),
          ),
        ),
        new CustomPaint(
          painter: new Sky(),
          child: new Center(
            child: new Text(
              'Once upon a time...',
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var rect1=Rect.fromLTRB(10.0, 100.0, 110.0, 120.0);
    var rectbase=Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    var paint=new Paint();
    paint.color=Colors.orange;
    paint.strokeWidth=111.0;
    var gradient = new RadialGradient(
      center: const Alignment(0.7, -0.6),
      radius: 0.2,
      colors: [const Color(0xFFFFFF00), const Color(0xFF0099FF)],
      stops: [0.4, 1.0],
    );
   /* canvas.drawRect(
      rect1,
      paint,
    );*/

    canvas.drawCircle(Offset(100.0, 100.0), 11.0, paint);
    canvas.translate(0.0,size.height);
    canvas.drawOval(rect1, paint);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) {
      // Annotate a rectangle containing the picture of the sun
      // with the label "Sun". When text to speech feature is enabled on the
      // device, a user will be able to locate the sun on this picture by
      // touch.
      var rect = Offset.zero & size;
      var width = size.shortestSide * 0.4;
      rect = const Alignment(0.8, -0.9).inscribe(new Size(width, width), rect);
      return [
        new CustomPainterSemantics(
          rect: rect,
          properties: new SemanticsProperties(
            label: 'Sun',
            textDirection: TextDirection.ltr,
          ),
        ),
      ];
    };
  }

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}