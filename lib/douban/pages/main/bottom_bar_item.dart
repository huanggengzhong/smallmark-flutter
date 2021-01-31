import 'package:flutter/material.dart';
//  提取成类组件,记得调用父类初始化
class buildBOttomItem extends BottomNavigationBarItem{
  buildBOttomItem(String iconName,String title):super(
//    这里是父类初始化
      title:Text(title),
      icon:Image.asset('assets/images/tabbar/$iconName.png',width: 32,gaplessPlayback: true,),//gaplessPlayback: true禁止闪烁
      activeIcon:Image.asset("assets/images/tabbar/${iconName}_active.png",width: 32,gaplessPlayback: true)
  );
}