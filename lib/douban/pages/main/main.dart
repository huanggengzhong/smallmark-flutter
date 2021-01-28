import 'package:flutter/material.dart';
import './init_items.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(//下标层叠组件
        index: 4,
        children: pages,
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,//超过四个不设置文字会隐藏
        items:items
      ),
    );
  }
}




