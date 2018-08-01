import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_widget/view/FullScreenImagePage.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyWell_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyWellScreenState();
  }
}

class _MyWellScreenState extends State<MyWell_Screen> {
  List<String> wallpapersList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wallpapersList = List();
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/4.png?raw=true");
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/pic1.jpg?raw=true");
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/pic10.jpg?raw=true");
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/pic11.jpg?raw=true");
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/pic12.jpg?raw=true");
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/pic13.jpg?raw=true");
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/pic14.jpg?raw=true");
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/pic15.jpg?raw=true");
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/pic16.jpg?raw=true");
    wallpapersList.add(
        "https://github.com/luhenchang/flutter_study/blob/master/images/pic17.jpg?raw=true");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('萌萌哒'),
      ),
      body: wallpapersList != null
          ? new StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(8.0),
              crossAxisCount: 4,
              itemCount: wallpapersList.length,
              itemBuilder: (context, i) {
                String pathimag = wallpapersList[i];
                return new Material(
                  elevation: 8.0,
                  borderRadius: new BorderRadius.all(new Radius.circular(11.0)),
                  child: new InkWell(
                    onTap:()=>Navigator.push(context,
                        new MaterialPageRoute(builder:(context)=>new FullScreenImagePager(pathimag))),
                    child: new Hero(
                      tag: pathimag,
                      child: new FadeInImage(
                        image: new NetworkImage(pathimag),
                        fit: BoxFit.cover,
                        placeholder: new AssetImage('images/wallfy.png'),
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (i) =>
                  new StaggeredTile.count(2, i.isEven ? 2 : 3),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            )
          : new Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
