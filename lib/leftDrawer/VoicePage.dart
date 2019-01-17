import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_dandu/model/CommonModel.dart';
import 'package:url_launcher/url_launcher.dart';


/// 声音页面
class VoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: new Text('声音', style: TextStyle(color: Colors.white,fontSize: 24),),
        ),
        body: VoicePageStateful(),
      ),
    );
  }
}


class VoicePageStateful extends StatefulWidget {
  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePageStateful> {
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
            return VoiceList(dataList[index],index, context);
          },
        ),
      );
    }
  }

  void loadData() async{
    String cssStr = await DefaultAssetBundle.of(context).loadString('json/VoiceData.json');
    CommonModel model = CommonModel.fromJson(json.decode(cssStr));
    setState(() {
      List<dynamic>data = [];
      data.addAll(model.datas);
      dataList.addAll(data);//给数据源赋值
    });
  }
}


Widget VoiceList(Datas data, int index,BuildContext context) {
  void _launchURL(String url, BuildContext context) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }

  }

  if (index.isOdd){
    return Divider(height: 1.0);
  }
  /// List点击事件
  return InkWell(
    onTap: (){
      _launchURL(data.html5, context);
    },
    child: Row(
      children: <Widget>[
        new Container(
          width: 110,
          height: 80,
          margin: EdgeInsets.only(left: 20,bottom: 20, top: 20),
          child: Image.network(data.thumbnail,fit: BoxFit.cover,),
        ),
        new Expanded(
            child:Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child:  new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 18,color: Colors.black,
                      ),
                    ),
                    new Text(
                      data.author,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 14,color: Colors.black38
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
        new Container(
          margin: EdgeInsets.only(right: 15),
          width: 10,
          height: 15,
          child: new Image.asset('assets/indiimg_9x17_@2x.png'),
        ),
      ],
    ),
  );
}




























