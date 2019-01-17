import 'package:flutter/material.dart';
import 'package:flutter_dandu/model/DuZheLunModel.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

/// 我的评论界面
class MyCommentPage extends StatefulWidget {
  @override
  _MyCommentState createState() => _MyCommentState();
}

class _MyCommentState extends State<MyCommentPage> {
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
            return MyCommentList(dataList[index], index,context);
          },
        ),
      );
    }
  }

  void loadData() async{
    String cssStr = await DefaultAssetBundle.of(context).loadString('json/MyComment.json');
    DuZheLunModel model = DuZheLunModel.fromJson(json.decode(cssStr));
    setState(() {
      List<dynamic>data = [];
      data.addAll(model.datas);
      dataList.addAll(data);//给数据源赋值
    });
  }
}


Widget MyCommentList(Datas data, int index,BuildContext context) {
  void _launchURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  if (index.isOdd){
    return Divider(
      height: 2.0,
      color: Colors.green,
    );
  }
  /// List点击事件
  return InkWell(
      onTap: (){
        _launchURL(data.html5, context);
      },
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          width: 50,
          height: 50,
          child:new ClipOval(
            child: new Image.network(data.thumbnail,fit: BoxFit.cover,),
          ),
          margin: EdgeInsets.only(left: 10,top: 10),
        ),
        new Expanded(
          child: new Container(
            padding: EdgeInsets.only(left: 10,top: 10,right: 10),
            child:new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  data.toAuthorName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                new Text(
                  data.updateTime,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12,
                  ),
                ),
                new Text(
                  data.content,
                  maxLines: 8,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                  ),
                ),

                new Padding(
                    padding: EdgeInsets.only(top: 10)
                ),
                new Divider(
                  color: Colors.red,
                  height: 2.0,
                ),

                new Padding(
                    padding: EdgeInsets.only(top: 10)
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Text(
                          data.title,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                          ),
                        )
                    ),
                    new Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 10,
                      height: 18,
                      child: new Image.asset('assets/indiimg_9x17_@2x.png'),
                    ),
                  ],
                ),
                new Padding(
                    padding: EdgeInsets.only(bottom: 10)
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}










