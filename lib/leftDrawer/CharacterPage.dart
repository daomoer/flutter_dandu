import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_dandu/model/CharacterModel.dart';
import 'package:flutter_dandu/common/CommonPage.dart';

/// 文字页面
class CharacterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: new Text('文字', style: TextStyle(color: Colors.white,fontSize: 24),),
        ),
        body: CharacterPageStateful(),
      ),
    );
  }
}


class CharacterPageStateful extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPageStateful> {
  List<dynamic> dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(5),
      mainAxisSpacing: 5,
      crossAxisSpacing: 10,
      children: _buildGridList(dataList, dataList.length,context),
    );
  }

  /// 加载数据（本页面用的本地json数据）
  void loadData() async{
    String cssStr = await DefaultAssetBundle.of(context).loadString('json/CharacterData.json');
    CharacterModel result = CharacterModel.fromJson(json.decode(cssStr));
    setState(() {
      List<dynamic>data = [];
      data.addAll(result.datas.list);
      dataList.addAll(data);//给数据源赋值
    });
  }
}

List<Widget> _buildGridList(List data,int index,BuildContext context) {
  List<Widget> widgetList = new List();
  for (int i = 0; i < index; i++) {
    widgetList.add(_stack(data[i],context));
  }
  return widgetList;
}

Widget _stack(Lists list,BuildContext context) {
  /// List点击事件
  return InkWell(
    onTap: (){
      Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
        return new CommonPageStateful(title: list.title,tag: list.id,);
      }));
    },
    /// 图片上面堆加文字
    child: Stack(
      children: <Widget>[
        new Container(
          child: Image.network(list.thumbnail,fit: BoxFit.fitHeight,),
        ),
        new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(left: 20,right: 20,top: 50),
              child: new Center(
                child: new Text(
                  list.title,
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
                  list.sign,
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

























