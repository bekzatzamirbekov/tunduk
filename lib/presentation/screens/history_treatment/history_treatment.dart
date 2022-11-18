import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../api/network.dart';
import '../../../methods/build_listview.dart';
import '../../../model/model.dart';
import '../../../provider/main_provider/provider.dart';
import '../../../provider/show_modal_provider/provider.dart';
import '../../widgets/chips_bar_widget.dart';
import '../../widgets/date_chip_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  DateTime? selectedDateTime ;
  bool pressed = false;
  late Future data;

  @override
  void initState() {
    data = getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var bottomList = Provider.of<BottomList>(context);
    var titleProvider = context.watch<MainProvider>().name;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 50),
                 SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                      titleProvider,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    ChipsBar(title: 'Гос органы', field: 'гос органы',),
                    ChipsBar(title: 'Услуги', field: 'услуги'),
                    ChipsBar(title: 'Статус', field: 'статус'),
                    DateChip(title: 'Дата'),
                  ],
                ),
              ),
            ),
                 Expanded(
                   child: FutureBuilder(
                      future: getData(),
                      builder: (context,AsyncSnapshot snapshot){
                        if(snapshot.hasData){
                          return buildListView(snapshot, context);
                        }
                        return Center(
                            child: CircularProgressIndicator()
                        );
                      }),
                 ),
          ],
        ),
      ),
    );
  }
  Future getData()async{
    var data;
    String url = 'https://jsonplaceholder.typicode.com/posts';
    Network network = Network(url);
    data = network.fetchData();
    data.then((value)=>{
      print(value[0]['title'])
    });
    return data;
  }
}
