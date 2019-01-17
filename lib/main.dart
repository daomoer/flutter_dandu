import 'package:flutter/material.dart';
import 'package:flutter_dandu/leftDrawer/LeftDrawerPage.dart';
import 'package:flutter_dandu/rightDrawer/RightDrawerPage.dart';
import 'package:flutter_dandu/home/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      drawer: _drawer(),
      endDrawer: _endDrawer(),
      body: Container(
        child: new PageViewScreen(),
      ),
    );
  }

  get _appbar=>AppBar(
    iconTheme: new IconThemeData(color: Colors.white),
    elevation: 2,
    backgroundColor: Colors.black87,
    centerTitle: true,
    title: Text('单读', style: TextStyle(color: Colors.white, fontSize: 24),),
    leading: Builder(
        builder: (BuildContext context) {
          return IconButton(icon: Image.asset('assets/wangzhandaohang.png'), onPressed: (){
            Scaffold.of(context).openDrawer();
          });
        }),
    actions: <Widget>[
      Builder(
          builder: (BuildContext context) {
            return IconButton(icon: Image.asset('assets/yonghu.png'), onPressed: (){
              Scaffold.of(context).openEndDrawer();
            });
          }
      )
    ],
  );


  Widget _drawer() => LeftDrawer(
    widthPercent: 0.9999,

  );

  Widget _endDrawer() => RightDrawer(
    widthPercent: 0.9999,

  );
}
