// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:device_info/device_info.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'app',
      theme: new ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.purple,
        accentColor: Colors.orangeAccent[400],
      ),
      home: new VideoDemo(),
    ),
  );
}

// TODO(sigurdm): This should not be stored here.
const String beeUri =
    'http://jzvd.nathen.cn/c6e3dc12a1154626b3476d9bf3bd7266/6b56c5f0dc31428083757a45764763b0-5287d2089db37e62345123a1be272f8b.mp4';

class VideoCard extends StatelessWidget {
  final VideoPlayerController controller;
  final String title;
  final String subtitle;

  const VideoCard({Key key, this.controller, this.title, this.subtitle})
      : super(key: key);

  Widget _buildInlineVideo() {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 1.0),
      child: new Stack(
        alignment: Alignment(1.0, 1.0),
        children: <Widget>[
          new AspectRatio(
            aspectRatio: 0.69,
            child: new Hero(
              tag: controller,
              child: new VideoPlayerLoading(controller),
            ),
          ),
          new Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Text(
                    '235.8w',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //TODO 满屏
  Widget _buildFullScreenVideo(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('观看美好视频'),
      ),
      body: new Container(
        height:MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: new AspectRatio(
          aspectRatio:MediaQuery.of(context).size.width/MediaQuery.of(context).size.height,
          child: new Hero(
            tag: controller,
            child: new VideoPlayPause(controller),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget fullScreenRoutePageBuilder(BuildContext context,
        Animation<double> animation, Animation<double> secondaryAnimation) {
      return _buildFullScreenVideo(context);
    }

    void pushFullScreenWidget() {
      final TransitionRoute<void> route = new PageRouteBuilder<void>(
        settings: new RouteSettings(name: title, isInitialRoute: false),
        pageBuilder: fullScreenRoutePageBuilder,
      );

      route.completed.then((void result) {
        controller.setVolume(0.0);
      });

      controller.setVolume(1.0);
      Navigator.of(context).push(route);
    }

    //TODO ITEM TODO TODO
    return new SafeArea(
      top: false,
      bottom: false,
      child: new GestureDetector(
        onTap: pushFullScreenWidget,
        child: _buildInlineVideo(),
      ),
    );
  }
}

class VideoPlayerLoading extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoPlayerLoading(this.controller);

  @override
  _VideoPlayerLoadingState createState() => new _VideoPlayerLoadingState();
}

class _VideoPlayerLoadingState extends State<VideoPlayerLoading> {
  bool _initialized;

  @override
  void initState() {
    super.initState();
    _initialized = widget.controller.value.initialized;
    widget.controller.addListener(() {
      if (!mounted) {
        return;
      }
      final bool controllerInitialized = widget.controller.value.initialized;
      if (_initialized != controllerInitialized) {
        setState(() {
          _initialized = controllerInitialized;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_initialized) {
      return new VideoPlayer(widget.controller);
    }
    return new Stack(
      children: <Widget>[
        new VideoPlayer(widget.controller),
        const Center(
            child: const CircularProgressIndicator(
          backgroundColor: Colors.lightBlueAccent,
        )),
      ],
      fit: StackFit.expand,
    );
  }
}

class VideoPlayPause extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoPlayPause(this.controller);

  @override
  State createState() => new _VideoPlayPauseState();
}

class _VideoPlayPauseState extends State<VideoPlayPause> {
  FadeAnimation imageFadeAnimation;
  VoidCallback listener;

  _VideoPlayPauseState() {
    listener = () {
      if (mounted) setState(() {});
    };
  }

  VideoPlayerController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void deactivate() {
    controller.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.expand,
      children: <Widget>[
        new GestureDetector(
          child: new VideoPlayerLoading(controller),
          onTap: () {
            if (!controller.value.initialized) {
              return;
            }
            if (controller.value.isPlaying) {
              imageFadeAnimation = const FadeAnimation(
                child: const Icon(Icons.pause, size: 100.0),
              );
              controller.pause();
            } else {
              imageFadeAnimation = const FadeAnimation(
                child: const Icon(Icons.play_arrow, size: 100.0),
              );
              controller.play();
            }
          },
        ),
        new Center(child: imageFadeAnimation),
      ],
    );
  }
}

class FadeAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeAnimation({
    this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _FadeAnimationState createState() => new _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    animationController.forward(from: 0.0);
  }

  @override
  void deactivate() {
    animationController.stop();
    super.deactivate();
  }

  @override
  void didUpdateWidget(FadeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return animationController.isAnimating
        ? new Opacity(
            opacity: 1.0 - animationController.value,
            child: widget.child,
          )
        : new Container();
  }
}

//TODO 5.0
class ConnectivityOverlay extends StatefulWidget {
  final Widget child;
  final Completer<Null> connectedCompleter;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ConnectivityOverlay({
    this.child,
    this.connectedCompleter,
    this.scaffoldKey,
  });

  @override
  _ConnectivityOverlayState createState() => new _ConnectivityOverlayState();
}

class _ConnectivityOverlayState extends State<ConnectivityOverlay> {
  StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool connected = true;

  static const Widget errorSnackBar = const SnackBar(
    backgroundColor: Colors.red,
    content: const ListTile(
      title: const Text('No network'),
      subtitle: const Text(
        'To load the videos you must have an active network connection',
      ),
    ),
  );

  Stream<ConnectivityResult> connectivityStream() async* {
    final Connectivity connectivity = new Connectivity();
    ConnectivityResult previousResult = await connectivity.checkConnectivity();
    yield previousResult;
    await for (ConnectivityResult result
        in connectivity.onConnectivityChanged) {
      if (result != previousResult) {
        yield result;
        previousResult = result;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    connectivitySubscription = connectivityStream().listen(
      (ConnectivityResult connectivityResult) {
        if (!mounted) {
          return;
        }
        if (connectivityResult == ConnectivityResult.none) {
          widget.scaffoldKey.currentState.showSnackBar(errorSnackBar);
        } else {
          if (!widget.connectedCompleter.isCompleted) {
            widget.connectedCompleter.complete(null);
          }
        }
      },
    );
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

//TODO 1.0 开始
class VideoDemo extends StatefulWidget {
  const VideoDemo({Key key}) : super(key: key);

  static const String routeName = '/video';

  @override
  _VideoDemoState createState() => new _VideoDemoState();
}

final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

Future<bool> isIOSSimulator() async {
  return Platform.isIOS && !(await deviceInfoPlugin.iosInfo).isPhysicalDevice;
}

//TODO 2.0 开始
class _VideoDemoState extends State<VideoDemo>
    with SingleTickerProviderStateMixin {
  /* final VideoPlayerController butterflyController =
      new VideoPlayerController.asset(
    'videos/butterfly.mp4',
    package: 'flutter_gallery_assets',
  );*/

  List<VideoPlayerController> mdata = new List();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final Completer<Null> connectedCompleter = new Completer<Null>();
  bool isSupported = true;

  @override
  void initState() {
    super.initState();
    Future<Null> initController(VideoPlayerController controller) async {
      controller.setLooping(true);
      controller.setVolume(0.0);
      controller.play();
      await connectedCompleter.future;
      await controller.initialize();
      if (mounted) setState(() {});
    }

    initData().then((List<VideoPlayerController> data) {
      if (data != null) {
        setState(() {
          mdata = data;
          for (int i = 0; i < data.length; i++) {
            initController(data[i]);
          }
        });
      }
    });

    isIOSSimulator().then((bool result) {
      isSupported = !result;
    });
  }

  @override
  void dispose() {
    // butterflyController.dispose();

    if (mdata != null) {
      for (int i; i < mdata.length; i++) {
        mdata[i].dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      body: isSupported
          ? new ConnectivityOverlay(
              child: new ListView(
                children: <Widget>[
                  new Container(
                      height: 190.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      padding: new EdgeInsets.only(
                          top: 20.0, left: 10.0, bottom: 10.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: new EdgeInsets.only(
                                    top: 20.0, left: 10.0, bottom: 1.0),
                                padding: new EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(158.0),
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset('images/haha.png',
                                      height: 60.0, width: 60.0),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 25.0,
                                    margin: new EdgeInsets.only(right: 5.0),
                                    padding: new EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF757575),
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(1.0),
                                      ),
                                    ),
                                    child: Text(
                                      '分享主页',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                  ),
                                  Container(
                                    height: 25.0,
                                    margin: new EdgeInsets.only(right: 5.0),
                                    padding: new EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF757575),
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(1.0),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white70,
                                      size: 16.0,
                                    ),
                                  ),
                                  Container(
                                    height: 25.0,
                                    margin: new EdgeInsets.only(right: 10.0),
                                    padding: new EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF757575),
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(1.0),
                                      ),
                                    ),
                                    child: Text(
                                      '...',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                          Container(
                            margin: new EdgeInsets.only(
                                top: 10.0, left: 10.0, bottom: 5.0),
                            child: Text(
                              '路很长~',
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                          ),
                          Container(
                              margin: new EdgeInsets.only(
                                  top: 1.0, left: 10.0, bottom: 1.0),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '抖音号:192544567',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.white),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.memory,
                                        color: Color(0xFFFF9E80),
                                        size: 17.0,
                                      ),
                                      Text(
                                        '今日头条',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      )),
                  new Container(
                    color: Colors.black,
                    height: 0.6,
                    child: Container(
                      height: 0.5,
                      margin: new EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      color: Color(0xFF757575),
                    ),
                  ),
                  new Container(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: new EdgeInsets.only(
                              top: 10.0, left: 10.0, bottom: 5.0),
                          alignment: Alignment.topLeft,
                          child: new Text(
                            '愿天下善良的护士小姑凉梦平平安安',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF757575),
                            ),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 20.0,
                                margin:
                                    new EdgeInsets.only(right: 5.0, left: 11.0),
                                padding: new EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF757575),
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(111.0),
                                  ),
                                ),
                                child: Icon(Icons.settings,
                                    size: 13.0, color: Colors.white),
                              ),
                              Container(
                                height: 20.0,
                                margin: new EdgeInsets.only(right: 7.0),
                                padding: new EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF757575),
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(111.0),
                                  ),
                                ),
                                child: Text(
                                  '24岁',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                              ),
                              Container(
                                height: 20.0,
                                margin: new EdgeInsets.only(right: 7.0),
                                padding: new EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF757575),
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(111.0),
                                  ),
                                ),
                                child: Text(
                                  '白羊座',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                              ),
                              Container(
                                height: 20.0,
                                margin: new EdgeInsets.only(right: 7.0),
                                padding: new EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF757575),
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(111.0),
                                  ),
                                ),
                                child: Text(
                                  '天津',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    color: Colors.black,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: new EdgeInsets.only(left:10.0,top: 11.0,bottom:20.0),
                          child: Text(
                            '111获赞',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.only(left:10.0,top: 11.0,bottom:20.0),

                          child: Text(
                            '52关注',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.only(left:10.0,top: 11.0,bottom:20.0),
                          child: Text(
                            '7粉丝',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    color: Colors.black,
                    height: 1000.0,
                    width: 600.0,
                    child: new GridView.builder(
                      physics: PageScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, int index) {
                        return VideoCard(
                          title: 'Bee',
                          subtitle: '… gently buzzing',
                          controller: mdata[index],
                        );
                      },
                      itemCount: mdata.length,
                    ),
                  ),
                ],
              ),
              /* child: new ListView(
                children: <Widget>[
                 */ /*  new VideoCard(
                    title: 'Butterfly',
                    subtitle: '… flutters by',
                    controller: butterflyController,
                  ), */ /*
                  new VideoCard(
                    title: 'Bee',
                    subtitle: '… gently buzzing',
                    controller: mdata[0],
                  ),
                  new VideoCard(
                    title: 'Bee',
                    subtitle: '… gently buzzing',
                    controller: mdata[1],
                  ),
                  new VideoCard(
                    title: 'Bee',
                    subtitle: '… gently buzzing',
                    controller: mdata[2],
                  ),
                  new VideoCard(
                    title: 'Bee',
                    subtitle: '… gently buzzing',
                    controller: mdata[3],
                  ),
                  new VideoCard(
                    title: 'Bee',
                    subtitle: '… gently buzzing',
                    controller: mdata[4],
                  ),
                ],
              ),*/
              connectedCompleter: connectedCompleter,
              scaffoldKey: scaffoldKey,
            )
          : const Center(
              child: const Text(
                'Video playback not supported on the iOS Simulator.',
              ),
            ),
    );
  }

  Future<List<VideoPlayerController>> initData() async {
    final VideoPlayerController beeController =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/d525f756aabf4b0588c2152fb94e07f5/d9f59bef829a472a9ca066620d9b871a-5287d2089db37e62345123a1be272f8b.mp4",
    );
    final VideoPlayerController beeController1 =
        new VideoPlayerController.network(
      'http://jzvd.nathen.cn/8abcdf98ec6a418b945a70fe9dd6fc7f/5cb36416a23a4da8b15d3eaa5e19a1e6-5287d2089db37e62345123a1be272f8b.mp4',
    );
    final VideoPlayerController beeController2 =
        new VideoPlayerController.network(
      'http://jzvd.nathen.cn/6e2fdec45dfa44a6802e95f8e4bc3280/a6a5273ac4244333923991be0583ffc7-5287d2089db37e62345123a1be272f8b.mp4',
    );
    final VideoPlayerController beeController3 =
        new VideoPlayerController.network(
      'http://jzvd.nathen.cn/f07fa9fddd1e45a6ae1570c7fe7967c1/c6db82685b894e25b523b1cb28d79f2e-5287d2089db37e62345123a1be272f8b.mp4',
    );
    final VideoPlayerController beeController4 =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/1b61da23555d4ce28c805ea303711aa5/7a33ac2af276441bb4b9838f32d8d710-5287d2089db37e62345123a1be272f8b.mp4",
    );
    final VideoPlayerController beeController5 =
        new VideoPlayerController.network(
      'http://jzvd.nathen.cn/8abcdf98ec6a418b945a70fe9dd6fc7f/5cb36416a23a4da8b15d3eaa5e19a1e6-5287d2089db37e62345123a1be272f8b.mp4',
    );
    final VideoPlayerController beeController6 =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/b8a589e5f12c45fdad96674d08affd31/f1d7229f553f414283033af3e292c6c9-5287d2089db37e62345123a1be272f8b.mp4",
    );
    final VideoPlayerController beeController7 =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/d8c137ceba9849f8b2f454a55a96266f/910c8381ff894905b5bc272f8194382a-5287d2089db37e62345123a1be272f8b.mp4",
    );
    final VideoPlayerController beeController8 =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/623f75c3beea4b1781ea37940e70bbe4/b9cee3fd1a09487ca99ef789cdc41312-5287d2089db37e62345123a1be272f8b.mp4",
    );
    final VideoPlayerController beeController9 =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/4f965ad507ef4194a60a943a34cfe147/32af151ea132471f92c9ced2cff785ea-5287d2089db37e62345123a1be272f8b.mp4",
    );
    final VideoPlayerController beeController10 =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/d2e969f2ec734520b46ab0965d2b68bd/f124edfef6c24be8b1a7b7f996ccc5e0-5287d2089db37e62345123a1be272f8b.mp4",
    );
    final VideoPlayerController beeController11 =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/f07fa9fddd1e45a6ae1570c7fe7967c1/c6db82685b894e25b523b1cb28d79f2e-5287d2089db37e62345123a1be272f8b.mp4",
    );
    final VideoPlayerController beeController12 =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/384d341e000145fb82295bdc54ecef88/103eab5afca34baebc970378dd484942-5287d2089db37e62345123a1be272f8b.mp4",
    );
    final VideoPlayerController beeController13 =
        new VideoPlayerController.network(
      "http://jzvd.nathen.cn/35b3dc97fbc240219961bd1fccc6400b/8d9b76ab5a584bce84a8afce012b72d3-5287d2089db37e62345123a1be272f8b.mp4",
    );
    mdata.add(beeController);
    mdata.add(beeController1);
    mdata.add(beeController2);
    mdata.add(beeController3);
    mdata.add(beeController4);
    mdata.add(beeController5);
    mdata.add(beeController6);
    mdata.add(beeController7);
    mdata.add(beeController8);
    mdata.add(beeController9);
    mdata.add(beeController10);
    mdata.add(beeController11);
    mdata.add(beeController12);
    mdata.add(beeController13);
    return mdata;
  }
}
