import 'package:flutter/material.dart';
import 'package:flutter_app/test/video_demo.dart';

class DouyinPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DouyinPagerStatu();
  }
}

class DouyinPagerStatu extends State<DouyinPager> {
  ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        /*
      * body: CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            actions: <Widget>[
              new Container(child: new Icon(Icons.add,color: Colors.white,),)
              //只能用金泰的？
            ],
            leading: Icon(Icons.add),
           // title:Text('Demo'),
            centerTitle: true,
            pinned: true,//是否固定。
            backgroundColor: Colors.redAccent,
            expandedHeight: 120.0,
            flexibleSpace: new FlexibleSpaceBar(
              background:Image.asset('images/haha.png',fit: BoxFit.fill,),
              centerTitle: false,
              title: const Text('Demo'),
            ),
          ),
          new SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              },
            ),
          ),

        ],
      ),*/
        body: new ListView(
      children: <Widget>[
        new Container(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: new EdgeInsets.only(top: 110.0),
              padding: new EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.all(const Radius.circular(158.0))),
              child: ClipOval(
                child:
                    Image.asset('images/haha.png', height: 50.0, width: 50.0),
              ),
            ),
            Text(
              '路很长~',
              style: TextStyle(fontSize: 12.0),
            ),
            Text(
              '抖音号:192544567',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        )),
        GridView.builder(
          physics: PageScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio:1/6),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context,int index){
            return VideoDemo();
          },
          itemCount:1,
        ),
      ],
    ) /*new CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          new SliverAppBar(
            // title:Text('Demo'),
            centerTitle: true,
            pinned: false,
            //是否固定。
            backgroundColor: Colors.black,
            expandedHeight: 230.0,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: false,
              title: new Container(

                child:new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(top: 110.0),
                      padding: new EdgeInsets.all(1.5),
                      decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius:
                          BorderRadius.all(const Radius.circular(158.0))),
                      child: ClipOval(
                        child: Image.asset('images/haha.png',
                            height: 50.0, width: 50.0),
                      ),
                    ),
                    Text('路很长~',style: TextStyle(fontSize: 12.0),),
                    Text('抖音号:192544567',style: TextStyle(fontSize: 12.0),),
                  ],
                )
              ),
            ),
          ),
          new SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600.0, childAspectRatio: 0.38),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  child: VideoDemo(),
                );
              },
              childCount: 1,
            ),
          ),
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              },
            ),
          ),
        ],
      ),*/
        );
  }
}
