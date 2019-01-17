import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/// 离线页面
class OffLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: new Text('离线', style: TextStyle(color: Colors.white,fontSize: 24),),
        ),
        body: Center(
          child: SizedBox(
            width: 200,
            height: 120,
            child: ScaleAnimatedTextKit(
              duration: Duration(milliseconds: 4000),
              isRepeatingAnimation: false,
                text:["      还没有离线音频\n         快去下载吧"],
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


