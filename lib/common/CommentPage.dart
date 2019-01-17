
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dandu/model/CommentModel.dart';
import 'package:sticky_headers/sticky_headers.dart';


/// 评论公共页面
class CommentPageStateful extends StatefulWidget {
  final String post_id;
  CommentPageStateful({Key key, @required this.post_id}) : super(key: key);
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPageStateful> {
  List<dynamic> newsList = [];
  List<dynamic> hotsList = [];
  List<dynamic> diggList = [];


  @override
  void initState() {
    post_id = widget.post_id;
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: new Text('评论', style: TextStyle(color: Colors.white,fontSize: 24),),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: newsList.length+hotsList.length+1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return StickyHeader(header: CommentHeader('喜欢', diggList.length, index),
              content: DiggList(diggList, diggList.length, context),
              );
            }else if (hotsList.length >0 && index < hotsList.length+1) {
              return StickyHeader(header: CommentHeader('最热评论', hotsList.length, index-1),
                content: HotsList(hotsList[index-1], index, context),
              );
            }else {
              return StickyHeader(header: CommentHeader('最新评论', newsList.length, index-hotsList.length-1),
                content: NewsList(newsList[index-hotsList.length-1], index, context),
              );
            }
          },
        ),
      ),
    );
  }

  String post_id;

  void loadData() async{
    Dio dio = new Dio();
    Response response = await dio.get("http://203.195.230.211/index.php?m=Home&c=Api2&a=getArticleData&post_id=$post_id&sign=8808983cbab97bba78626bc8f92f27d7&time=1547175689&device_id=A39632E7-F689-405B-A3A3-0319D6095B54&version=1.6.2&client=iOS");
    CommentModel result = CommentModel.fromJson(response.data);
    setState(() {
      newsList.addAll(result.datas.comment.news);
      hotsList.addAll(result.datas.comment.hots);
      diggList.addAll(result.datas.digg);
    });
  }
}

/// Header
Widget CommentHeader(String title, int count , int index) {
  if (index == 0) {
    return Container(
      color: Color.fromRGBO(249, 249, 249, 1),
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.only(top: 20)),
          new Row(
            children: <Widget>[
              new Text(
                title,
                style: TextStyle(
                  color: Color.fromRGBO(156, 119, 66, 1),
                  fontSize: 20,
                ),
              ),
              new Container(
                padding: EdgeInsets.only(left: 20),
                child: new Text(
                  '$count',
                  style: TextStyle(
                    color: Color.fromRGBO(156, 119, 66, 1),
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          new Padding(padding: EdgeInsets.only(top: 10)),
          new Divider(
            height: 3.0,
            color: Color.fromRGBO(156, 119, 66, 1),
          )
        ],
      ),
    );
  }else{
    return Center();
  }
}

/// 最热评论
Widget HotsList(Hots hots, int index, BuildContext context) {
  return new Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(
        width: 50,
        height: 50,
        child:new ClipOval(
          child: new Image.network(hots.avatar),
        ),
        margin: EdgeInsets.only(left: 10,top: 10),
      ),
      new Expanded(
        child: new Container(
          padding: EdgeInsets.only(left: 10,top: 10,right: 10),
          child:new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text(
                        hots.nickname,
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )
                    ),
                  ),
                  new Image.asset('assets/like@2x.png'),
                ],
              ),
//              new Padding(padding: EdgeInsets.only(5)),
              new Text(
                hots.content,
                maxLines: 8,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15,
                ),
              ),
//              new Padding(padding: EdgeInsets.only(5)),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Text(
                      hots.updateTime,
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  new Text(
                    '回复',
                    style: TextStyle(
                      color: Color.fromRGBO(156, 119, 66, 1),
                      fontSize: 12,
                    ),
                  )
                ],
              ),

              new Padding(
                  padding: EdgeInsets.only(top: 10)
              ),
              new Divider(
                color: Colors.red,
                height: 2.0,
              ),
            ],
          ),
        ),
      )
    ],
  );
}

/// 喜欢
Widget DiggList(List data, int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: GridView.count(
        crossAxisCount: 8,
        padding: const EdgeInsets.all(5.0),
         //主轴间隔
        mainAxisSpacing: 10.0,
        //横轴间隔
        crossAxisSpacing: 10.0,
        children: _buildGridList(index, data),
      )
    );
}

List<Container> _buildGridList(int count,List data) {
  return new List.generate(
      count,
          (int index,) {
         return new Container(
              child: _imageView(data[index]),
            );
          }
    );
}

Widget _imageView(Digg digg) {
   return new Container(
     width: 50,
     height: 50,
     child: new ClipOval(
       child: new Image.network(digg.avatar),
     ),
   );
}


/// 最新评论
Widget NewsList(News news, int index, BuildContext context) {
  return new Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(
        width: 50,
        height: 50,
        child:new ClipOval(
          child: new Image.network(news.avatar),
        ),
        margin: EdgeInsets.only(left: 10,top: 10),
      ),
      new Expanded(
        child: new Container(
          padding: EdgeInsets.only(left: 10,top: 10,right: 10),
          child:new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Text(
                        news.nickname,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )
                    ),
                  ),
                  new Image.asset('assets/like@2x.png'),
                ],
              ),
              new Padding(padding: EdgeInsets.only(top: 8)),
              new Text(
                news.content,
                maxLines: 8,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15,
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 8)),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Text(
                      news.updateTime,
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  new Text(
                    '回复',
                    style: TextStyle(
                      color: Color.fromRGBO(156, 119, 66, 1),
                      fontSize: 12,
                    ),
                  )
                ],
              ),

              new Padding(
                  padding: EdgeInsets.only(top: 10)
              ),
              new Divider(
                color: Colors.red,
                height: 2.0,
              ),
            ],
          ),
        ),
      )
    ],
  );
}









