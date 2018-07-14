import 'package:flutter/material.dart';
class OnePagerListItemActivity extends StatefulWidget{
  final int index1;
  OnePagerListItemActivity({Key key,this.index1}):super();
  @override
  State<StatefulWidget> createState() {
    return OnePagerListItemActivityState();
  }

}
class OnePagerListItemActivityState extends State<OnePagerListItemActivity>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            actions: <Widget>[
              new Container(
                child: new Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
              //只能用金泰的？
            ],
            leading: Icon(Icons.add),
            // title:Text('Demo'),
            centerTitle: true,
            pinned: true,
            //是否固定。
            backgroundColor: Colors.white,
            expandedHeight: 150.0,
            flexibleSpace: new FlexibleSpaceBar(
              background: Image.asset(
                'images/lonvn9.jpg',
                fit: BoxFit.cover,
              ),
              centerTitle: false,
              title: const Text('图表学习'),
            ),
          ),
          new SliverFixedExtentList(
            itemExtent:150.0,
            delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                //return widgetList[index];
              },
             // childCount: widgetList.length,
            ),
          ),
        ],
      ),
    );
  }
}