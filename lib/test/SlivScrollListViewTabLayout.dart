import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:flutter_app/test/TitleBar.dart';
import 'package:shimmer/shimmer.dart';

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  new Entry(
    '在线播放【推荐】',
    <Entry>[
      new Entry('HD1280高清汉语中文版'),
    ],
  ),
  new Entry(
    '外部播放【推荐】',
    <Entry>[
      new Entry('HD1280高清汉语中文版'),
    ],
  ),
  new Entry(
    '在线【推荐】',
    <Entry>[
      new Entry('高清汉语中文字幕'),
    ],
  ),
];

class MyAppsss extends StatefulWidget {
  var imagePath;
  var Tag;

  MyAppsss(this.imagePath, this.Tag);

  @override
  State<StatefulWidget> createState() {
    return new MyAppState(this.imagePath, this.Tag);
  }
}

class MyAppState extends State<MyAppsss> with TickerProviderStateMixin {
  final List<ListItem> listData = [];
  var imagePath;
  var Tag;

  MyAppState(this.imagePath, this.Tag);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listData
        .add(new ListItem("在线播放[推荐]", Icons.important_devices, Colors.teal));
    listData.add(new ListItem("外部播放[推荐]", Icons.computer, Colors.redAccent));
    listData.add(new ListItem("在线播放[推荐]", Icons.save, Color(0xFFAB47BC)));

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.chevron_left,
                    size: 29.0,
                    color: Colors.white,
                  )),
              expandedHeight: 300.0,
              actions: <Widget>[
                Padding(
                    padding: new EdgeInsets.only(right: 30.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border,
                          size: 25.0,
                          color: Colors.white,
                        ),
                        Padding(
                          child: Icon(
                            Icons.refresh,
                            size: 25.0,
                            color: Colors.white,
                          ),
                          padding: new EdgeInsets.only(left: 20.0),
                        ),
                      ],
                    )),
              ],
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: new Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  period: new Duration(milliseconds:3000),
                  baseColor: Colors.white,
                  highlightColor: Colors.grey,
                  child: Text(
                    "王者:冰与火之歌",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                background: Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(imagePath),
                  )),
                  child: Container(
                    child: new BackdropFilter(
                      filter:
                          new ui.ImageFilter.blur(sigmaX: 13.0, sigmaY: 13.0),
                      child: new Container(
                        color: Colors.blue.withOpacity(0.06),
                        padding: const EdgeInsets.only(top: 30.0, left: 17.0),
                        width: 90.0,
                        height: 90.0,
                        child: new Container(
                          margin: EdgeInsets.only(top: 40.0),
                          alignment: Alignment.topLeft,
                          child: Hero(
                              tag: Tag,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Image.network(
                                    imagePath,
                                    height: 190.0,
                                    width: 140.0,
                                    fit: BoxFit.cover,
                                  ),
                                  new Padding(
                                    padding: new EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              new EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            '美国/权利游戏',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                letterSpacing: 1.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              new EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            '2018/119分钟',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              new EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'BD1280高清中文字幕',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              new EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            '4次浏览',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: new TabController(length: 2, vsync: this),
                  labelColor: Colors.teal,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.teal,
                  labelStyle: TextStyle(fontWeight: FontWeight.w100),
                  tabs: [
                    Tab(text: "播放列表"),
                    Tab(text: "视频介绍"),
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          color: Colors.white,
          child: Container(
            child: new ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  new EntryItem(data[index], listData[index]),
              itemCount: data.length,
            ),
          ),
        ),
      ),
    );
  }
}

class EntryItem extends StatefulWidget {
  const EntryItem(this.entry, this.listItem);

  final ListItem listItem;
  final Entry entry;

  @override
  State<StatefulWidget> createState() {
    return EntryItemState(this.listItem, this.entry);
  }
}

class EntryItemState extends State<EntryItem> {
  var demonPlugin = new MethodChannel('demo.plugin');
  ListItem listItem;
  Entry entry;
  var colortitle = false;

  EntryItemState(this.listItem, this.entry);

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return new ListTile(
        leading: InkWell(
          onTap: () {
            demonPlugin.invokeMethod(
                'http://jzvd.nathen.cn/d525f756aabf4b0588c2152fb94e07f5/d9f59bef829a472a9ca066620d9b871a-5287d2089db37e62345123a1be272f8b.mp4');
          },
          child: Padding(
            padding: new EdgeInsets.only(left: 20.0),
            child: new Icon(
              Icons.play_circle_outline,
              color: Colors.black,
              size: 23.0,
            ),
          ),
        ),
        title: new Text(
          root.title,
          style: TextStyle(fontSize: 15.0),
        ),
      );
    return new ExpansionTile(
      onExpansionChanged: (exple) {
        colortitle = exple;
        setState(() {
          print(exple);
        });
      },
      key: new PageStorageKey<Entry>(root),
      leading: new Icon(
        listItem.iconData,
        color: listItem.colors,
        size: 30.0,
      ),
      title: new Text(
        root.title,
        style: TextStyle(color: colortitle ? Colors.blue : Colors.black),
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class ListItem {
  final String title;
  final IconData iconData;
  final Color colors;

  ListItem(this.title, this.iconData, this.colors);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new ListTile(
        leading: new Icon(
          listItem.iconData,
          color: listItem.colors,
        ),
        title: new Text(listItem.title),
      ),
      onTap: () {},
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
