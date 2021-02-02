import 'package:flutter/material.dart';
class HYCounterViewModel extends ChangeNotifier{
      int _counter;

      int get counter => _counter;

      set counter(int value) {
        _counter = value;
      }
}