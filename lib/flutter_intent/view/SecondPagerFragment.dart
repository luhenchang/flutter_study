import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_intent/modle/HotBean.dart';
import 'package:flutter_app/flutter_intent/modle/HotListItemBean.dart';

class SecondPagerFragment extends StatefulWidget {
  String tab_String;

  SecondPagerFragment({Key key, this.tab_String}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SecondPagerFragmentState(tabString: tab_String);
}

class SecondPagerFragmentState extends State<SecondPagerFragment> {
  final List<HotBean> hotData = new List();
  final List<HotListItemBean>hotListItemData=new List();
  String tabString;

  SecondPagerFragmentState({Key key, this.tabString});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hotData.clear();
    initData();
  }

  /*    new Tab(text: '想美食'),
    new Tab(text: '惠生活'),
    new Tab(text: '爱玩乐'),
    new Tab(text: '住酒店'),
    new Tab(text: '全部'),*/
  void initData() async {
    switch (tabString) {
      //这里去获取网上解析就可以哦
      case '想美食':
        setState(() {
          hotData.add(HotBean('热门', true));
          hotData.add(HotBean('甜点饮食', false));
          hotData.add(HotBean('小吃快餐', false));
          hotData.add(HotBean('火锅烧烤', false));
          hotData.add(HotBean('外卖', false));
          hotData.add(HotBean('热汗料理', false));
          hotData.add(HotBean('川湘菜', false));
          hotData.add(HotBean('自助餐', false));
          //默认第一个界面是美食
          hotListItemData.add(HotListItemBean('images/item1.png','好利(水晶城)',5,'7.0分','人均￥43','回头客多',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item4.png','泰山里(华山城)',4,'6.0分','人均￥63','好吃',Colors.blue,Icons.shop,'324元蛋糕5元送起，222元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item2.png','好网(土城)',3,'7.0分','人均￥13','难吃',Colors.deepOrangeAccent,Icons.share,'274元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item3.png','乌利(水立方)',2,'5.0分','人均￥33','开学',Colors.orangeAccent,Icons.shopping_cart,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/haha.png','鼓楼(天水城)',1,'6.0分','人均￥43','环境好',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic1.jpg','好利(水晶南)',3,'5.0分','人均￥13','态度好',Colors.green,Icons.shop,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic2.jpg','运泰利(奖成)',4,'4.0分','人均￥26','那首',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic7.jpg','古来(水城)',2,'5.0分','人均￥233','怀旧',Colors.lightGreen,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic8.jpg','好利东(无缘城)',3,'4.0分','人均￥63','景点',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic11.jpg','好利(土城)',2,'7.0分','人均￥43','谷歌',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));

        });

        break;
      case '惠生活':
        setState(() {
          hotData.add(HotBean('全部', true));
          hotData.add(HotBean('鲜花', false));
          hotData.add(HotBean('洗车出租', false));
          hotData.add(HotBean('财务服务', false));
          hotData.add(HotBean('口气服务', false));
          hotData.add(HotBean('超市生鲜', false));
          hotData.add(HotBean('家镇服务', false));
          hotData.add(HotBean('居家维修', false));

          //默认第一个界面是美食
          hotListItemData.add(HotListItemBean('images/item1.png','好利(水晶城)',5,'7.0分','人均￥43','回头客多',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item4.png','泰山里(华山城)',4,'6.0分','人均￥63','好吃',Colors.blue,Icons.shop,'324元蛋糕5元送起，222元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item2.png','好网(土城)',3,'7.0分','人均￥13','难吃',Colors.deepOrangeAccent,Icons.share,'274元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item3.png','乌利(水立方)',2,'5.0分','人均￥33','开学',Colors.orangeAccent,Icons.shopping_cart,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/haha.png','鼓楼(天水城)',1,'6.0分','人均￥43','环境好',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic1.jpg','好利(水晶南)',3,'5.0分','人均￥13','态度好',Colors.green,Icons.shop,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic2.jpg','运泰利(奖成)',4,'4.0分','人均￥26','那首',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic7.jpg','古来(水城)',2,'5.0分','人均￥233','怀旧',Colors.lightGreen,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic8.jpg','好利东(无缘城)',3,'4.0分','人均￥63','景点',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic11.jpg','好利(土城)',2,'7.0分','人均￥43','谷歌',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));

        });

        break;
      case '爱玩乐':
        setState(() {
          hotData.add(HotBean('热门', true));
          hotData.add(HotBean('聚会完了', false));
          hotData.add(HotBean('休闲放松', false));
          hotData.add(HotBean('约炮场所', false));
          hotData.add(HotBean('拐卖人口', false));
          hotData.add(HotBean('演出赛事', false));
          hotData.add(HotBean('晴子游乐', false));
          hotData.add(HotBean('松松头发', false));

          //默认第一个界面是美食
          hotListItemData.add(HotListItemBean('images/item1.png','好利(水晶城)',5,'7.0分','人均￥43','回头客多',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item4.png','泰山里(华山城)',4,'6.0分','人均￥63','好吃',Colors.blue,Icons.shop,'324元蛋糕5元送起，222元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item2.png','好网(土城)',3,'7.0分','人均￥13','难吃',Colors.deepOrangeAccent,Icons.share,'274元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item3.png','乌利(水立方)',2,'5.0分','人均￥33','开学',Colors.orangeAccent,Icons.shopping_cart,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/haha.png','鼓楼(天水城)',1,'6.0分','人均￥43','环境好',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic1.jpg','好利(水晶南)',3,'5.0分','人均￥13','态度好',Colors.green,Icons.shop,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic2.jpg','运泰利(奖成)',4,'4.0分','人均￥26','那首',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic7.jpg','古来(水城)',2,'5.0分','人均￥233','怀旧',Colors.lightGreen,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic8.jpg','好利东(无缘城)',3,'4.0分','人均￥63','景点',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic11.jpg','好利(土城)',2,'7.0分','人均￥43','谷歌',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));

        });

        break;
      case '住酒店':
        setState(() {
          hotData.add(HotBean('热门', true));
          hotData.add(HotBean('经济', false));
          hotData.add(HotBean('高档', false));
          hotData.add(HotBean('豪华', false));
          hotData.add(HotBean('外卖', false));
          hotData.add(HotBean('热汗料理', false));
          hotData.add(HotBean('川湘菜', false));
          hotData.add(HotBean('自助餐', false));

          //默认第一个界面是美食
          hotListItemData.add(HotListItemBean('images/item1.png','好利(水晶城)',5,'7.0分','人均￥43','回头客多',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item4.png','泰山里(华山城)',4,'6.0分','人均￥63','好吃',Colors.blue,Icons.shop,'324元蛋糕5元送起，222元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item2.png','好网(土城)',3,'7.0分','人均￥13','难吃',Colors.deepOrangeAccent,Icons.share,'274元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item3.png','乌利(水立方)',2,'5.0分','人均￥33','开学',Colors.orangeAccent,Icons.shopping_cart,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/haha.png','鼓楼(天水城)',1,'6.0分','人均￥43','环境好',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic1.jpg','好利(水晶南)',3,'5.0分','人均￥13','态度好',Colors.green,Icons.shop,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic2.jpg','运泰利(奖成)',4,'4.0分','人均￥26','那首',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic7.jpg','古来(水城)',2,'5.0分','人均￥233','怀旧',Colors.lightGreen,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic8.jpg','好利东(无缘城)',3,'4.0分','人均￥63','景点',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic11.jpg','好利(土城)',2,'7.0分','人均￥43','谷歌',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));

        });

        break;
      case '全部':
        setState(() {
          hotData.add(HotBean('热门', true));
          hotData.add(HotBean('甜点饮食', false));
          hotData.add(HotBean('小吃快餐', false));
          hotData.add(HotBean('火锅烧烤', false));
          hotData.add(HotBean('外卖', false));
          hotData.add(HotBean('热汗料理', false));
          hotData.add(HotBean('川湘菜', false));
          hotData.add(HotBean('自助餐', false));

          //默认第一个界面是美食
          hotListItemData.add(HotListItemBean('images/item1.png','好利(水晶城)',5,'7.0分','人均￥43','回头客多',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item4.png','泰山里(华山城)',4,'6.0分','人均￥63','好吃',Colors.blue,Icons.shop,'324元蛋糕5元送起，222元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item2.png','好网(土城)',3,'7.0分','人均￥13','难吃',Colors.deepOrangeAccent,Icons.share,'274元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/item3.png','乌利(水立方)',2,'5.0分','人均￥33','开学',Colors.orangeAccent,Icons.shopping_cart,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/haha.png','鼓楼(天水城)',1,'6.0分','人均￥43','环境好',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic1.jpg','好利(水晶南)',3,'5.0分','人均￥13','态度好',Colors.green,Icons.shop,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic2.jpg','运泰利(奖成)',4,'4.0分','人均￥26','那首',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic7.jpg','古来(水城)',2,'5.0分','人均￥233','怀旧',Colors.lightGreen,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic8.jpg','好利东(无缘城)',3,'4.0分','人均￥63','景点',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));
          hotListItemData.add(HotListItemBean('images/pic11.jpg','好利(土城)',2,'7.0分','人均￥43','谷歌',Colors.deepOrangeAccent,Icons.shopping_basket,'174元蛋糕5元送起，122元蛋糕50元'));

        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView(
        children: <Widget>[
          new SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 7,
            child: Container(
              color: Color(0xFFE0F2F1),
              child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (hotData.length / 2).toInt(),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: new EdgeInsets.only(left: 4.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 4 - 14,
                          child: new Text(
                            hotData[index * 2].name,
                            style: TextStyle(
                              color: hotData[index * 2].is_selected
                                  ? Colors.white
                                  : Colors.teal,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            color: hotData[index * 2].is_selected
                                ? Color(0xFF4DB6AC)
                                : Colors.white,
                            borderRadius: BorderRadius.all(
                              const Radius.circular(35.0),
                            ),
                          ),
                          padding: new EdgeInsets.only(
                              left: 13.0, top: 5.0, bottom: 5.0, right: 13.0),
                          margin: new EdgeInsets.only(top: 10.0, left: 5.0),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4 - 14,
                          child: new Text(
                            hotData[index * 2 + 1].name,
                            style: TextStyle(
                              color: hotData[index * 2 + 1].is_selected
                                  ? Colors.white
                                  : Colors.teal,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            color: hotData[index * 2 + 1].is_selected
                                ? Color(0xFF4DB6AC)
                                : Colors.white,
                            borderRadius: BorderRadius.all(
                              const Radius.circular(35.0),
                            ),
                          ),
                          padding: new EdgeInsets.only(
                              left: 13.0, top: 5.0, bottom: 5.0, right: 13.0),
                          margin: new EdgeInsets.only(top: 10.0, left: 5.0),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          new SizedBox(
            width: MediaQuery.of(context).size.width,
            height:1150.0,
            child: new Container(
              child: new ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap:false,
                itemCount: hotListItemData.length,
                itemBuilder: (context, index) {
                  return new Column(
                    children: <Widget>[
                      new Container(
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: new EdgeInsets.all(15.0),
                              child: new Image.asset(
                                hotListItemData[index].image_url,
                                width: 80.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            //左边图片
                            Container(
                              margin: new EdgeInsets.only(top: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text( hotListItemData[index].item_title),
                                  new Container(
                                    margin: new EdgeInsets.only(
                                        top: 7.0, bottom: 6.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          size: 15.0,
                                          color: Color(0xFFF9A825),
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          size: 15.0,
                                          color: Color(0xFFF9A825),
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          size: 15.0,
                                          color: Color(0xFFF9A825),
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          size: 15.0,
                                          color: Color(0xFFF9A825),
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          size: 15.0,
                                          color: Color(0xFFF9A825),
                                        ),
                                        new Text(
                                          hotListItemData[index].item_subject_score,
                                          style: TextStyle(fontSize: 10.0),
                                        ),
                                        new Text(
                                          hotListItemData[index].item_subject_money,
                                          style: TextStyle(fontSize: 10.0),
                                        )
                                      ],
                                    ),
                                  ),
                                  new SizedBox(
                                    width: 50.0,
                                    height: 20.0,
                                    child: OutlineButton(
                                      onPressed: () {},
                                      padding: new EdgeInsets.all(3.0),
                                      borderSide: new BorderSide(
                                          width: 3.0, color: hotListItemData[index].colors),
                                      child: Text(
                                        hotListItemData[index].item_end_message,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                  new Container(
                                    margin: new EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Icon(
                                            hotListItemData[index].iconname,
                                            color: Colors.teal,
                                            size: 20.0,
                                          ),
                                        ),
                                        Container(
                                          child: new Text(
                                            hotListItemData[index].message,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black45),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //右边的文字们
                            Container(), //这个是文字
                          ],
                        ),
                      ),
                      Divider(height: 1.0,color: Colors.black12,),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
