import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(new MyAppsss());
}

/*
第0步：设置
首先，新建项目
images在项目顶部创建一个目录。如左边Project目录所示images
添加  lake.jpg。（请注意，wget保存此二进制文件不起作用。）
更新  pubspec.yaml 文件以包含assets标签。
打开 pubspec.yaml：
assets:
      - images/lake.jpg
这会使图像可用于您的代码。

第1步：绘制布局图
第一步是将布局打破成其基本要素：

识别行和列。
布局是否包含网格？
有重叠的元素吗？
用户界面是否需要选项卡？
注意需要对齐，填充或边框的区域。
首先，确定更大的元素。在这个例子中，四个元素排列成一列：一个图像，两行和一个文本块。
*/

/*
第2步：实施标题行
首先，您将在标题部分构建左栏。将列放入扩展窗口小部件中会拉伸该列以使用该行中的所有剩余空闲空间。设置crossAxisAlignment属性以 CrossAxisAlignment.start将列放置到行的开头。

将第一行文本放入Container中可以添加填充。列中的第二个子项（也是文本）显示为灰色。

标题行中的最后两项是一个红色的星形图标和文字“41”。将整行放在容器中，并沿着每个边缘填充32像素。

这是实现标题行的代码。
*/
//动态小部件
class WidgetStateless extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _WidgetFuss();
  }
}

class _WidgetFuss extends State<WidgetStateless> {
  //这个判断是否
  bool _isRed = true;
  int _count = 41;

  void _press_WidgeFuss() {
    setState(() {
      if (_isRed) {
        _isRed = false;
        _count -= 1;
      } else {
        _isRed = true;
        _count += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          child: new IconButton(
              icon: _isRed ? new Icon(Icons.star) : new Icon(Icons.star_border),
              color: Colors.redAccent,
              onPressed: _press_WidgeFuss),
        ),
        new SizedBox(
          width: 28.0,
          child: new Container(
            child: new Text('$_count'),
          ),
        )
      ],
    );
  }
}

//改变块的颜色
class ContailColor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ContailColorState();
  }
}

class ContailColorState extends State<ContailColor> {
  bool colorstate = true;

  _handTable() {
    setState(() {
      colorstate = !colorstate;
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO 第三个按钮布局
    Column buildButtonColumn(IconData icon, String label, Color colors) {
      Color color = colors;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      );
    }

    return new GestureDetector(
      //处罚点击事件从而，触发小部件从新绘制
      onTap: _handTable,
      child: new Container(
        padding: new EdgeInsets.only(top: 1.0, bottom: 1.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //TODO 第三行中的列，3.0
            buildButtonColumn(Icons.call, 'CALL',
                colorstate ? Colors.blueGrey : Colors.white),
            buildButtonColumn(Icons.account_balance, 'ROUTE',
                colorstate ? Colors.blueGrey : Colors.white),
            buildButtonColumn(Icons.share, 'SHARE',
                colorstate ? Colors.blueGrey : Colors.white),
          ],
        ),
        width: 600.0,
        height: 70.0,
        decoration: new BoxDecoration(
            color: colorstate ? Colors.white10 : Colors.blueGrey),
      ),
    );
  }
}

//第四块动态父类管理子类状态

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  //TapboxB(this.active,this.onChanged);
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Java' : 'Flutter',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          color: active ? Colors.blueGrey : Colors.black45,
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ParentWidgetState();
  }
}

class ParentWidgetState extends State<ParentWidget> {
  bool _pressIs = false;

  _onChangedPress(bool newvalue) {
    setState(() {
      _pressIs = newvalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _pressIs,
        onChanged: _onChangedPress,
      ),
    );
  }
}

/*
* 混搭方法
对于一些小部件来说，混合搭配的方法最有意义。在这种情况下，有状态小部件管理一些状态，并且父小部件管理状态的其他方面。

在TapboxC示例中，点击时，框的周围会出现一个深绿色的边框。点击时，边框消失，框的颜色改变。TapboxC将其_active状态导出到其父项，但在_highlight内部管理其状态。这个例子有两个状态对象_ParentWidgetState和_TapboxCState。
*
* */
class ParentWidget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ParentWidgetStates();
  }
}

class ParentWidgetStates extends State<ParentWidget1> {
  bool _isParent = false;

