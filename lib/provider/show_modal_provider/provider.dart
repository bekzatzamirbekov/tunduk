import 'package:flutter/material.dart';

class Lists{
  late String title;
  bool selected;
  Lists(this.title, {this.selected = false});
}
class BottomList extends ChangeNotifier {
  // String gosTitle= 'Министерство цифрового развитие КР';
  late String gosTitle = "";
  List<Lists> gos = [
    Lists( 'Министерство цифрового развитие КР',),
    Lists( 'Министерство Образование KР',),
    Lists( 'Министерство Культуры KР',),
    Lists( 'Министерство Энергетики KР',),
    Lists( 'Министерство Внутренных Дел KР',),
    Lists( 'Министерство Иностранных Дел KР',),
    Lists( 'Министерство ..... KР',),
  ];

  List<Lists> getList (String title){
    if(title == "гос органы"){
      return gos;
    }else if(title == "услуги"){
      return uslugi;
    }else if(title == "статус"){
      return status;
    }
    return [];
  }
  selectedItemGos(Lists item) {
    gos.forEach((element) {
      if(element.title == item.title){
        element.selected = true;
      }else {
        element.selected = false;
      }
    });
    print(gos);
    notifyListeners();
  }
  changeGos(String title){
    gosTitle = title;
    notifyListeners();
  }
  List<Lists> uslugi = [
    Lists( 'Услуги КР'),
    Lists( 'Услуги КР'),
    Lists( 'Услуги КР'),
    Lists( 'Услуги КР'),
  ];
  List<Lists> status = [
    Lists( 'Отправлено'),
    Lists( 'Доставлено'),
    Lists( 'Исполнено'),
    Lists( 'Обработано'),
  ];

}
