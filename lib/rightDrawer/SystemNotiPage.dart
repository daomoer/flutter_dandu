import 'package:flutter/material.dart';
import 'package:flutter_dandu/model/DuZheLunModel.dart';
import 'dart:convert';

/// 系统通知界面
class SystemNotiPage extends StatefulWidget {
  @override
  _SystemNotiState createState() => _SystemNotiState();
}

class _SystemNotiState extends State<SystemNotiPage> {
  List<dynamic> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
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
            return MessageList(dataList[index],index, context);
          },
        ),
      );
    }
  }


  void loadData() async{
    String cssStr = await DefaultAssetBundle.of(context).loadString('json/Messages.json');
    DuZheLunModel model = DuZheLunModel.fromJson(json.decode(cssStr));
    setState(() {
      List<dynamic>data = [];
      data.addAll(model.datas);
      dataList.addAll(data);//给数据源赋值
    });
  }
}


Widget MessageList(Datas data, int index,BuildContext context) {
  if (index.isOdd) {
    return Divider(height: 1.0);
  }
  return Container(
    margin: EdgeInsets.only(top: 15,left: 15,right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
             new Container(
                color: Colors.black12,
                width: 30,
                height: 15,
                child: new Text(
                  '已读',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                  ),
                ),
              ),
            new Expanded(
                child: new Container(
                  child: new Text(
                    data.createTime,
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12
                    ),
                  ),
                )
            )

          ],
        ),
        new Padding(padding: EdgeInsets.only(top: 15)),
        new Text(
          data.title,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black45,
          ),
        ),
        new Padding(padding: EdgeInsets.only(top: 10)),
        new Text(
          data.content,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black45,
          ),
        ),

      ],
    ),
  );
}




