  void _onChanged(bool _getvalue) {
    setState(() {
      _isParent = _getvalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(active: _isParent, onChanged: _onChanged),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaboxcState();
  }
}

class _TaboxcState extends State<TapboxC> {
  bool _hightList = false;

  void _handleTapDown(TapDownDetails details) {
    //按下过程效果
    setState(() {
      _hightList = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    //抬起过程效果
    setState(() {
      _hightList = false;
    });
  }

  void _handleCancle() {
    setState(() {
      _hightList = false;
    });
  }

  void _handleTap() {
    //最终效果
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleCancle,
      onTap: _handleTap,
      /*
       * */
      child: new Container(
        //中间字体
        child: new Center(
          child: new Text(
            widget.active ? '混搭管理方法' : 'so easy',
            style: new TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w400,
                color: widget.active ? Colors.white : Colors.deepOrangeAccent),
          ),
        ),
        width: 600.0,
        height: 50.0,
        //盒子来了，变色
        decoration: new BoxDecoration(
          color: widget.active ? Colors.teal : Colors.blueGrey,
          border: _hightList
              ? new Border.all(color: Colors.cyan[700], width: 10.0)
              : null,
        ),
        //这里是边框变化
      ),
    );
  }
}

class AddOrDelectWidght extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddOrDelectState();
  }
}

class AddOrDelectState extends State<AddOrDelectWidght>
    with TickerProviderStateMixin {
  //动画
  AnimationController controller;
  CurvedAnimation curve;
  bool _state = true; //标记如果是true那么就让现实一个文字。否则是图片了
  void _PressState() {
    setState(() {
      _state = !_state;
    });
  }

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  //点击之后，首先调用PressState,然后从新绘制部件，之后绘制时候这里就可以返回替换的小部件了。当然了这个时候自己想如何设置就如何设置了
  Widget _changeWidged() {
    if (_state) {
      return new Container(
        padding: new EdgeInsets.fromLTRB(11.0, 30.0, 11.0, 10.0),
        child: new Text(
          '点击我切换图片哦！',
          style: new TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        decoration: new BoxDecoration(
          color: Colors.white10,
        ),
        width: 1700.0,
        height: 60.0,
      );
    } else {
      return new Container(
        margin: new EdgeInsets.all(10.0),
        padding: new EdgeInsets.all(10.0),
        child: new Image.asset(
          'images/lonvn9.jpg',
          width: 600.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
        decoration: new BoxDecoration(
          color: Colors.yellow,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(child: _changeWidged()),
          new Container(
            margin: new EdgeInsets.only(right: 10.0),
            child: new FloatingActionButton(
              onPressed: _PressState,
              tooltip: 'Update Text',
              child: new Icon(Icons.update),
            ),
            decoration: new BoxDecoration(),
          ),
        ],
      ),
    );
  }
}

//动画
class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFadeTest createState() => new _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;
  Animation<double> afteranimao;
  bool isInout = true;

  void _pressdHe() {
    setState(() {
      isInout = !isInout;
    });
  }

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    afteranimao = new Tween(begin: 0.0, end: 300.0).animate(controller);
    curve = new CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Center(
            child: new Container(
                child: new FadeTransition(
                    opacity: isInout ? afteranimao : curve,
                    child: new FlutterLogo(
                      size: 100.0,
                    )))),
        new FloatingActionButton(
          tooltip: 'Fade',
          child: new Icon(Icons.brush),
          onPressed: () {
            _pressdHe;
            controller.forward();
          },
        ),
      ],
    );
  }
}

//这里是给第一个图片加一个动画。从00到它展开
class ImageAnimal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ImageWidgetState();

  }
}

