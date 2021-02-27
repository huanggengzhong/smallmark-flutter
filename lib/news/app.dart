import 'package:flutter/material.dart';

import 'category/categoory_view.dart';
import 'home/home_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorTxt=Theme.of(context).textTheme.bodyText1;
    return DefaultTabController(length: 2, child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
              bodyText1:TextStyle(color: Colors.black)
          )
        ),
        home: Scaffold(
          appBar: AppBar(
            title:Text("新闻资讯",style: colorTxt),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("热门",style: colorTxt),
                ), Tab(
                  child: Text("分类",style: colorTxt)
                ),
              ],
            ),

          ),
          body: TabBarView(
            children: [
              HomePage(),
              CategoryPage()
            ],
          ),
        ),

    ));
  }
}
