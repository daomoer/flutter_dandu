import 'package:flutter/material.dart';

/// 收藏页面
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: new Text('登录', style: TextStyle(color: Colors.white,fontSize: 24),),
          actions: <Widget>[
            FlatButton(
                onPressed: (){
                  print('注册按钮');
                },
                child: new Text('注册', style: TextStyle(color: Color.fromARGB(156, 119, 66, 1),fontSize: 20))
            ),
          ],
        ),
        body: mainContainer,
      ),
    );
  }
}

var mainContainer = Container(
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      new Container(
        child: retrievePasswordBtn,
        margin: EdgeInsets.only(right: 10),
      ),
      new Container(
        padding: EdgeInsets.only(top: 5,left: 15,right: 15),
        child: phoneTF,
      ),
      new Container(
        padding: EdgeInsets.only(top: 20,left: 15,right: 15),
        child: passwordTF,
      ),
      new Container(
        width: 500,
        height: 55,
        margin: EdgeInsets.only(top: 20,left: 15,right: 15),
        child: loginBtn,
      ),
      new Container(
        margin: EdgeInsets.only(top: 20, left: 45, right: 45),
        padding: EdgeInsets.all(10),
        height: 120,
        width: 500,
        child: shareRow,
      )
    ],
  ),
);

var retrievePasswordBtn = FlatButton(
    onPressed: (){
      print('找回密码按钮');
    },
    child: new Text(
      '找回密码',
      textAlign: TextAlign.right,
      style: TextStyle(color: Color.fromARGB(156, 119, 66, 1),fontSize: 15),)
);

var phoneTF = TextField(
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
      labelText: '手机号码',
      border: OutlineInputBorder(

      )

  ),
);

var passwordTF = TextField(
  decoration: InputDecoration(
      labelText: '密码',
      border: OutlineInputBorder(

      )

  ),
);

var loginBtn = FlatButton(
    color: Color.fromRGBO(156, 119, 66, 1),
    onPressed: (){

    },
    child: new Text('登录',style: TextStyle(color: Colors.white,fontSize: 22),)
);


var shareRow = Row(
  children: <Widget>[
    new Expanded(
      child: new Column(
        children: <Widget>[
          new IconButton(icon: Image.asset('assets/sina_48x48_@2x.png'),
              onPressed: (){
                print("点击微博登录");
              }),
          new Text('微博登录',style: TextStyle(color: Colors.black45),)
        ],
      ),
    ),

    new Expanded(
      child: new Column(
        children: <Widget>[
          new IconButton(icon: Image.asset('assets/weixin_48x48_@2x.png'),
              onPressed: (){
                print("点击微信登录");
              }),
          new Text('微信登录',style: TextStyle(color: Colors.black45),)
        ],
      ),
    ),

    new Expanded(
      child: new Column(
        children: <Widget>[
          new IconButton(icon: Image.asset('assets/qqLogin_48x48_@2x.png'),
              onPressed: (){
                print("点击QQ登录");
              }),
          new Text('QQ登录',style: TextStyle(color: Colors.black45),)
        ],
      ),
    )
  ],
);

