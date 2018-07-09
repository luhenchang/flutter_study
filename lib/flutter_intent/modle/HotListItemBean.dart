import 'package:flutter/material.dart';
class HotListItemBean{
 //图片地址
  var image_url='images/haha.png';
  var item_title='标题';
  var item_star=3;
  var item_subject_score='4.0分';
  var item_subject_money='人均49元';
  var item_end_message='回头客多';
  var colors=Color(0xFFEF6C00);
  var iconname=Icons.shop;
  var message='174元完成购物你适合购物哦';
  HotListItemBean(this.image_url,this.item_title,this.item_star,this.item_subject_score,this.item_subject_money,this.item_end_message,this.colors,this.iconname,this.message);


}