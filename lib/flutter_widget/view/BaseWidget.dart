import 'dart:async';

import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  TextWidget({Key key, this.title, this.index}) : super(key: key);
  final String title;
  final int index;

  @override
  State<StatefulWidget> createState() {
    return TextState(title: title, index: index);
  }
}

class TextState extends State<TextWidget> {
  TextState({Key key, this.title, this.index});

  final int index;
  final String title;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget getText() {
    if (index == 0) {
      return new Text(
        '''       一系列具有单一样式的文本。该文本插件播放与单一风格的文本字符串。该字符串可能会跨越多行，或者可能全部显示在同一行上，具体取决于布局约束。该风格参数可选。省略时，文本将使用最接近的DefaultTextStyle中的样式。如果给定样式的 TextStyle.inherit属性为true，则给定样式将与最近的封闭DefaultTextStyle合并。例如，这种合并行为很有用，可以在使用默认字体系列和大小时使文本变为粗体。使用new TextSpan.rich构造函数，Text小部件也可以使用TextSpan创建，以显示使用多种样式的文本（例如，带有粗体字的段落）。''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
            letterSpacing: 3.0),
      );
    } else if (index == 1) {
      return new Text(
        '''     图形图标插件与来自于所述的字体的字形绘制IconData如材料的预定IconData以s 图标。图标不是互动的。对于交互式图标，请考虑材质的 IconButton。使用图标时必须有环境方向性小部件。通常这是由WidgetsApp或 MaterialApp自动引入的。也可以看看：IconButton，用于交互式图标。图标，用于此类的可用图标列表。IconTheme，为图标提供环境配置。ImageIcon，用于显示来自AssetImage或其他ImageProvider的图标。''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
            letterSpacing: 3.0),
      );
    } else if (index == 2) {
      return new Text(
        '''     一个便利的小部件，结合了常见的绘画，定位和大小调整小部件。一个容器首先用填充物包围孩子（通过装饰物中存在的任何边界膨胀），然后对填充的范围应用附加 约束（ 如果其中任何一个为非空值，则合并width和height作为约束）。然后容器被边缘描述的额外空的空间包围。''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
            letterSpacing: 3.0),
      );
    } else if (index == 3) {
      return new Text(
        '''  提供了几种构造函数，用于指定图像的各种方式：

new Image，用于从ImageProvider获取图像。
新的Image.asset，用于 使用密钥从AssetBundle获取图像。
新的Image.network，用于从URL获取图像。
新的Image.file，用于从文件中获取图像。
新的Image.memory，用于从Uint8List获取图像。
支持以下图像格式：JPEG，PNG，GIF，动画GIF，WebP，动画WebP，BMP和WBMP

要自动执行像素密​​度感知资产解析，请使用AssetImage指定图像，并确保在窗口小部件树中的图像小部件上方存在MaterialApp，WidgetsApp或MediaQuery小部件。   ''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
            letterSpacing: 3.0),
      );
    } else if (index == 4) {
      return new Text(
        '''    行我们可以理解为线性布局的水平排列，可以让我们更好的摆布子部件。一般在水平容器如果需要排布很多水平部件那么用Row''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
            letterSpacing: 3.0),
      );
    } else if (index == 5) {
      return new Text(
        '''    列我们可以理解为线性布局的垂直排列，可以让我们更好的摆布子部件。一般在水平容器如果需要排布很多垂直部件那么用colum''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
            letterSpacing: 3.0),
      );
    } else if (index == 6) {
      return new Text(
        '''    材料设计“凸起按钮”。

凸起按钮基于“ 材质”窗口小部件， 按下按钮时，Material.elevation会增加。

使用凸起的按钮可以将维度添加到其他大部分平面布局中，例如，在繁忙的内容列表中或在宽广的空间中。避免在已经提出的内容（例如对话框或卡片）上使用凸起按钮。

如果onPressed回调为null，则该按钮将被禁用，默认情况下将类似于disabledColor中的平面按钮。如果您试图更改按钮的颜色并且没有任何效果，请检查您是否传递了非空onPressed处理函数。

如果您想要水龙头的墨水效果，但又不想使用按钮，请考虑直接使用InkWell。

凸起按钮的最小尺寸为88.0×36.0，可以使用ButtonTheme进行过度曝光。''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
            letterSpacing: 3.0),
      );
    } else if (index == 7) {
      return new ListView(
        children: <Widget>[
          new Text(
            '''    脚手架类
实现基本材料设计视觉布局结构。
此类提供用于显示抽屉，小吃店和底部工作表的API。
要显示小吃吧或持久底部片材，获得 ScaffoldState当前BuildContext经由Scaffold.of并使用 ScaffoldState.showSnackBar和ScaffoldState.showBottomSheet功能。
也可以看看：AppBar，这是一个水平条，通常显示在使用appBar属性的应用顶部。
BottomAppBar，这是一个水平条，通常使用bottomNavigationBar属性显示在应用程序的底部。
FloatingActionButton，这是一个圆形按钮，通常使用floatingActionButton属性显示在应用程序的右下角。
FloatingActionButtonLocation，用于将浮动操作按钮放置 在脚手架的布局中。
FloatingActionButtonAnimator，其用于动态显示 floatingActionButton从一个floatingActionButtonLocation到另一个。
抽屉，这是一个垂直面板，通常使用抽屉 属性显示在身体的左侧（通常隐藏在手机上）。
BottomNavigationBar，这是一个水平的按钮阵列，通常使用bottomNavigationBar 属性沿着应用程序的底部显示。
SnackBar，它是使用ScaffoldState.showSnackBar方法通常显示在应用程序底部附近的临时通知。
BottomSheet，这是一个通常显示在应用底部附近的叠加层。底部页面可以是持久的，在这种情况下，它使用ScaffoldState.showBottomSheet方法或模态显示，在这种情况下，它使用showModalBottomSheet函数显示。
ScaffoldState，这是与这个小部件关联的状态。
material.google.com/layout/structure.html ''',
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.white,
                letterSpacing: 3.0),
          ),
        ],
      );
    } else {
      return new Text(
        '''  
           官方文档对照看
        ''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
            letterSpacing: 3.0),
      );
    }
  }

  void loadData() {}
  Future<bool>_requestPop(){
     return new Future.value(true);
  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text(title)),
      ),
      body: new Container(
        child: getText(),
        margin: new EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
      ),
      backgroundColor: Colors.teal,
    ), onWillPop: _requestPop);
  }
}
