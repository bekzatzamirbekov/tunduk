import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunduk/provider/main_provider/provider.dart';

import '../../../api/network.dart';
import '../../../methods/build_listview.dart';
import '../../../provider/show_modal_provider/provider.dart';
import '../../widgets/chips_bar_widget.dart';
import '../../widgets/date_chip_widget.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<ThirdScreen> {
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
    // var titleProvider = Provider.of<MainProvider>(context).name;
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
                const SizedBox(width: 20),
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
                    ChipsBar(title: '?????? ????????????', field: '?????? ????????????',),
                    ChipsBar(title: '????????????', field: '????????????'),
                    ChipsBar(title: '????????????', field: '????????????'),
                    DateChip(title: '????????'),
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
