import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/test/CountButtonView.dart';
import 'package:flutter_app/test/DishesList.dart';
import 'package:flutter_app/test/OrderPage.dart';
import 'dart:ui' as ui;

import 'package:flutter_app/test/TitleBar.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(new MaterialApp(
    title: '',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new MeiTuanShopping(),
  ));
}

//列表上面吸附APPBar切换
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

class MeiTuanShopping extends StatefulWidget {
  @override
  State createState() => new MeiTuanShopping_State();
}

class MeiTuanShopping_State extends State<MeiTuanShopping>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        //滑动的头部
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
              expandedHeight: 216.0,
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
                background: Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new AssetImage("images/haha.png"),
                  )),
                  child: Container(
                    child: new BackdropFilter(
                      filter:
                          new ui.ImageFilter.blur(sigmaX: 13.0, sigmaY: 13.0),
                      child: new Container(
                        color: Colors.redAccent.withOpacity(0.06),
                        padding: const EdgeInsets.only(top: 60.0),
                        width: 90.0,
                        height: 238.0,
                        child: Stack(
                          alignment: Alignment(-0.9, -0.7),
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(
                                top: 24.0,
                              ),
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 60.0),
                                            child: Text(
                                              "杨明宇黄焖鸡米饭(双林点)",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 10.0, top: 5.0),
                                            child: Text(
                                              "欢迎光临,很高兴为你服务",
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 111.0, top:6.0,bottom:6.0),
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: <Widget>[
                                                Text("分量足"),
                                                Text("饭好吃"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: new EdgeInsets.only(top:17.0),
                                      height:90.0,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.white,
                                      //TODO 这里是白色部分滑动头布局设置
                                      child:Row(
                                        children: <Widget>[
                                          Container(
                                            margin:new EdgeInsets.all(10.0),
                                            padding: new EdgeInsets.all(2.0),
                                            color:Colors.redAccent,
                                            child: Text("减",style: TextStyle(color: Colors.white),),
                                          ),
                                          Container(
                                            margin:new EdgeInsets.all(10.0),
                                            padding: new EdgeInsets.all(2.0),
                                            child: Text("满15减3；满30减5,；满50减7",style: TextStyle(color: Colors.blueGrey),),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Image.asset(
                              "images/haha.png",
                              width: 90.0,
                              height: 90.0,
                            ),
                          ],
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
        //滑动的商品部分
        body: BodySliver(),
      ),
    );
  }
}

//最下面商品滑动的一部分。
class BodySliver extends StatefulWidget {
  @override
  BodySliverState createState() => new BodySliverState();
}

class BodySliverState extends State<BodySliver> {
  //用来控制左边菜单分类滑动列表的。
  final LeftConstroller = ScrollController();

  //用来控制右边菜单滑动列表的。
  final RightConstroller = ScrollController();
  int selectedIndex;
  bool scrollingOrderList = false;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    //右边菜单列表监听
    RightConstroller.addListener(() {
      double offset = RightConstroller.offset;
      if (scrollingOrderList) {
        return;
      }
      if (selectedIndex > 0 && offset < 110.0 * 3) {
        //这里去更新菜单选择状态。
        setState(() {
          selectedIndex = 0;
        });
      } else if (selectedIndex == 0 && offset >= 110.0 * 3) {
        setState(() {
          selectedIndex = 1;
        });
      }
    });
  }

  @override
  void dispose() {
    LeftConstroller.dispose();
    RightConstroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 100.0,
          child: Container(
            color: Color(0xFFE0E0E0),
            child: TypeList(
              controller: LeftConstroller,
              selectedIndex: selectedIndex,
              indexSelected: (index) {
                scrollingOrderList = true;
                setState(() {
                  selectedIndex = index;
                  RightConstroller.animateTo(index * 110.0 * 3,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut)
                      .then((a) {
                    scrollingOrderList = false;
                  });
                });
              },
            ),
          ),
        ),
        Expanded(
            child: OrderList(
          controller: RightConstroller,
        )),
      ],
    );
  }
}

class TypeList extends StatefulWidget {
  TypeList({this.controller, this.indexSelected, this.selectedIndex = 0});

  final controller;
  final selectedIndex;
  final IndexSelectCallBack indexSelected;

  @override
  TypeListState createState() => new TypeListState();
}

class TypeListState extends State<TypeList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      String title = typeAtIndex(index);
      if (title == null) {
        return null;
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 60.0,
            color: index == widget.selectedIndex
                ? Colors.white
                : Color(0xFFE0E0E0),
            child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  widget.indexSelected(index);
                },
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    index == 0
                        ? Container(
                            padding: new EdgeInsets.only(right: 3.0),
                            child: Icon(
                              Icons.print,
                              color: Colors.lightBlueAccent,
                              size: 15.0,
                            ),
                          )
                        : Container(),
                    Text(title),
                  ],
                ))),
          ),
        ],
      );
    });
  }
}

class OrderList extends StatefulWidget {
  OrderList({this.controller});

  final controller;

  @override
  OrderListState createState() => new OrderListState();
}

class OrderListState extends State<OrderList> {
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

  void cellSelected(BuildContext context, Dish dish) {
    print('selected ${dish.name}');
    showDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: Theme.of(context),
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                  color: Colors.grey.shade100,
                  width: 300.0,
                  height: 350.0,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height:100.0,
                            child: _buildImage(dish),
                          ),
                          _buildPopupFooter(dish)
                        ]),
                  )),
            )),
          );
        });
  }

  Widget _buildPopupFooter(Dish dish) {
    return Container(
//      height: 120.0,
      padding: EdgeInsets.all(10.0),
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitleRow(dish),
          Container(
            color: Colors.transparent,
            height: 5.0,
          ),
          Text(
            dish.desc,
            softWrap: true,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(Dish dish) {
    return Stack(
      fit: StackFit.expand,
//      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          "images/haha.png",
          fit: BoxFit.cover,
          height:80.0,
          width:80.0,
        ),
      ],
    );
  }

  Widget _buildTitleRow(Dish dish) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          dish.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 19.0,
              decoration: TextDecoration.none),
        ),
        Text(
          '¥${dish.price} / ${dish.unit}',
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w800,
              fontSize: 19.0,
              decoration: TextDecoration.none),
        )
      ],
    );
  }

  Widget _buildCellFooter(Dish dish) {
    return Container(
      height: 90.0,
      width:130.0,
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("先扫码后下单！",style: TextStyle(fontSize:13.0,fontWeight:FontWeight.bold),),
          Row(children: <Widget>[
            Text("销售0 ",style: TextStyle(fontSize:13.0,fontWeight:FontWeight.bold,color: Colors.grey),),
            Text("   赞0",style: TextStyle(fontSize:13.0,fontWeight:FontWeight.bold,color: Colors.grey),),
          ],),
          Text(
            "￥999",
            maxLines:1,
            softWrap: true,
            style:TextStyle(fontSize:16.0,color: Colors.redAccent),
          ),
        ],
      ),
    );
  }

  Widget _buildCell(BuildContext context, int index) {
    Dish dish = dishAtIndex(index);
    if (dish == null) {
      return null;
    }
    return Center(
      child: FlatButton(
        onPressed: () {
          cellSelected(context, dish);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: SizedBox(
            width: 250.0,
            height:100.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: 80.0,
                  height:80.0,
                  child: _buildImage(dish),
                ),
                _buildCellFooter(dish)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          controller: this.widget.controller,
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return _buildCell(context, index ~/ 2);
            } else {
              return Container(
                height: 10.0,
                color: Colors.transparent,
              );
            }
          }),
    );
  }
}
