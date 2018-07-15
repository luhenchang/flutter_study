import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_widget/WidgetPager.dart';
import 'package:flutter_app/flutter_widget/WidgetText.dart';
import 'package:flutter_app/flutter_widget/view/BaseWidget.dart';

//TODO 1.0------------列表动态部件-----------------
class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListState();
  }
}

class Percent {
  int index = 0;
  String titles;
  String subject;
  String Containt;

  Percent(this.index, this.titles, this.subject, this.Containt);
}

class ListState extends State<ListViewWidget> {
  List<Percent> data = <Percent>[];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    data.add(Percent(0, '文', 'Text', '一系列具有单一样式的文本。'));
    data.add(Percent(1, '图标', 'Icon', '材质设计图标。'));
    data.add(Percent(2, '容器', 'Container', '一个方便的小部件，结合了常见的绘画，定位和尺寸小部件。'));
    data.add(Percent(3, '图片', 'Image', '一个显示图像的小部件。'));
    data.add(Percent(4, '行', 'Row', '一个小部件，用于在水平数组中显示其子项。'));
    data.add(Percent(5, '列', 'Column', '一个小部件，用于在水平数组中显示其子项。'));
    data.add(Percent(6, '按钮', 'RaisedButton', '材料设计“凸起按钮”。'));
    data.add(Percent(7, '脚手架', 'Material可视化布局', '实现基本材料设计视觉布局结构。'));

    print(data.length);
  }

  //buildListTile相当于ListView的Adapter
  Widget buildListTile(BuildContext context, Percent item) {
    return new ListTile(
      isThreeLine: true,
      //子// item的是否为三行
      dense: false,
      leading: new CircleAvatar(
        child: new Text(item.titles,
            style: new TextStyle(color: Colors.white, fontSize: 10.0)),
      ),
      //左侧首字母图标显示，不显示则传null
      title: new Text(item.subject,style: new TextStyle(color: Colors.white),),
      //子item的标题
      subtitle: new Text(item.Containt,style: new TextStyle(color: Colors.white70)),
      //子item的内容
      trailing: new Icon(
        Icons.arrow_right,
        color: Colors.green,
      ),
      onTap: (){
        print('ListView点击事件');
        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          return new TextWidget(title:item.subject,index: item.index,);
        }));//页面跳转
      },//显示右侧的箭头，不显示则传null
    );
  }

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> listTitles = data.map((Percent item) {
      //将items的内容设置给Adapter
      return buildListTile(context, item);
    });
    return new Container(
      color: Colors.teal,
      child: new ListView(
        children: listTitles.toList(), //
      ),
    );
  }
}

class SmallWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SmallPagerState();
  }
}

class SmallPagerState extends State<SmallWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('第三个界面');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Color(0xFF00796B)),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                new Container(
                  child: Text('小部件学习'),
                  margin: new EdgeInsets.only(left: 70.0),
                ),
              ],
            ),
          ),
        ),
        body: new Center(
          child: new Container(
            child: ListViewWidget(),
          ),
        ),
      ),
    );
  }
}
