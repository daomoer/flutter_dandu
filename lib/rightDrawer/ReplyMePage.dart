import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/// 回复我的界面
class ReplayMePage extends StatefulWidget {
  @override
  _ReplayMeState createState() => _ReplayMeState();
}

class _ReplayMeState extends State<ReplayMePage> {
  List<dynamic> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
          child: SizedBox(
            width: 200,
            height: 120,
            child: ScaleAnimatedTextKit(
              duration: Duration(milliseconds: 4000),
              isRepeatingAnimation: false,
              text:["         还没有回复\n      快去与人交流吧"],
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black45
              ),
            ),
          ),
        );
  }
}