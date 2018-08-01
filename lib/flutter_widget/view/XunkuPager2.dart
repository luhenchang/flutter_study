import 'package:flutter/material.dart';

class XuankuPage2 extends StatefulWidget {
  final AnimationController controller;

  XuankuPage2({this.controller});

  @override
  State<StatefulWidget> createState() {
    return new _XuankuPageState2();
  }
}

class _XuankuPageState2 extends State<XuankuPage2>
    with SingleTickerProviderStateMixin {
  static const header_height = 32.0;

  Animation<RelativeRect> getPaneLanimation(BoxConstraints constai) {
    final height = constai.biggest.height;
    final backPaneHeight = height - header_height;
    final fromPanelHeight = -header_height;

    return new RelativeRectTween(
      begin:
          new RelativeRect.fromLTRB(0.0, backPaneHeight, 0.0, fromPanelHeight),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(
      new CurvedAnimation(parent: widget.controller, curve: Curves.linear),
    );
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            color: theme.primaryColor,
            child: new Center(
              child: Container(
                alignment:Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    begin:Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[
                      Color(0xFFFFCDD2),
                      Color(0xFF00838F)
                    ],
                  ),
                ),
                child: new Text(
                  '炫酷Flutter',
                  style: new TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
            ),
          ),
          new PositionedTransition(
            rect: getPaneLanimation(constraints),
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Material(
                elevation: 12.0,
                borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(36.0),
                  bottomLeft: new Radius.circular(36.0),
                  topRight: new Radius.circular(36.0),
                  bottomRight: new Radius.circular(36.0),
                ),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      height: header_height,
                      child: new Center(
                        child: new Text(
                          'my picture',
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                    new Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            begin: const FractionalOffset(0.5, 0.0),
                            end: const FractionalOffset(0.5, 1.0),
                            colors: <Color>[
                              Color(0xFFFFCDD2),
                              Color(0xFF4DD0E1)
                            ],
                          ),
                        ),
                        child: Center(
                          child: ClipOval(
                            child: Image.asset(
                              'images/haha.png',
                              height: 150.0,
                              width: 150.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }
}
