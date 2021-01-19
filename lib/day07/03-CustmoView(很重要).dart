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
            SliverSafeArea(
              sliver: SliverPadding(
                padding: EdgeInsets.all(8),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.5
                  ),
                  delegate: SliverChildBuilderDelegate(
                          (BuildContext ctx, int int) {
                        return Container(color: Color.fromARGB(255, Random().nextInt(
                            256), Random().nextInt(256), Random().nextInt(256)));
                      },
                      childCount: 100
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
