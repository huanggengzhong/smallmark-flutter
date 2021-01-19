import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('列表测试'),
        ),
        body:Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
//第一种GridView
//          child: GridView(
//            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 3,//3列
//                childAspectRatio: 1,//高度
//                crossAxisSpacing: 8,
//                mainAxisSpacing: 8
//            ),
//            children: List.generate(100, (index) {
//              return Container(
////              Random().nextInt(256)是随机数
//                color: Color.fromRGBO(255, Random().nextInt(256), Random().nextInt(256), 1),
//              );
//            }),
//          ),
//        第二种:
          child: GridView(
            gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:120,
            ),
            children: List.generate(100, (index) {
              return Container(
//              Random().nextInt(256)是随机数
                color: Color.fromRGBO(255, Random().nextInt(256), Random().nextInt(256), 1),
              );
            }),
          ),
        ));
  }
}
