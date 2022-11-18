import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  String name = '';

  changeTitle(String title){
    name = title ;
    notifyListeners();
  }

}
