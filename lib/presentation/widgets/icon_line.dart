import 'package:flutter/material.dart';
class IconsLine {
  final IconData? icon;
  final String? title;

  IconsLine([this.title, this.icon]);

}
class IconLine extends StatelessWidget {
  IconLine({
    Key? key,
  }) : super(key: key);

  List<IconsLine> icons = [
    IconsLine("Отправлено", Icons.upload_file_sharp, ),
    IconsLine("Доставлено", Icons.mail_rounded,      ),
    IconsLine("На испол-и", Icons.cloud_upload,      ),
    IconsLine("Обработано", Icons.cloud_done,        ),
  ];

  @override
  Widget build(BuildContext context) {
    var lightBlue = const Color(0xff033478);
    var darkBlue = Colors.blueGrey;
    return Column(
      children:
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
            Icon(Icons.upload_file_sharp,color: lightBlue),
              SizedBox(
                  width: 55,
                  child: Divider(color: lightBlue,height: 5,thickness: 1.5, )),
            Icon(Icons.mail_rounded,color: lightBlue),
              SizedBox(
                  width: 55,
                  child: Divider(color: lightBlue,height: 5,thickness: 1.5, )),
            Icon(Icons.cloud_upload,color: lightBlue),
              SizedBox(
                  width: 55,
                  child: Divider(color: lightBlue,height: 5,thickness: 1.5, )),
            Icon(Icons.cloud_done,color: lightBlue,)
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
            Text("Отправлено",style: TextStyle(fontSize: 13),),
            Text("Доставлено",style: TextStyle(fontSize: 13),),
            Text("На испол-и",style: TextStyle(fontSize: 13),),
            Text("Обработоно",style: TextStyle(fontSize: 13),),
          ],),
          // ...icons.asMap().entries.map((item) => Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 2),
          //     child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Row(
          //         children: [
          //           Icon(item.value.icon, color: lightBlue),
          //           item.key != icons.length - 1?
          //           Expanded(
          //               child: Divider(color: darkBlue,height: 5,thickness: 1.5, )) : SizedBox(),
          //         ],
          //       ),
          //       SizedBox(height: 3,),
          //       Text(item.value.title.toString(), style: TextStyle(),
          //       textAlign: TextAlign.justify,)
          //     ],
          //   ),
          //   ),
          // ),).toList(),

        ]
      );
  }
}
