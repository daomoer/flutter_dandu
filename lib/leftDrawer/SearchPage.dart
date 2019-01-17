
import 'package:flutter/material.dart';

/// 搜索页面
class SearchPage extends StatelessWidget {
  var dataList = ["热门搜索","黄金时代","单读","创造力","避难所","新闻","记者"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: new Text('搜索', style: TextStyle(color: Colors.white,fontSize: 24),),
        ),
        body: Container(
          color: Color.fromRGBO(248, 247, 245, 1),
          child: new ListView(
            children: <Widget>[
              _SearchBar(context),
              _buildList(context),
            ],
          )
        ),
      ),
    );
  }
}


Widget _SearchBar(BuildContext context) {
 return Container(
      height: 65,
      padding: EdgeInsets.all(10),
      color: Color.fromRGBO(238, 238, 241, 1),
      child: new Container(
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 10),
          child: new TextField(
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: "  🔍搜索文章标题和作者",
              hintStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 16
              ),
              border: InputBorder.none,
            ),
          )
      ),
  );
}

Widget _buildList(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 50),
    child:new Column(
      children: <Widget>[
        _CenterText("热门搜索", Colors.black87, 20, context),
        new Padding(padding: EdgeInsets.only(top: 20)),
        _CenterText("黄金时代", Color.fromRGBO(156, 119, 66, 1), 26, context),
        new Padding(padding: EdgeInsets.only(top: 20)),
        _CenterText("单读", Color.fromRGBO(156, 119, 66, 1), 26, context),
        new Padding(padding: EdgeInsets.only(top: 20)),
        _CenterText("创造力", Color.fromRGBO(156, 119, 66, 1), 26, context),
        new Padding(padding: EdgeInsets.only(top: 20)),
        _CenterText("避难所", Color.fromRGBO(156, 119, 66, 1), 26, context),
        new Padding(padding: EdgeInsets.only(top: 20)),
        _CenterText("新闻", Color.fromRGBO(156, 119, 66, 1), 26, context),
        new Padding(padding: EdgeInsets.only(top: 20)),
        _CenterText("记者", Color.fromRGBO(156, 119, 66, 1), 26, context),
      ],
    ),
  );
}

Widget _CenterText(String text, Color color, double fontSize,BuildContext context,) {
  return Center(
    child: new Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    ),
  );
}
