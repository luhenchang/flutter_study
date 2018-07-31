import 'package:flutter/material.dart';

class MyContainImageUtils extends StatelessWidget {
  MyContainImageUtils(this.imageUrl);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final height_screen = MediaQuery.of(context).size.height;
    final width_srcreen = MediaQuery.of(context).size.width;
    return Stack(
      alignment:Alignment.bottomCenter,
      children: <Widget>[
        ClipPath(
          clipper: ArcClipper(),
          child: Container(
            width: screenWidth,
            height:height_screen*4/7,
            decoration: new BoxDecoration(
              color: Colors.blue,
              gradient: new LinearGradient(
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.5, 1.0),
                colors: <Color>[Color(0xFF00838F), Color(0xFF4DD0E1)],
              ),
            ),
          ),
        ),
        SizedBox(
          height:height_screen*4.1/7,
          child: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(
                    child: Center(
                  child: Stack(
                    alignment: Alignment(0.9, -1.0),
                    children: <Widget>[
                      Container(
                        padding: new EdgeInsets.all(3.0),
                        child: ClipOval(
                          child: Image.asset(
                            'images/haha.png',
                            width: 35.0,
                            height: 35.0,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(158.0))),
                      ),
                      ClipOval(
                        child: new Container(
                          color: Colors.redAccent,
                          width: 12.0,
                          height: 12.0,
                        ),
                      ),
                    ],
                  ),
                )),
                new Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 5.0),
                  child: Text(
                    '路很长0O0',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0.0, 80.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    /*var firstcirclrpint=(new Offset(size.width,0.0));
   // path.moveTo(size.width/4, 0.0);
    //path.addArc(Rect.fromCircle(center: firstcirclrpint,radius:size.width/4), 180.0, -90.0);
    path.addOval(new Rect.fromCircle(center:firstcirclrpint,radius:250.0));
    path.lineTo(size.width,size.width/4);*/
    path.close();

    /*path.lineTo(0.0, size.height - 40);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);
    path.lineTo(size.width, 0.0);*/
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
