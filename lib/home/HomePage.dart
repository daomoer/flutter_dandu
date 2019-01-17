
import "package:flutter/material.dart";
import 'package:flutter_dandu/model/CommonModel.dart';
import 'dart:convert';
import 'package:flutter_dandu/common/CommentPage.dart';
import 'package:url_launcher/url_launcher.dart';


class PageViewScreen extends StatefulWidget {
  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<PageViewScreen> {
  List<dynamic> dataList = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  var direction = Axis.vertical;

  @override

  Widget build(BuildContext context) {

    return Center(
      child: PageView.builder(
        itemCount: dataList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return calendarList(dataList[index],index,context);
        },
      ),
    );
  }

  void loadData() async{
    String cssStr = await DefaultAssetBundle.of(context).loadString('json/HomeData.json');
    CommonModel model = CommonModel.fromJson(json.decode(cssStr));
    setState(() {
      List<dynamic>data = [];
      data.addAll(model.datas);
      dataList.addAll(data);//给数据源赋值
    });
  }
}

Widget calendarList(Datas data, int index,BuildContext context) {

  void _launchURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  return InkWell(
      onTap: (){
        _launchURL(data.html5, context);
      },
    child: Column(
      children: <Widget>[
        new Image.network(data.thumbnail),
//      new Divider(
//      color: Color.fromRGBO(156, 119, 66, 1),
//      height: 10.0,
//      ),
        new Container(
          width: 120,
          height: 30,
          color: Color.fromRGBO(156, 119, 66, 1),
          child: new Center(
            child: new Text(
              'TO READ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
              ),
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 40),
          child:  new Text(
            data.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
          ),
        ),
        new Padding(
            padding:EdgeInsets.only(top: 60),
            child: new Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: new Text(
                data.excerpt,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            )
        ),
        new Padding(
          padding: EdgeInsets.only(top: 60),
          child:new Container(
            width: 200,
            child: new Center(
              child: new Divider(
                height: 1.0,
                color: Colors.black,
              ),
            ),
          ) ,
        ),

        new Container(
          padding: EdgeInsets.only(top: 20),
          child: new Text(
            data.author,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20
            ),
          ),
        ),


        new Expanded(
            child: new Container(
              padding: EdgeInsets.only(top: 40),
            child: LikeWidget(data: data),
            )
        )
      ],
    ),
  );
}

class LikeWidget extends StatefulWidget {
  Datas data;
  LikeWidget({Key key, @required this.data}) : super(key: key);
  @override
  _LikeWidgetState createState() => new _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  bool _isLike = true;
  void _togoLike() {
    setState(() {
      /// 如果是喜欢置为未喜欢
      if (_isLike) {
        _isLike = false;
        /// 如果是未喜欢置为喜欢
      } else {
        _isLike = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new Expanded(
            child:new Row(
              children: <Widget>[
                new IconButton(
                    icon: Image.asset('assets/comment@2x.png'),
                    onPressed: (){
                      Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
                        return new CommentPageStateful(post_id: widget.data.id);
                      }));
                    }
                ),
                new Text(
                  widget.data.comment,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                new IconButton(
                    icon: (_isLike ? new Image.asset("assets/like@2x.png") : new Image.asset("assets/liked@2x.png")),
                    onPressed: (){
                      _togoLike();
                    }
                ),
                new Text(
                  /// 这里是先通过int.parse(widget.data.good) string转int ，然后toString()再转成string
                  _isLike ? int.parse(widget.data.good).toString() : (int.parse(widget.data.good)+1).toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            )
        ),
        new Container(
          padding: EdgeInsets.only(right: 15),
          child: new Text(
            '阅读数 '+widget.data.view,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
