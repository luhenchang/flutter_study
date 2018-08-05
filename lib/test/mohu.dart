import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

/// 一个BackdropFilter模糊的例子，指出了BackdropFilter不能适配非矩形区域模糊效果的BUG
///
/// 此文件在本项目中未被使用
/// 保留此文件做学习用
///

/// 运行请取消此注释
 void main() {
   runApp(new MaterialApp(
     home: new AppH(),
   ));
 }

class AppH extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<AppH> {
  double _sigma = 3.0;
  double _opacity = 0.5;
  bool _showText = true;
  BoxShape _innerClip;
  BoxShape _outerClip;

  @override
  Widget build(BuildContext context) {
    Widget test = new BackdropFilter(
      filter: new ui.ImageFilter.blur(sigmaX: _sigma, sigmaY: _sigma),
      child: new Container(
        color: Colors.blue.withOpacity(_opacity),
        padding: const EdgeInsets.all(30.0),
        // decoration: BoxDecoration(
        //   color: Colors.blue.withOpacity(_opacity),
        //   shape: BoxShape.circle,
        // ),
        width: 90.0,
        height: 90.0,
        child: new Center(
          child: _showText ? new Text('Test') : null,
        ),
      ),
    );
    switch (_innerClip) {
      case BoxShape.circle:
        test = new ClipOval(
          child: test,
        );
        break;
      case BoxShape.rectangle:
        test = new ClipRRect(
          borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
          child: test,
        );
        break;
    }
    test = new Container(
      decoration: new BoxDecoration(
        color: Colors.grey.shade200.withOpacity(_opacity),
      ),
      padding: new EdgeInsets.all(30.0),
      child: test,
    );
    switch (_outerClip) {
      case BoxShape.circle:
        test = new ClipOval(child: test);
        break;
      case BoxShape.rectangle:
        test = new ClipRect(child: test);
        break;
    }
    test = new Container(
      height: 200.0,
      margin: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(
                'http://www.powerpointhintergrund.com/uploads/abstract-pattern-background-0.jpeg'),
          )),
      child: new Center(
        child: test,
      ),
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BackdropFilter Test'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          test,
          new Expanded(
            child: new ListView(
              children: <Widget>[
                new ListTile(
                  title: new Text('Sigma'),
                  subtitle: new Slider(
                    min: 0.0,
                    max: 50.0,
                    value: _sigma,
                    onChanged: (double value) {
                      setState(() {
                        _sigma = value;
                      });
                    },
                  ),
                ),
                new ListTile(
                  title: new Text('Opacity'),
                  subtitle: new Slider(
                    min: 0.0,
                    max: 1.0,
                    value: _opacity,
                    onChanged: (double value) {
                      setState(() {
                        _opacity = value;
                      });
                    },
                  ),
                ),
                new CheckboxListTile(
                  value: _showText,
                  onChanged: (bool value) {
                    setState(() {
                      _showText = value;
                    });
                  },
                  title: new Text('Show text'),
                ),
                new ListTile(
                  title: new Text('Inner clip'),
                  subtitle: new DropdownButton<BoxShape>(
                    onChanged: (BoxShape value) {
                      setState(() {
                        _innerClip = value;
                      });
                    },
                    value: _innerClip,
                    items: <DropdownMenuItem<BoxShape>>[
                      new DropdownMenuItem(
                        value: null,
                        child: new Text('None'),
                      ),
                      new DropdownMenuItem(
                        value: BoxShape.circle,
                        child: new Text('ClipOval'),
                      ),
                      new DropdownMenuItem(
                        value: BoxShape.rectangle,
                        child: new Text('ClipRect'),
                      ),
                    ],
                  ),
                ),
                new ListTile(
                  title: new Text('Outer clip'),
                  subtitle: new DropdownButton<BoxShape>(
                    onChanged: (BoxShape value) {
                      setState(() {
                        _outerClip = value;
                      });
                    },
                    value: _outerClip,
                    items: <DropdownMenuItem<BoxShape>>[
                      new DropdownMenuItem(
                        value: null,
                        child: new Text('None'),
                      ),
                      new DropdownMenuItem(
                        value: BoxShape.circle,
                        child: new Text('ClipOval'),
                      ),
                      new DropdownMenuItem(
                        value: BoxShape.rectangle,
                        child: new Text('ClipRect'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}