# flutter_study
**Flutter学习三天,一天写完Demo：一有时间后面会持续更新的哦**

**2018年，8.20好久没写Flutter了，写了个各大点餐平台的类表滑动炫酷界面，希望对你有所帮助**
项目下面->lib->test->MeiTuanShopping.dart

![image](https://github.com/luhenchang/IMAGE/blob/master/app/src/main/res/drawable/shoopper.gif?raw=true)!

**2018年，8.5没事干，花了一小时实现了大家比较期待的吸附效果和视频播放，希望对你有所帮助**
项目下面->lib->test->SlivScrollListViewTabLayout.dart

![image](https://github.com/luhenchang/IMAGE/blob/master/app/src/main/res/drawable/eseeyss1112.gif?raw=true)!
![image](https://github.com/luhenchang/flutter_study/blob/master/images/finlassswww.gif?raw=true)!

**2018年，8.1下班没事干，花了一小时实现了比较炫酷的界面**

![image](https://github.com/luhenchang/flutter_study/blob/master/images/xuankuss.gif?raw=true)!
![image](https://github.com/luhenchang/flutter_study/blob/master/images/xuankuss1.gif?raw=true)!
![image](https://github.com/luhenchang/flutter_study/blob/master/images/xuankuss2.gif?raw=true)!

**2018年，7月31没事干写了个比较好看的登录注册：**

![image](https://github.com/luhenchang/flutter_study/blob/master/images/av1.png?raw=true)!![image](https://github.com/luhenchang/flutter_study/blob/master/images/av2.png?raw=true)!
![image](https://github.com/luhenchang/flutter_study/blob/master/images/av3.png?raw=true)!![image](https://github.com/luhenchang/flutter_study/blob/master/images/av4.png?raw=true)!
![image](https://github.com/luhenchang/flutter_study/blob/master/images/av5.png?raw=true)!![image](https://github.com/luhenchang/flutter_study/blob/master/images/av6.png?raw=true)!
![image](https://github.com/luhenchang/flutter_study/blob/master/images/av7.png?raw=true)!![image](https://github.com/luhenchang/flutter_study/blob/master/images/av8.png?raw=true)!
![image](https://github.com/luhenchang/flutter_study/blob/master/images/av9.png?raw=true)!![image](https://github.com/luhenchang/flutter_study/blob/master/images/av11.png?raw=true)!

**2018年，7月25看着qq模仿抖音视频**
今天没事干下午，搞了搞视频方面的希望可以帮助到大家。
在目录-view--->Video_demo文件里面。

如下图：

![image](https://github.com/luhenchang/flutter_study/blob/master/images/douying3.gif?raw=true)!

![image](https://github.com/luhenchang/flutter_study/blob/master/images/av7.png?raw=true)!![image](https://github.com/luhenchang/flutter_study/blob/master/images/av9.png?raw=true)!

**2018年，7月24看着qq模仿了抽屉部件**

如图
![image](https://github.com/luhenchang/flutter_study/blob/master/images/%5D_2NQ%7D11H2ULR22S52LN0@R.png?raw=true)

在lib->flutter_view->view->MyDrawer里面，这里包裹如何将一个背景图片颜色通过设置color来调节亮度，以及圆型图边框，和stack的使用等，我相信看看我的代码就可以了。希望有所帮助。

**2018年，7月16没事干更新下Flutter对于3d的支持，我们自定义一个3d展示部件以及图标的绘制**
之所以区别于二维空间，三维（3d）具有向量，位置，体积，在Flutter里面我们可以发现提供了Vector3这个三维向量类：表示它具有位置，方向，欧拉角信息，和某些向量函数等，大学学过3dmax这些建模，比较了解。我们知道一个三维物体，可以让人视觉产生不同于二维物体，是因为它具有体积（体积是由我们人的视觉所看到的），光线。而在手机这个二维界面里面我们能看出它的体积和三维这个就借助于Vector3可以创建一个摄像机提供给我们不同的视角。

二，在Flutter提供的Vector3上面我们自定义我们自己的3d视角小部件。 
准备实现的需求： 
1.Vector3给我们提供了具有方向性的照相机和灯光.，用来不同的视角看3d。 
2.CustomPaint提供了可以进行在Canvas画布上面进行绘制我们的显示。 
3.GestureDetector提供我们在屏幕上的手势拖缀来给变和刷新我们3d图像。

![image](https://github.com/luhenchang/flutter_study/blob/master/images/3D.png?raw=true)

![image](https://github.com/luhenchang/flutter_study/blob/master/images/flutter_chart.gif?raw=true)

[博客地址:](https://blog.csdn.net/m0_37667770/article/details/81042916).

**2018年，7月11日下班晚，搞定美团我的界面有自定义部分主要讲解了**
![image](https://github.com/luhenchang/flutter_study/blob/master/images/bbb.jpg?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/bba.jpg?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/bbc.jpg?raw=true)
[博客地址](https://blog.csdn.net/m0_37667770/article/details/80993571).
如何实现各种弧度或者自定义效果的窗体布局：
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(size.width / 4, size.height - 30);
    var firstPoint = Offset(size.width / 2, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 4), size.height - 30);
    var secondPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

**2018年，7月9日晚上更新**
下班没事干，游戏就搁一边，写了一个多小时的界面，模仿美团，搞定了这两个界面，后面地图，定位这些会慢慢更新的。这个界面提供了如何用Dart创建类，然后给集合添加数据，并动态赋值给列表控件等。目录在flutter_intent->modle（这里面是类）->SecondPager和SecondPagerFragment是第二界面。ShopingListPager是二界面滑动的每个列表页面。
![image](https://github.com/luhenchang/flutter_study/blob/master/images/2323.png?raw=true)
首页完善了下面的列表。
![image](https://github.com/luhenchang/flutter_study/blob/master/images/2121.png?raw=true)






**2018年，7月9日更新**

**登录和首页改变**
一，添加了登录界面，这里登录密码和手机号，都是123456，点击登录进入主页。
![image](https://github.com/luhenchang/flutter_study/blob/master/images/genxin2.png?raw=true)
二，主页面根据美团来写的。目前有时间会一直更新的。轮播图，列表嵌套等。
![image](https://github.com/luhenchang/flutter_study/blob/master/images/genxin1.png?raw=true)


**一，Flutter:**

Flutter和“ReactNative”，我想很多作为android和前端或者ios开发人员都听说过，我们可以JavaScript和React获得一致的开发体验，但是RN在实际平台上还需要适配和桥接差异性，这个过程其实很痛苦的。而Flutter则是依靠Flutter Engine虚拟机在iOS和Android上运行，开发人员可以通过Flutter框架和API在内部进行交互。Flutter Engine使用C/C++编写，具有低延迟输入和高帧速率的特点。除此之外，Flutter提供了自己的小部件集合，可以直接在OS平台提供的画布上描绘控件。可以说实际意义上的一个语言实现多平台运行。
二，学习三天的我写的Demon并且开始开发项目：

我也是上一周听到几个android群里讨论Flutter的，各种天花乱坠，有些说嵌套很麻烦，我想是不是和前端有点像，有些说提供的框架和第三方不完善，或者说迟早gg,当然了，有一个大佬说看了一个月，也分享了他的博客，我第一时间是看了他的Demon，我当时想上手一个月是不是很难了。接下来我就直接奔着官方网站去进行阅读，当然了搭建环境这个环境我没算到学习时间之内，一步步按照官方API阅读并去写代码。我阅读过程中发现，哇这借鉴了web前端的很多特点，小部件盒子模型，以及熟悉的书写格式bootmstrup这让我很快的用一个早上搞定了小部件部分。而且写了很多的案例。我发现布局流程图如果理解了很好写布局，不存在嵌套太导致思路模糊或者找不见问题。我希望直接入手光放API。最快最直接，最明白。 
写了一天半Demon如下图所示： 
当我注重看Flutter框架设计时候，官方网站提供了bottomNavigationBar但是发现设置路由进入子页面之后它没法消失，百度了很多至今没有一个人写个原始的Flutter应用程序框架。这里只好自己写了，当然了思路都一样，用下面点击事件去记录index然后替换显示三个对应的页面就可以了。对于生命传值路由我希望大家可以去看官方网站比较需要理解，而且很好理解的，动态和静态如果设置路由，如何传值这些都是分分钟的事情。Flutter官网连接.
这里写图片描述
![image](https://github.com/luhenchang/flutter_study/blob/master/images/Flutter_1234556.gif?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/1.png?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/3.png?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/4.png?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/5.png?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/6.png?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/7.png?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/8.png?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/9.png?raw=true)
![image](https://github.com/luhenchang/flutter_study/blob/master/images/10.png?raw=true)
项目会一直完善的，我github上传失败了，改天上传希望可以帮助你学习。有什么意见和建议的多多留言，我会尽自己最大的可能提供帮助。
哇哦这个会更新么？
## Getting Started

博客更新地址希望大家可以随时提出意见，我会改进的
[博客地址](https://blog.csdn.net/m0_37667770/article/details/80903890).
