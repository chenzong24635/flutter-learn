import "package:flutter/material.dart";

//[]()
//[官网](https://api.flutter.dev/flutter/widgets/Padding-class.html)
/*
作用：设置padding,不支持负数，所以如果你需要用到负数的情况下，推荐使用 Transform 。

继承：
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > Padding

构造函数：（类型 属性 = 默认值）
Padding({
  Key key,
  EdgeInsetsGeometry padding, //padding值(@required)
  Widget child,
})

EdgeInsetsGeometry是EdgeInsets以及EdgeInsetsDirectional的基类。
在实际使用中不涉及到国际化，一般都是使用EdgeInsets。
*/

/*
Flutter中并没有单独的Margin控件，在Container中有margin属性，看源码关于margin的实现。

if (margin != null)
  current = new Padding(padding: margin, child: current);

不难看出，Flutter中淡化了margin以及padding的区别，margin实质上也是由Padding实现的。
*/

class PaddingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Padding'),),
      body: Column(
        children: <Widget>[
          Text('Padding widget可以给其子节点添加填充（留白）',style:TextStyle(fontSize: 20.0)),
          Padding(
            //上下左右各添加40像素补白
            padding: EdgeInsets.all(40.0),
                                // fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的填充。
                                // all(double value) : 所有方向均使用相同数值的填充。
                                // only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
                                // symmetric({ vertical, horizontal })：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。
            child: Text("Hello world"),
          ),
          Padding(
            //左边添加8像素补白
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Hello world"),
          ),
          Padding(
            //上下各添加18像素补白
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text("Hello world"),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: const EdgeInsets.fromLTRB(50.0,100.0,50.0,50.0),
            child: Text("Hello world"),
          ),
          Text('基本上需要间距的地方，它都能够使用。如果在单一的间距场景，使用Padding比Container的成本要小一些，毕竟Container里面包含了多个widget。Padding能够实现的，Container都能够实现，只不过，Container更加的复杂。',style:TextStyle(fontSize: 16.0)),
          Text(''),
          Text('Flutter中并没有单独的Margin控件，在Container中有margin属性，margin实质上也是由Padding实现的。',style:TextStyle(fontSize: 15.0)),
        ],
      ),
    );
  }
}
