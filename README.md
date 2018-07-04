# flutter_study

Flutter学习三天搞定项目

一，Flutter:

Flutter和“ReactNative”，我想很多作为android和前端或者ios开发人员都听说过，我们可以JavaScript和React获得一致的开发体验，但是RN在实际平台上还需要适配和桥接差异性，这个过程其实很痛苦的。而Flutter则是依靠Flutter Engine虚拟机在iOS和Android上运行，开发人员可以通过Flutter框架和API在内部进行交互。Flutter Engine使用C/C++编写，具有低延迟输入和高帧速率的特点。除此之外，Flutter提供了自己的小部件集合，可以直接在OS平台提供的画布上描绘控件。可以说实际意义上的一个语言实现多平台运行。
二，学习三天的我写的Demon并且开始开发项目：

我也是上一周听到几个android群里讨论Flutter的，各种天花乱坠，有些说嵌套很麻烦，我想是不是和前端有点像，有些说提供的框架和第三方不完善，或者说迟早gg,当然了，有一个大佬说看了一个月，也分享了他的博客，我第一时间是看了他的Demon，我当时想上手一个月是不是很难了。接下来我就直接奔着官方网站去进行阅读，当然了搭建环境这个环境我没算到学习时间之内，一步步按照官方API阅读并去写代码。我阅读过程中发现，哇这借鉴了web前端的很多特点，小部件盒子模型，以及熟悉的书写格式bootmstrup这让我很快的用一个早上搞定了小部件部分。而且写了很多的案例。我发现布局流程图如果理解了很好写布局，不存在嵌套太导致思路模糊或者找不见问题。我希望直接入手光放API。最快最直接，最明白。 
写了一天半Demon如下图所示： 
当我注重看Flutter框架设计时候，官方网站提供了bottomNavigationBar但是发现设置路由进入子页面之后它没法消失，百度了很多至今没有一个人写个原始的Flutter应用程序框架。这里只好自己写了，当然了思路都一样，用下面点击事件去记录index然后替换显示三个对应的页面就可以了。对于生命传值路由我希望大家可以去看官方网站比较需要理解，而且很好理解的，动态和静态如果设置路由，如何传值这些都是分分钟的事情。Flutter官网连接.
这里写图片描述
![image](https://github.com/luhenchang/flutter_study/blob/master/images/aaaaa.png?raw=true)


项目会一直完善的，我github上传失败了，改天上传希望可以帮助你学习。有什么意见和建议的多多留言，我会尽自己最大的可能提供帮助。

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
