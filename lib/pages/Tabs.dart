import 'package:flutter/material.dart';
import "./IndexPage.dart";
import './MinePage.dart';
import './StoryPage.dart';
import './ClubPage.dart';
class Tabs extends StatefulWidget {

  Tabs({Key key, this.title="首页"}) : super(key: key);

  final String title;

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    //构建页面
    return buildBottomTabScaffold();
  }

  //当前显示页面的
  int _currentIndex = 0;
  //点击导航项是要显示的页面
  final pages = [
    IndexPage(),
    StoryPage(),
    ClubPage(),
    MinePage()
  ];

  Widget buildBottomTabScaffold() {
    return SizedBox(
        height: 100,
        child: Scaffold(
          //对应的页面
          body:IndexedStack(
            index: _currentIndex,
            children: pages,
          ),
          appBar: AppBar(title: const Text('首页',style: TextStyle(color: Colors.white),),centerTitle: true,),
          //悬浮按钮的位置
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          //悬浮按钮
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.cyan,
            onPressed: () {
              print("添加");
            },
          ),
          //其他菜单栏
          bottomNavigationBar: BottomAppBar(
            //悬浮按钮 与其他菜单栏的结合方式
            shape: CircularNotchedRectangle(),
            // FloatingActionButton和BottomAppBar 之间的差距
            notchMargin: 6.0,
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildBotomItem(_currentIndex, 0, Icons.home, "首页"),
                buildBotomItem(_currentIndex, 1, Icons.list, "列表"),
                buildBotomItem(_currentIndex, -1, null, "发现"),
                buildBotomItem(_currentIndex, 2, Icons.cloud_circle, "树圈"),
                buildBotomItem(_currentIndex, 3, Icons.person, "我的"),
              ],
            ),
          ),
        ));
  }


// ignore: slash_for_doc_comments
  /**
   * @param selectIndex 当前选中的页面
   * @param index 每个条目对应的角标
   * @param iconData 每个条目对就的图标
   * @param title 每个条目对应的标题
   */
  buildBotomItem(int selectIndex, int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0,color: Colors.grey);
    MaterialColor iconColor = Colors.grey;
    double iconSize=20;
    EdgeInsetsGeometry padding =  EdgeInsets.only(top: 8.0);

    if(selectIndex==index){
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 13.0,color: Colors.cyan);
      //选中状态的按钮样式
      iconColor = Colors.cyan;
      iconSize=25;
      padding =  EdgeInsets.only(top: 6.0);
    }
    Widget padItem = SizedBox();
    if (iconData != null) {
      padItem = Padding(
        padding: padding,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
                Text(
                  title,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      );
    }
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != _currentIndex) {
            setState(() {
              _currentIndex = index;
            });
          }
        },//发生双击时间后回调
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }
}

