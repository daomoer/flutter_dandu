
import 'package:flutter/material.dart';
import 'package:flutter_dandu/login/LoginPage.dart';
import 'package:flutter_dandu/rightDrawer/SettingPage.dart';
import 'package:flutter_dandu/rightDrawer/MessagePage.dart';
import 'package:flutter_dandu/rightDrawer/CollectPage.dart';
import 'package:flutter_dandu/rightDrawer/OffLinePage.dart';
import 'package:flutter_dandu/rightDrawer/NotePage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


// 自定义的右边栏抽屉
class RightDrawer extends StatelessWidget {
  final double elevation;
  final Widget child;
  final String semanticLabel;
  ///new start
  final double widthPercent;
  ///new end
  const RightDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    ///new start
    this.widthPercent = 0.7,
    ///new end
  }) :
  ///new start
        assert(widthPercent!=null&&widthPercent<1.0&&widthPercent>0.0)
  ///new end
  ,super(key: key);
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String label = semanticLabel;
    ///new start
    final double _width=MediaQuery.of(context).size.width*widthPercent;
    ///new end
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        ///edit start
        constraints: BoxConstraints.expand(width: _width),
        ///edit end
        child: Material(
          elevation: elevation,
          color: Colors.black87,
          child: Container(
            child: new Column(
              children: <Widget>[
                new Container(
                    padding: const EdgeInsets.only(left: 15,top: 30, right: 15),
                    child: _navigationBarItem(context)
                ),
                new Container(
                  padding:const EdgeInsets.only(top: 20),
                  width: 180,
                  height: 180,
                  child: Center(
                    child: _loginView(context),
                  ),
                ),
                new Container(
                  padding:const EdgeInsets.only(top: 30),
                  width: 200,
                  height: 360,
                  child: _categoryListView(context),
                ),
                new Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: _owspace(),
                ),
                new Container(
                  padding:const EdgeInsets.only(top: 20),
                  child: _versionTitle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  /// 顶部关闭和搜索按钮
  Widget _navigationBarItem(BuildContext context) {
    return Row(
      children: <Widget>[
        new Container(
            width: 45,
            height: 45,
            child:  new IconButton(
                icon: Image.asset('assets/close@2x.png'),
                onPressed: (){
                  Navigator.pop(context);
                }
            )
        ),
        new Expanded(child: new Container(
          color: Colors.black87,
        )),
        new Container(
            width: 45,
            height: 45,
            child: new IconButton(
                icon: Image.asset('assets/Settings_white.png'),
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
                    return new SettingPage();
                  }));
                }
            )
        )
      ],
    );
  }

  /// 登录按钮和头像
  Widget _loginView(BuildContext context){
    return Column(
      children: <Widget>[
        new Container(
            width: 120,
            height: 120,
            child:  new IconButton(
                icon: Image.asset('assets/no_login@2x.png'),
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
                    return new LoginPage();
                  }));
                }
            )
        ),
        new Container(
          width: 120,
          height: 40,
          child: new FlatButton(
              onPressed: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
                  return new LoginPage();
                }));
              },
              child: new Text('登录', style: TextStyle(color: Colors.white, fontSize: 20),)
          ),
        )
      ],
    );
  }


  /// 分类按钮
  Widget _categoryListView(BuildContext context){
    return Column(
      children: <Widget>[
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
              return new MessagePage();
            }));
          },
            child: _AnimatedText("消   息"),
          ),
        ),
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
              return new CollectPage();
            }));
          },
            child: _AnimatedText("收   藏"),
          ),
        ),
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
              return new OffLinePage();
            }));
          },
              child: _AnimatedText("离   线"),
          ),
        ),
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
              return new NotePage();
            }));
          },
          child: _AnimatedText("笔    记"),
          ),
        ),
      ],
    );
  }

  Widget _AnimatedText(String str){
    return SizedBox(
      child: ScaleAnimatedTextKit(
        duration: Duration(milliseconds: 4000),
        isRepeatingAnimation: false,
        text:[str],
        textStyle: TextStyle(
            fontSize: 35,
            color: Colors.white
        ),
      ),
    );
  }

  Widget _owspace(){
    return Column(
      children: <Widget>[
        new Center(
          child: Text(
            '單向空間',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18
            ),
          ),
        ),
        new Center(
          child: Text(
            'O W S P A C E',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 10
            ),
          ),
        )
      ],
    );
  }

  /// 版本信息
  Widget _versionTitle() {
    return Center(
      child: new Text(
        'version1.6.2',
        style: TextStyle(color: Colors.white70,fontSize: 12),
      ),
    );
  }
}





