import 'dart:async';
import 'dart:io';
import 'package:flutter_app/flutter_intent/view/SecondPagerFragment.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class SystemTavBarPager extends StatefulWidget {
  final String title;

  SystemTavBarPager({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SystemTavBarPagerState(title1: title);
  }
}

class SystemTavBarPagerState extends State<SystemTavBarPager>
    with SingleTickerProviderStateMixin {
  String title1;

  SystemTavBarPagerState({Key key, this.title1});

  final List<Tab> myTabs = <Tab>[
    new Tab(text: '想美食'),
    new Tab(text: '惠生活'),
    new Tab(text: '爱玩乐'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        vsync: this, //动画效果的异步处理，默认格式，背下来即可
        length: myTabs.length //需要控制的Tab页数量
        );
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: new TabBar(
          unselectedLabelColor: Colors.black54,
          labelColor: Colors.black,
          labelStyle: new TextStyle(fontWeight: FontWeight.bold),
          controller: _tabController,
          tabs: myTabs,
          //使用Tab类型的数组呈现Tab标签
          indicatorColor: Colors.white,
          isScrollable: true,
        ),
      ),
      body: new TabBarView(
        physics:BouncingScrollPhysics(),
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          //遍历List<Tab>类型的对象myTabs并提取其属性值作为子控件的内容
          return new Center(
            child: SecondPagerFragment(tab_String: tab.text),
          ); //使用参数值
        }).toList(),
      ),
    );
  }
}
