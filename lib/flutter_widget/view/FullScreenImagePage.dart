import 'package:flutter/material.dart';

class FullScreenImagePager extends StatelessWidget {
  String imgPath;

  FullScreenImagePager(this.imgPath);

  final LinearGradient backgoundGradient = new LinearGradient(
    colors: [new Color(0x10000000), new Color(0x30000000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        // decoration: new BoxDecoration(gradient:backgoundGradient),
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            new Align(
              alignment: Alignment.center,
              child: new Hero(tag: imgPath, child: new Image.network(imgPath,fit:BoxFit.cover,width:MediaQuery.of(context).size.width,)),
            ),
            new Align(
              alignment: Alignment.topCenter,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new AppBar(
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    leading: new IconButton(
                      icon: new Icon(Icons.close,color:Colors.lightBlue,),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
