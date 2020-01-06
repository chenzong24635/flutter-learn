import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter1/widget/ScaffoldWidget/Scaffold.dart';
import 'package:flutter1/widget/BasicWidget/index.dart';
import 'package:flutter1/widget/LayoutWidget/index.dart';
import 'package:flutter1/widget/ScrollWidget/index.dart';
import 'package:flutter1/widget/AlertWidget/Alert.dart';
import 'package:flutter1/widget/DecoratorWidget/index.dart';
// import 'package:flutter1/widget/OtherWidget/index.dart';
import 'package:flutter1/demo.dart';




final List<String> myRoutesName = <String>[
  'Scaffold',
  '基础组件',
  '布局/容器组件',
  '滚动组件',
  'Alert弹窗',
  '装饰/其他组件',
  // '其他组件',
  'DemoPage',
];
Map<String, WidgetBuilder> myRoutes = {
  "/Scaffold": (context) => ScaffoldPage(),
  "/BasicWidget": (context) => BasicWidget(),
  "/LayoutWidget": (context) => LayoutWidget(),
  "/ScrollWidget": (context) => ScrollWidget(),
  "/Alert": (context) => AlertPage(),
  "/DecoratorWidget": (context) => DecoratorWidget(),
  // "/OtherWidget": (context) => OtherWidget(),
  "/DemoPage": (context) => DemoPage(),
};

void main() {
  debugPaintSizeEnabled = !true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      routes: myRoutes
    );
  }
}

class MyHomePage extends StatefulWidget {
/*   MyHomePage({Key key, this.title}) : super(key: key);
  final String title; */

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends  State<MyHomePage> {
  var routeLists = myRoutes.keys.toList();
  String msg = 'demo';
  int count = 0;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(msg + count.toString()),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavigationBar(// 底部导航栏
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home), 
            activeIcon: Icon(Icons.pages), //选中时的icon，可略
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('收藏')),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), title: Text('订单')),
        ],
        currentIndex: _currentIndex, // 当前选中的item索引
        fixedColor: Colors.blue, // 选中的item的颜色
        onTap: (index) { // 点击item的回调
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton( // 特殊的漂浮Button
        onPressed: () => setState(() {
          count++;
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // 设置floatingActionButton的位置
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
          ),
          itemCount: myRoutesName.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: Card(
                child: Center(
                  child: Text(myRoutesName[index],style:TextStyle(fontSize: 18.0)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}