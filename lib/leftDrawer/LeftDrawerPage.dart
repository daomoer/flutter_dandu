import 'package:flutter/material.dart';
import 'package:flutter_dandu/leftDrawer/BlipPage.dart';
import 'package:flutter_dandu/leftDrawer/CalendarPage.dart';
import 'package:flutter_dandu/leftDrawer/CharacterPage.dart';
import 'package:flutter_dandu/leftDrawer/SearchPage.dart';
import 'package:flutter_dandu/leftDrawer/VoicePage.dart';
import 'package:flutter_dandu/leftDrawer/TalkPage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


/// 自定义的左边栏抽屉
class LeftDrawer extends StatefulWidget {
  final double elevation;
  final Widget child;
  final String semanticLabel;
  final double widthPercent;
  ///add start
  final DrawerCallback callback;
  ///add end
  const LeftDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.widthPercent,
    ///add start
    this.callback,
    ///add end
  })  : assert(widthPercent < 1.0 && widthPercent > 0.0),
        super(key: key);
  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String label = widget.semanticLabel;
    final double _width = MediaQuery.of(context).size.width * widget.widthPercent;
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(width: _width),
        child: Material(
          color: Colors.black87,
          elevation: widget.elevation,
          child: Container(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(left: 15,top: 30, right: 15),
                  child: _navigationBarItem(context),
                ),
                new Container(
                  padding:const EdgeInsets.only(bottom: 25),
                  child: _titleCenter(),
                ),
                new LineTips(
                    title: Text('We Read The World',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )),

                new Container(
                  padding:const EdgeInsets.only(top: 50),
                  width: 200,
                  height: 450,
                  child: _categoryListView(context),
                ),
                new Container(
                  padding:const EdgeInsets.only(top: 30),
                  child: _bottomTitle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 顶部关闭和搜索按钮
  Widget _navigationBarItem(BuildContext context){
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
                icon: Image.asset('assets/searchbtn@2x.png'),
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
                    return new SearchPage();
                  }));
                }
            )
        )
      ],
    );
  }

  /// 标题文字
  Widget _titleCenter() {
    return Center(
      child: new Text(
        '單讀',
        style: TextStyle(color: Colors.white,fontSize: 24),
      ),
    );
  }


  /// 分类按钮
  Widget _categoryListView(BuildContext context) {
    return Column(
      children: <Widget>[
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.pop(context);
          },
              child: _AnimatedText("首   页"),
          ),
        ),
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
              return new CharacterPage();
            }));
          },
              child: _AnimatedText("文   字"),
          ),
        ),
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
              return new VoicePage();
            }));
          },
              child: _AnimatedText("声   音"),
          ),
        ),
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
              return new BlipPage();
            }));
          },
              child: _AnimatedText("影   像"),
          ),
        ),
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
              return new TalkPage();
            }));
          },
              child: _AnimatedText("谈   论"),
          ),
        ),
        new Expanded(
          child: new FlatButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
              return new CalendarPage();
            }));
          },
              child: _AnimatedText("单向历"),
          ),
        ),
      ],
    );
  }

  ///放大字体
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


  /// 最底部文字
  Widget _bottomTitle() {
    return Center(
      child: new Text(
        'Powered by OWSPACE',
        style: TextStyle(color: Colors.white70,fontSize: 10),
      ),
    );
  }
}


/// 带横线文字修饰
class LineTips extends StatelessWidget {
  static const defaultMargin = const EdgeInsets.only(left: 0.0, right: 0.0);

  LineTips({
    @required this.title,
    this.margin = defaultMargin,
  });

  final Widget title;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: defaultMargin,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(
                right: 10.0,
              ),
              color: const Color(0xFFD4CFE4),
              height: 0.3,
            ),
          ),
          title,
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(
                left: 10.0,
              ),
              color: const Color(0xFFD4CFE4),
              height: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}


