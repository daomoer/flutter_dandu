import 'package:flutter/material.dart';
import 'package:flutter_dandu/leftDrawer/DanDWPage.dart';
import 'package:flutter_dandu/leftDrawer/DuZLPage.dart';

/// 谈论页面
class TalkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: TalkStateful(),
    );
  }
}

class TalkStateful  extends StatefulWidget {
  @override
  _TalkPageState createState() => new _TalkPageState();
}

class _TalkPageState extends State<TalkStateful> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: new Text('谈论', style: TextStyle(color: Colors.white,fontSize: 24),),
        bottom: new TabBar(
            isScrollable: false,//是否可滑动
            unselectedLabelColor: Colors.white,//未选中按钮颜色
            labelColor: Colors.white,//选中按钮颜色
            labelStyle: TextStyle(fontSize: 16),//文字样式
            indicatorSize: TabBarIndicatorSize.label,//滑动的宽度是根据内容来适应,还是与整块那么大(label表示根据内容来适应)
            indicatorWeight: 2.0,//滑块高度
            indicatorColor: Colors.black87,//滑动颜色
            indicatorPadding: EdgeInsets.only(bottom: 1),//与底部距离为1
            controller: _tabController,
            tabs: <Widget> [
              new Tab(
                text: '单读问',
              ),
              new Tab(
                text: '读者论',
              )
            ]
        ),
      ),
      body: new TabBarView(
          controller: _tabController,
          children: <Widget> [
            new DanDuWenPage(),
            new DuZheLunPage(),
          ]
      ),
    );
  }
}