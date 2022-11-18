import 'package:flutter/material.dart';

class TimeDateProvider extends ChangeNotifier {
  DateTime selectedDateTime = DateTime.now();

  changeTime(time){
    selectedDateTime = time;
    notifyListeners();
  }
}
