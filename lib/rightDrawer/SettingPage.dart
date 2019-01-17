import 'package:flutter/material.dart';

/// 设置页面
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: new Text('设置', style: TextStyle(color: Colors.white,fontSize: 24),),
        ),
        body: ListView(
          children: <Widget>[
            _buildList(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildList(BuildContext context) {
  return Container(
    color: Color.fromRGBO(248, 247, 245, 1),
    child: Column(
      children: <Widget>[
        new Padding(padding: EdgeInsets.only(top: 15)),
        _titleAndSwitch("消息推送", true, context),
        new Divider(height: 0.6,color: Colors.black12,),
        _titleAndText("清除缓存", "1.88M", context),
        new Padding(padding: EdgeInsets.only(top: 15)),
        _titleAndArrows("正文字号", context),
        new Divider(height: 0.6,color: Colors.black12,),
        _titleAndSwitch("夜间模式", false, context),
        new Divider(height: 0.6,color: Colors.black12,),
        _titleAndSwitch("3G/4G流量缓存", false, context),
        new Padding(padding: EdgeInsets.only(top: 15)),
        _titleAndArrows("关于", context),
        new Divider(height: 0.6,color: Colors.black12,),
        _titleAndArrows("应用评分", context),
        new Divider(height: 0.6,color: Colors.black12,),
        _titleAndArrows("意见反馈", context),
        new Divider(height: 0.6,color: Colors.black12,),
        _titleAndArrows("分享单读App", context),
        new Padding(padding: EdgeInsets.only(top: 15)),
        _titleAndText("退出登录", "", context)
      ],
    ),
  );
}

Widget _titleAndSwitch(String title, bool isOn,BuildContext context) {
  return Container(
    color: Colors.white,
    height: 45,
    padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 10),
    child: Row(
        children: <Widget>[
          new Expanded(
            child:_titleStyle(title),
          ),
          new Container(
            child: new Switch(value: isOn, onChanged: (bool val) {

            }
          ),
          ),
        ]
    ),
  );
}

Widget _titleAndText(String title, String text, BuildContext context) {
  return Container(
    color: Colors.white,
    height: 45,
    padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 10),
    child: Row(
        children: <Widget>[
          new Expanded(
            child:_titleStyle(title),
          ),
          new Container(
            margin: EdgeInsets.only(right: 15),
            child: new Text(
              text,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 15,
              ),
            ),
          )
        ]
    ),
  );
}

Widget _titleAndArrows(String title,BuildContext context) {
  return Container(
    color: Colors.white,
    height: 45,
    padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 10),
    child: Row(
        children: <Widget>[
          new Expanded(
            child:_titleStyle(title),
          ),
          new Container(
            margin: EdgeInsets.only(right: 15),
            width: 10,
            height: 15,
            child: new Image.asset('assets/indiimg_9x17_@2x.png'),
          )
        ]
    ),
  );
}

Widget _titleStyle(String title) {
  return new Text(
    title,
    style: TextStyle(
      color: Colors.black38,
      fontSize: 16,
    ),
  );
}
