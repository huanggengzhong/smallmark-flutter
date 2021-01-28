import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import './../subject/subject.dart';
import './../home/home.dart';
import './../group/group.dart';
import './../mall/mall.dart';
import './../profile/profile.dart';
List<buildBOttomItem> items=[
  buildBOttomItem('home','首页'),
  buildBOttomItem('subject','书影音'),
  buildBOttomItem('group','小组'),
  buildBOttomItem('mall','市集'),
  buildBOttomItem('profile','我的'),

];

List<Widget> pages=[
  HomePage(),
  SubjectPage(),
  GroupPage(),
  MallPage(),
  ProfilePage(),
];