class AnimalWidgets extends AnimatedWidget {
  AnimalWidgets({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 1.0),
      height: animation.value / 3,
      width: animation.value,
      child: Image.asset(
        'images/long_wuman1.jpg',
        width: 600.0,
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ImageWidgetState extends State<ImageAnimal>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 600.0).animate(controller)
      ..addStatusListener(/*(statu)=>print('$statu')*/ (status) {
        //这里会让动画一直执行很烦的
        /* if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }*/
      })
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    //通过AnimatedWidget进行封装起来。AnimatedWidget类允许您从setState()调用中的动画代码中分离出窗口小部件代码。AnimatedWidget不需要维护一个State对象来保存动画。
    //在下面的重构示例中，LogoApp现在来自AnimatedWidget而不是StatefulWidget。AnimatedWidget在绘制时使用动画的当前值。LogoApp仍然管理着AnimationController和Tween。
    return new AnimalWidgets(
      animation: animation,
    );
    /*
      //这里没有封装的:
      return Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      height: animation.value/3,
      width: animation.value,
      child: Image.asset(
        'images/long_wuman1.jpg',
        width: 600.0,
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );
   */
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

//往返不断的动画

//这里是给第一个图片加一个动画。从00到它展开
class ImageAnimal1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ImageWidgetState();
  }
}

class AnimalWidgets1 extends AnimatedWidget {
  AnimalWidgets1({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 1.0),
      height: animation.value / 3,
      width: animation.value,
      child: Image.asset(
        'images/long_wuman1.jpg',
        width: 600.0,
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ImageWidgetState1 extends State<ImageAnimal1>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 600.0).animate(controller)
      ..addStatusListener(/*(statu)=>print('$statu')*/ (status) {
        //这里会让动画一直执行很烦的
        /* if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }*/
      })
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    //通过AnimatedWidget进行封装起来。AnimatedWidget类允许您从setState()调用中的动画代码中分离出窗口小部件代码。AnimatedWidget不需要维护一个State对象来保存动画。
    //在下面的重构示例中，LogoApp现在来自AnimatedWidget而不是StatefulWidget。AnimatedWidget在绘制时使用动画的当前值。LogoApp仍然管理着AnimationController和Tween。
    return new AnimalWidgets1(
      animation: animation,
    );
    /*
      //这里没有封装的:
      return Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      height: animation.value/3,
      width: animation.value,
      child: Image.asset(
        'images/long_wuman1.jpg',
        width: 600.0,
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );
   */
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyAppsss extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppssss();
  }

}
//TODO 顶部
class MyAppssss extends State<MyAppsss> {
  @override
  Widget build(BuildContext context) {
    //TODO 第二个布局
    Widget titleSection = new Container(
      //距离每个边缘四周32像素
      margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
      child: new Card(
        //最外层为一行包裹里面的
        child: new Row(
          //里面包含三个大布局子控件控件【两行文字,文字,五角星】
          children: <Widget>[
            //TODO 第一个子控件里面两行字体,让其占用多余的控件，这样右边的控件所占之外的所有控件都被他所占用这样展开的更长不然右边控件会往左边跑。
            new Container(
              margin: new EdgeInsets.only(
                  left: 15.0, top: 8.0, right: 45.0, bottom: 5.0),
              //这个列里面装两行文字
              child: new Column(
                //文字从这个左边开始
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    //距离下面一个文字8像素
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      'Flutter-程序员睡白富美秘籍宝典',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //第二行灰色的文字标题,当然了这里可以直接去掉new Container因为不需要修改
                  new Container(
                    //这里不需要距离上下边距。所以new Container是可以不用写的哦
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: new Text(
                        'Flutter开始篇章',
                         style: new TextStyle(color: Colors.grey[500]),
                      )),
                ],
              ),
            ),
            //TODO 第二个五角星
            new WidgetStateless(),
          ],
        ),
      ),
    );

    //TODO 第三个按钮布局
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme
          .of(context)
          .primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      color: Colors.blueGrey,
      //TODO 跟视图1.0
      padding: new EdgeInsets.only(top: 5.0),
      child: new Row(
        //TODO 第一行2.0
        //均匀分布展开
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //TODO 第三行中的列，3.0
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.account_balance, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    //TODO 第四部分 所有文字文本
    Widget artical = new Container(
      color: Colors.blueGrey,
      padding: new EdgeInsets.all(26.0),
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
        textAlign: TextAlign.left,
        softWrap: true,
      ),
    );

