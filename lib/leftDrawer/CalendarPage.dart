import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_dandu/model/CommonModel.dart';
import 'package:flutter_dandu/common/CommonWebViewPage.dart';

/// 单向历页面
class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: new Text('单向历', style: TextStyle(color: Colors.white,fontSize: 24),),
        ),
        body: CalendarPageStateful(),
      ),
    );
  }
}

class CalendarPageStateful extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPageStateful> {
  List<dynamic> dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    return Center(
      child: PageView.builder(
        itemCount: dataList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return calendarList(dataList[index],index, context);
        },
      ),
    );
  }

  void loadData() async{
    String cssStr = await DefaultAssetBundle.of(context).loadString('json/CalendarData.json');
    CommonModel model = CommonModel.fromJson(json.decode(cssStr));
    setState(() {
      List<dynamic>data = [];
      data.addAll(model.datas);
      dataList.addAll(data);//给数据源赋值
    });
  }
}


Widget calendarList(Datas data, int index,BuildContext context) {

  return InkWell(
      onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
          return new CommonWebViewPage(url: data.html5,post_id: data.id,);
        }));
      },
    child: Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Expanded(
                child:new Container(
                  child: new Text(
                    data.title,
                  ),
                  padding: EdgeInsets.only(left: 15,top: 15),
                )
            ),
            new Container(
              margin: EdgeInsets.only(right: 15,top: 15),
              width: 10,
              height: 15,
              child: new Image.asset('assets/indiimg_9x17_@2x.png'),
            ),
          ],
        ),
        new Expanded(
            child:new Container(
              padding: EdgeInsets.all(15),
              child: new Image.network(data.thumbnail,fit: BoxFit.fill,),
            )
        ),
        new Container(
            padding: EdgeInsets.only(right: 15,bottom: 15),
            alignment: Alignment.centerRight,
            child: new Text('Designed by OWSPACE.',textAlign: TextAlign.end,)
        )
      ],
    ),
  );
}






























