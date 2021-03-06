import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html
/*
作用：滚动容器的状态，用于在插入或删除项目时对其进行动画处理。

继承：Object Diagnosticable State<AnimatedList> AnimatedListState

构造函数：（类型 属性 = 默认值）

*/

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Text(''),
    );
  }
}