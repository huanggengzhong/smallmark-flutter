import 'package:flutter/material.dart';

//相当于store
//1.创建自己的Provider
class HYCounterViewModel extends ChangeNotifier{
      int _counter=100;

      int get counter => _counter;

      set counter(int value) {
        _counter = value;
      }
}