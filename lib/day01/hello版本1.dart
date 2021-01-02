import 'package:flutter/material.dart';

void main() {
//  1.runApp函数
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner:false,
          home:Scaffold(
              appBar: AppBar(
                  title:Text('第一个flutter',style:TextStyle(fontSize: 30))
              ),
              body:Center(
                child: Text(
                    "hello flutter",
//            textDirection:TextDirection.ltr,//MaterialApp风格自带排版顺序,所以这里可以去掉
                    style:TextStyle(
                        fontSize: 30,
                        color: Colors.orange
                    )
                ),
              )
          )
      )
  );
}