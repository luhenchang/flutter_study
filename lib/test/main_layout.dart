// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //第二个布局
    Widget titleSection = new Container(
      //距离每个边缘四周32像素
      padding: const EdgeInsets.all(32.0),
      //最外层为一行包裹里面的
      child: new Row(
        //里面包含三个大布局子控件控件【两行文字,文字,五角星】
        children: <Widget>[
          //TODO 第一个子控件里面两行字体
          new Expanded(
            //这个列里面装两行文字
            child: new Column(
              //文字从这个左边开始
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  //距离下面一个文字8像素
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    '“诉” 你可以告诉我啊',//诉说
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                //第二行灰色的文字标题,当然了这里可以直接去掉new Container因为不需要修改
                new Container(
                    //这里不需要距离上下边距。所以new Container是可以不用写的哦
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      ' I’m missing my home.',
                      style: new TextStyle(color: Colors.grey[500]),
                    )),
              ],
            ),
          ),
          //TODO 第二个五角星
          new Icon(
            Icons.attach_money,
            color: Colors.purple,
          ),
          new Text('100'),
        ],
      ),
    );
    //2.1
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Colors.blueGrey;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    //2
    Widget buttonSection = new Container(
      child: new Row(
        //定义行里面儿子的显示位置例如靠左，右均匀分布，居中...
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(39.0),
      child: new Text(
        '''
星期四的这天晚上，我有点想家。

嗯。我确定我是想家了。
因为我总是回想起很多东西。关于家乡的东西。

想起湛蓝天空棉花糖般的云朵，想起躺在打谷场时试图抓住的星星点点的阳光，想起鼻尖香醇的麦秸秆，想起三轮车座下烫的烂熟的果子，想起野孩子一般穿行在深沟里的日子。

啊呀，真是美好的不像话。

越想越开心，越想越孤单。在这个离家一千多公里的陌生的城市，我越想越心酸。

你可以告诉我啊。
不，我不能告诉你。

这是我的东西。为数不多的财富。我不能告诉你，然后听你说不能理解或是敷衍附和。
我不能。

人真的很奇怪。小时候很多根本没注意过的东西，在长大后的回忆中却清晰如初。
我越想越细致，越想越感慨。
上帝创造记忆这种东西，就是为了在这种时候给我们慰藉吧。

因为这个原因，我姑且在今晚承认，有时候，信仰真的比安慰有用多了。
嗯，至少比我告诉你要有用的多。

虽然我意识到我想家，可也不能一直想。抱着离开家乡念头的人是不能一直想家的。
这是我的软弱。
可以偶尔软弱却不能沉溺。
人一旦沉迷于自身的软弱，便会一昧的软弱下去，会在众人的目光中倒在街头，倒在地上，倒在比地面还要低的地方。

我很怕被人围观这弱点，更怕在众目睽睽之下倒下去。
唔，这大概就是虚伪。
可是，有的虚伪不该受到谴责，因为这是为了活着啊。

飞机飞过这车水马龙的城市，所有的春天来到。
火车带走热情奔放的花朵，所有的夏天就绪。

我必须赶在春天的尾巴悄悄埋一个愿望，发芽了也好，不发芽也没人知道。
这样看来，我的确是个无趣的人。

不想分享故事，不愿迎合笑脸。
我记得以前的教训：想跟你分享有趣的事，却被看作是炫耀，这确实是件很让人落寞的事。

无怪乎当前这么多人以己身为队伍，而不是与人诉衷肠。
呐，谁又肯相信谁呢。
可是这样又形成了一种怪现象，即因为不了解所以窥探别人的故事。

对这种人我只想说，有那窥天探地的心气儿，可有摧枯拉朽的本事？

前不久，收到幼时伙伴的结婚邀请，让人欢喜又震撼。
我一直都还觉得自己不够长大。
故而一时间有种无所适从的慌张。

好像自以为是的留在时光的原地，一瞬间却发现早已被洪流吹到了陌生的地方。

时光洪流吹走了少年、青年时期，我也算为我的年轻付出了代价吧。
而具体什么代价，我竟也悲伤羞臊的说不出话。
但我终于也算明白，年轻总是要付出代价的。

那时候的心很硬又很脆，感情真挚又羸弱。
我相信，在以后的人生里，你可以见形形色色的人生，却再也不会忘记少时不够从容的心碎。

万幸，身边从未短缺亲友。阳光下年轻的父亲母亲一步步走致衰老，却始终未曾远离。
爱是如此宽广，无论醒来是否荒凉。

文字是多么贫乏的东西，我要说的东西到目前还不到三分之一。
可也仅此而已了。毕竟，一时冲动这种事情，实在不该出现在这个年纪的我身上了。
        ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blueGrey, //const Color(0xFFFF8A80)
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('诉'),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'images/long_wuman1.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
