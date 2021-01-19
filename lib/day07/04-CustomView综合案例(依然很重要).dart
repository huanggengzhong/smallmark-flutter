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
//CustomScrollView很重要
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CustomView'),
        ),
        body:CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,//指定区域不能再滚
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Hello World"),
                background: Image.asset("assets/images/juren.jpeg", fit: BoxFit.cover,),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2
              ),
              delegate: SliverChildBuilderDelegate(
                      (BuildContext ctx, int int) {
                    return Container(color: Color.fromARGB(255, Random().nextInt(
                        256), Random().nextInt(256), Random().nextInt(256)));
                  },
                  childCount: 10
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext ctx, int index) {
                    return ListTile(
                      leading: Icon(Icons.people),
                      title: Text("联系人$index"),
                    );
                  },
                  childCount: 20
              ),
            )
          ],
        )
    );
  }
}
