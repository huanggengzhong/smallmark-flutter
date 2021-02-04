//这里使用规范的写法
import 'package:flutter/material.dart';
import 'package:flutterapp3/state/model/user_info.dart';

class UserViewModel extends ChangeNotifier{
 UserInfo _user;
 UserViewModel(this._user);
 UserInfo get user => _user;

 set user(UserInfo value) {
   _user = value;
   notifyListeners();//设置值时可以用notifyListener()方法来通知侦听器
 }
}