import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePageBean {
 static List<Information> inforData = new List<Information>();
 static setData(){
   inforData
       .add(new Information(Icons.account_balance, '超市/生鲜', Colors.blue));
   inforData.add(new Information(Icons.home, '名宿/公寓', Colors.yellowAccent));
   inforData.add(
       new Information(Icons.beach_access, '周边/旅游', Colors.lightBlueAccent));
   inforData.add(new Information(
       Icons.card_membership, '机票/火车票', Colors.lightBlueAccent));
   inforData.add(
       new Information(Icons.accessible, '膜拜单车', Colors.lightBlueAccent));
   inforData.add(new Information(Icons.camera_roll, '景点/门票', Colors.red));
   inforData.add(new Information(Icons.local_play, '学习培训', Colors.blue));
   inforData.add(
       new Information(Icons.card_membership, '亲子/乐园', Colors.greenAccent));
   inforData
       .add(new Information(Icons.perm_media, '健身中心', Colors.redAccent));
   inforData.add(new Information(Icons.widgets, '全部分类', Colors.blue));
 }
 /**/
 static List<String> images = [
    'images/haha.png',
    'images/long_wuman1.jpg',
    'images/lonvn9.jpg',
    'images/longnv5.jpeg',
    'images/lonnv8.jpg'
  ];
 static List<String> namesss = ['美食', '电影/演出', '酒店住宿', '休闲娱乐', '外卖'];
}

class Information {
  IconData Item_Icon;
  String name;
  ColorSwatch color;

  Information(this.Item_Icon, this.name, this.color);
}