    Center pictureEnd = new Center(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new Image.asset(
              'images/long_wuman1.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
          ),
          new Expanded(
            child: new Image.asset(
              'images/lonnv8.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
    Center pictureTitle = new Center(
      child: new Text(
        '''         如果布局太大而不适合设备，则会在受影响的边缘出现红色条纹。用扩展小部件(Expanded)可以解决哦
      ''',
        style: new TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey,
          decorationColor: Colors.purple,
          letterSpacing: 4.0,
          textBaseline: TextBaseline.ideographic,
        ),
      ),
    );

    //Todo 这个是左边文字复杂，右边图片加起来的复杂搭配哦
    Container complexArticlAndPicture = new Container(
      padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
              new Icon(
                Icons.star,
                color: Colors.blueGrey,
                size: 11.0,
              ),
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 1.5,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );

    //todo 这个是下面三行lable一行和Text两行
    Container endEnd = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //一行一列，一行
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Icon(
                Icons.account_balance,
                color: Colors.blueGrey,
                size: 20.0,
              ),
              new Text("PREP",
                  style: new TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 12.0,
                  )),
              new Text(
                "25min",
                style: new TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              new Icon(
                Icons.access_alarm,
                color: Colors.blueGrey,
                size: 20.0,
              ),
              new Text(
                "CLOCKER",
                style: new TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 12.0,
                ),
              ),
              new Text(
                "25min",
                style: new TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              new Icon(
                Icons.access_time,
                color: Colors.blueGrey,
                size: 20.0,
              ),
              new Text(
                "TIME",
                style: new TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 12.0,
                ),
              ),
              new Text(
                "25min",
                style: new TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ],
          )
        ],
      ),
    );

    //左边作为集合
    var leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
      child: new Column(
        children: <Widget>[
          complexArticlAndPicture,
          endEnd,
        ],
      ),
    );

    //右边
    Container finnalContainer = new Container(
      margin: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      height: 180.0,
      child: new Card(
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: leftColumn,
            ),
            new Expanded(
              child: new Image.asset(
                'images/lonnv6.jpg',
                height: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
    //图片列表加边框
    Container pictureTable = new Container(
      //盒子模型
      decoration: new BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: new Column(
        children: <Widget>[
          //标题
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Row(
              children: <Widget>[
                new Text('这个是图片排列',
                    style: new TextStyle(fontSize: 14.0, color: Colors.white)),
              ],
            ),
          ),
          //下面的图片
          new Container(
            padding: EdgeInsets.only(top: 1.0),
            decoration: new BoxDecoration(color: Colors.purple),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new Image.asset(
                      'images/lonnv6.jpg',
                      width: 600.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    )),
                new Expanded(
                    child: new Image.asset(
                      'images/lonnv10.jpg',
                      width: 600.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    )),
                new Expanded(
                    child: new Image.asset(
                      'images/lonnv8.jpg',
                      width: 600.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          ),
        ],
      ),
    );

    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: new Column(
        children: [
          new Container(
            margin:
            EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 10.0),
            padding: EdgeInsets.only(left: 10.0),
            width: 600.0,
            height: 50.0,
            color: Colors.blue,
            child: new Row(
              children: <Widget>[
                new Text(
                  '这个是盒子模型学习哦！和Html相似',
                  style: new TextStyle(color: Colors.white, fontSize: 14.0),
                )
              ],
            ),
          ),
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 11.0, color: Colors.cyan),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset(
                    'images/haha.png',
                    width: 120.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 11.0, color: Colors.cyan),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset(
                    'images/long_wuman1.jpg',
                    width: 120.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 11.0, color: Colors.cyan),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset(
                    'images/lonvn9.jpg',
                    width: 120.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 11.0, color: Colors.cyan),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset(
                    'images/longwuman3.jpg',
                    width: 120.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    List<Container> _buildGridTileList(int count) {
      return new List<Container>.generate(
          count,
              (int index) =>
          new Container(
              child: new Image.asset('images/pic${index + 1}.jpg')));
    }

    ;
    Widget buildGrid() {
      return new GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGridTileList(30),
      );
    }

    //GridView列表图片加载
    Center gradiview = new Center(
      child: buildGrid(),
    );

    //显示运行代码
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello World"),
      ),
      body: new ListView(
        children: <Widget>[
          //TODO 第一个布局
          new ImageAnimal(),
          titleSection,
          new ContailColor(),
          new ParentWidget(),
          new ParentWidget1(),
          //如何添加或从我的布局中删除组件？
          new AddOrDelectWidght(),
          new MyFadeTest(),
          finnalContainer,
          pictureTable,
          artical,
          pictureTitle,
          pictureEnd,
          container,
        ],
      ),
    );
  }
}
