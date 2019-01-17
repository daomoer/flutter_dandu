
import 'package:flutter/material.dart';
import 'package:flutter_dandu/model/CommonModel.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

/// 单读问页面
class DanDuWenPage extends StatefulWidget {
  @override
  _DanDWState createState() => _DanDWState();
}

class _DanDWState extends State<DanDuWenPage> {
  List<dynamic> dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 无数据时，显示Loading
    if (dataList == null) {
      return new Center(
        // CircularProgressIndicator是一个圆形的Loading进度条
        child: new CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return DanDuWenList(dataList[index], index,context);
          },
        ),
      );
    }
  }
  void loadData() async{
    String cssStr = await DefaultAssetBundle.of(context).loadString('json/DanduwenData.json');
    CommonModel model = CommonModel.fromJson(json.decode(cssStr));
    setState(() {
      List<dynamic>data = [];
      data.addAll(model.datas);
      dataList.addAll(data);//给数据源赋值
    });
  }
}


Widget DanDuWenList(Datas data, int index,BuildContext context) {
  void _launchURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// List点击事件
  return InkWell(
      onTap: (){
       _launchURL(data.html5, context);
      },
    child: Stack(
      children: <Widget>[
        new Container(
//        height: 150,
          padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 0),
          child: Image.network(data.thumbnail,fit: BoxFit.fitHeight,),
        ),
        new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(left: 20,right: 20,top: 80),
              child: new Center(
                child: new Text(
                  data.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            new Container(
              child: new Center(
                child: new Text(
                  data.updateTime,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}




