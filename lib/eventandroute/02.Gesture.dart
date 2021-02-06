import 'package:flutter/material.dart';

main() {
  return runApp(MyApp());
}

// GestureDetector事件组件的使用
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("事件监听"),
          ),
          body: Center(

            child: GestureDetector(
                onTap: () {
//                print("事件点击");
                },
                onTapDown: (details) {
                  print("out按下了");

//                print("手势按下:${details.globalPosition.dx}");
//                print("手势按下:${details.localPosition.dx}");
                },
                onLongPress: () {
//                print("长按手势");
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.yellow,
                  alignment: Alignment.center,
                  child: GestureDetector(
                      behavior: HitTestBehavior.opaque,//没什么软用,阻止冒泡事件最好的办法是使用Stack组件,使它不用嵌套
                      onTapDown: (details){
                        print("inner按下了");
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      )),
                )),
          ),
        ));
  }
}
