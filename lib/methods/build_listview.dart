import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tunduk/provider/main_provider/provider.dart';
import 'package:tunduk/provider/show_modal_provider/provider.dart';

import '../presentation/widgets/icon_line.dart';
import '../presentation/widgets/icon_lineof_service.dart';
import '../provider/time_date/time_provider.dart';

ListView buildListView(AsyncSnapshot snapshot, context) {
  Random random =  Random();
  int randomNumber = random.nextInt(1000000);
  var time = Provider.of<TimeDateProvider>(context).selectedDateTime;
  var titlOnDepend = Provider.of<MainProvider>(context).name;
  var realTime = DateFormat.yMd().add_jm().format(time);
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 50,
      itemBuilder:(context, index) {
        var data = snapshot.data[index];
        var gosTitle = Provider.of<BottomList>(context).gosTitle;
        return Container(
          margin: const EdgeInsets.fromLTRB(5, 15, 5, 0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Заявка',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  Text('№ ${data['id']}$randomNumber', style: const TextStyle( fontSize: 17),),
                  Text('$realTime'),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Expanded(child: Text(data['title'], style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),)),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                children:  [
                  Expanded(
                      child:
                      gosTitle == '' ?
                      const Text(
                        'орган:  Министерство цифрового развитие КР',
                        style: TextStyle(fontSize: 14),
                      ):
                      Text(
                        'орган:   $gosTitle',
                        style: const TextStyle(fontSize: 14),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 5),
              titlOnDepend == 'История обращений'?
              IconLine():IconLineOfService()
            ],
          ),
        );
      } );
}
