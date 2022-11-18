import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunduk/provider/show_modal_provider/provider.dart';

class ChipsBar extends StatefulWidget {
  final String title;

  final String field;

  const ChipsBar({Key? key, required this.title, required this.field})
      : super(key: key);

  @override
  State<ChipsBar> createState() => _ChipsBarState();
}

class _ChipsBarState extends State<ChipsBar> {
  @override
  Widget build(BuildContext context) {
    var list = context.watch<BottomList>().getList(widget.field);
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 181, 225, 237)),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 1)),
      ),
      onPressed: () => {
        showModalBottomSheet(
          isScrollControlled: false,
          backgroundColor: Colors.white,
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SizedBox(
                  width: 120,
                  child: Divider(
                    thickness: 3,
                    height: 5,
                    color: Color.fromARGB(255, 74, 87, 93),
                  )),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    'Выберите ${widget.field}',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...list
                        .map(
                          (organ) =>
                              StatefulBuilder(builder: (context, setStateMap) {
                            var provider = context.watch<BottomList>();
                            return ListTile(
                                onTap: () {
                                  if (widget.field == "гос органы") {
                                    provider.changeGos(organ.title);
                                  }
                                  provider.selectedItemGos(organ);
                                },
                                title: Text(organ.title,
                                    style: TextStyle(color: Colors.black)),
                                selected: organ.selected,
                                trailing: organ.selected
                                    ? const Icon(Icons.done)
                                    : const Text(''));
                          }),
                        )
                        .toList()
                  ],
                ),
              )),
            ],
          ),
        )
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text.rich(
          TextSpan(children: <InlineSpan>[
            TextSpan(text: widget.title),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child:
                    Icon(Icons.arrow_drop_down, color: Colors.blue.shade900)),
          ]),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.blue.shade900),
        ),
      ),
    );
  }
}
