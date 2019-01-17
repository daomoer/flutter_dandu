import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dandu/model/CommonModel.dart';
import 'package:flutter_dandu/common/CommonWebViewPage.dart';


/// 文字二级公共页面
class CommonPageStateful extends StatefulWidget {
  final String title;
  final String tag;
  CommonPageStateful({Key key, @required this.tag,this.title}) : super(key: key);
  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPageStateful> {
  List<dynamic> dataList = [];
  var haveMoreData;
  var page_id = "0";
  var new_page_id;
  var curPage = 1;
  var listTotalSize = 0;
  ScrollController _controller = new ScrollController();
  _CommonPageState(){
    /// 监听滚动
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels) {
        print("正在加载更多");
        curPage++;
        loadData(new_page_id,curPage,true);
      }
    });
  }
  @override
  void initState() {
    tag = widget.tag;
    // TODO: implement initState
    super.initState();
    loadData(page_id,1,false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: new Text(widget.title, style: TextStyle(color: Colors.white,fontSize: 24),),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return CommonList(dataList[index],index,context);
          },
          controller: _controller,
        ),
      ),
    );
  }

  String tag;

  /// 这里是请求接口数据，当滑动到最底端的时候会判断是否加载更多更改二个参数，post_id,page+1，然后把新请求的数据追加到以前的数据中
  void loadData(String post_id, int curPage,bool isMore) async{
    Dio dio = new Dio();
    Response response = await dio.get("http://203.195.230.211/index.php?m=Home&c=Api2&a=getTagList&tag=$tag&p=$curPage&client=iOS&show_sdv=1&page_id=$post_id&create_time=0&sign=24a904d18a786327741ca5613180ceda&time=1547092560&device_id=A39632E7-F689-405B-A3A3-0319D6095B54&version=1.6.2&client=iOS");
    CommonModel result = CommonModel.fromJson(response.data);
    setState(() {
      if(!isMore) {
        List<dynamic>data = [];
        data.addAll(result.datas);
        new_page_id = result.datas[data.length-1].id;
        dataList.addAll(data);//给数据源赋值
      }else{
        List<dynamic>data = [];
        data.addAll(result.datas);
        new_page_id = result.datas[data.length-1].id;
        dataList.addAll(data);
      }
    });
  }
}


Widget CommonList(Datas data, int index, BuildContext context) {


  if (index.isOdd){
    return Divider(height: 1.0);
  }
  /// List点击事件
  return InkWell(
    onTap: (){
      Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
        return new CommonWebViewPage(url: data.html5,post_id: data.id,);
      }));
    },
    child: Row(
      children: <Widget>[
        new Container(
          width: 110,
          height: 85,
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
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,color: Colors.black,
                      ),
                    ),
                    new Text(
                      data.author,
                      overflow: TextOverflow.ellipsis,
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




