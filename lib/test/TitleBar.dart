import 'package:flutter/material.dart';

class CustomTitleBar extends StatefulWidget {
  final Key key;
  final double height;
  final CustomTitleBarController controller;
  final GestureTapCallback onMenuTap;
  final GestureTapCallback onMessageTap;

  CustomTitleBar({
    this.onMenuTap,
    this.onMessageTap,
    this.controller,
    this.height: 80.0,
    this.key
  }) :super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CustomTitleBarState();
  }
}

class CustomTitleBarState extends State<CustomTitleBar> {
  TextEditingController _textController = new TextEditingController();
  CustomTitleBarController _controller;

  Widget _buildSearch() {
    Widget titleItem = null;
    titleItem = new Container(
      height: 80.0,
      alignment: Alignment.center,
      child: new Padding(
        padding: new EdgeInsets.only(top: 0.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(padding: new EdgeInsets.only(left: 1.0)),
            new Container(
              height: 35.0,
              width: 200.0,
              child: new Material(
                  color: Colors.white70,
                  borderRadius: new BorderRadius.horizontal(
                      left: new Radius.circular(20.0),
                      right: new Radius.circular(20.0)),
                  child: new Padding(
                    padding: new EdgeInsets.only(right: 5.0),
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                            padding: new EdgeInsets.only(left: 5.0)),
                        new Icon(
                            Icons.search,
                            color: const Color(0xFF616161)),
                        new Padding(
                            padding: new EdgeInsets.only(left: 3.0)),
                        new Flexible(child: new TextField(
                          maxLines: 1,
                          controller: _textController,
                          onChanged: (v) {
//                            _handleOnSeachChange();
                          },
                          onSubmitted: (v) {
//                            _handleOnSeachChange();
                          },
                          style: new TextStyle(
                              color: const Color(0xFF616161),
                              fontSize: 14.0),
                          decoration: new InputDecoration.collapsed(
                              hintText: "请输入关键字"),
                        ),
                        ),
                      ],
                    ),)
              ),
            ),
            new Padding(padding: new EdgeInsets.only(left: 1.0)),
          ],
        ),),
    );
    return titleItem;
  }

  _buildTitle() {
    Widget mWidget = null;
    mWidget = new Container(
      height: widget.height,
      color: new Color.fromARGB(_controller.value.alpha, 25, 112, 183),
      child: new Padding(padding: new EdgeInsets.only(top: 25.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(padding: new EdgeInsets.only(right: 5.0)),

            new GestureDetector(
              onTap: widget.onMenuTap==null?(){}: widget.onMenuTap,
              child: new InkWell(
                child: new Icon(
                    Icons.format_list_bulleted, color: Colors.white),
              ),
            ),
            _buildSearch(),
            new GestureDetector(
              onTap: widget.onMessageTap==null?(){}: widget.onMessageTap,
              child: new InkWell(

                child: new Icon(Icons.message, color: Colors.white),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(right: 5.0)),
          ],
        ),),
    );
    return mWidget;
  }


  @override
  Widget build(BuildContext context) {
    if (widget.controller == null) {
      _controller = new CustomTitleBarController();
      _controller.value.alpha = 0;
    } else {
      _controller = widget.controller;
    }
    return _buildTitle();
  }
}


class CustomTitleBarController extends ValueNotifier<ContomTitleAlphaValue> {
  CustomTitleBarController() :super(new ContomTitleAlphaValue());
}

class ContomTitleAlphaValue {
  int alpha;
}