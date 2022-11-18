
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/time_date/time_provider.dart';

class DateChip extends StatefulWidget {
  final String title;

  const DateChip({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  State<DateChip> createState() => _DateChipState();
}

class _DateChipState extends State<DateChip> {

  DateTime? selectedDateTime;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    var time = Provider.of<TimeDateProvider>(context);
    var backColor =
    MaterialStateProperty.all(const Color.fromARGB(255, 181, 225, 237));
    var shade9002 = Colors.blue.shade900;
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        backgroundColor: backColor,
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 1)),
      ),
      onPressed: () =>
      {
      setState((){
          pressed = true;
          DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {
          print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
          }, onConfirm: (date) {
          selectedDateTime = date;
          time.changeTime(date);
          }, currentTime: DateTime(2022, 11, 17, 23, 12, 34));
      })
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text.rich(
          TextSpan(children: <InlineSpan>[
            TextSpan(text: widget.title),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(Icons.arrow_drop_down, color: shade9002)),
          ]),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: shade9002),
        ),
      ),
    );
  }
}
