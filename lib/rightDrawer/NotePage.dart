import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


/// 笔记页面
class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: new Text('笔记', style: TextStyle(color: Colors.white,fontSize: 24),),
        ),
          body: Center(
            child: SizedBox(
              width: 200,
              height: 120,
              child: ScaleAnimatedTextKit(
                duration: Duration(milliseconds: 4000),
                isRepeatingAnimation: false,
                text:["         还没有笔记\n      快去记录笔记吧"],
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black45
                ),
              ),
            ),
          )
      ),
    );
  }
}
