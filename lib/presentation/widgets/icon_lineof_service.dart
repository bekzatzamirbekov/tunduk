import 'package:flutter/material.dart';
class IconsLine {
  final IconData? icon;
  final String? title;

  IconsLine([this.title, this.icon]);

}
class IconLineOfService extends StatelessWidget {
  IconLineOfService({
    Key? key,
  }) : super(key: key);

  List<IconsLine> icons = [
    IconsLine("Сохранено", Icons.upload_file_sharp, ),
    IconsLine("Отправлено", Icons.cloud_upload,      ),
    IconsLine("Обработано", Icons.cloud_done,        ),
  ];

  @override
  Widget build(BuildContext context) {
    var lightBlue = const Color(0xff033478);
    var darkBlue = Colors.blueGrey;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(Icons.save,color: lightBlue),
              SizedBox(
                  width: 90,
                  child: Divider(color: lightBlue,height: 5,thickness: 1.5, )),
              Icon(Icons.mail_rounded,color: lightBlue),
              SizedBox(
                  width: 90,
                  child: Divider(color: lightBlue,height: 5,thickness: 1.5, )),
              Icon(Icons.cloud_upload,color: lightBlue),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("Cохранено",style: TextStyle(fontSize: 13),),
              Text("Отправлено",style: TextStyle(fontSize: 13),),
              Text("Обработано",style: TextStyle(fontSize: 13),),
            ],),
          // SizedBox(width: 1,),
          // ...icons.asMap().entries.map((item) => Expanded(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Row(
          //           children: [
          //             Expanded(child: Icon(item.value.icon, color: lightBlue)),
          //             item.key != icons.length - 1?
          //             Expanded(
          //                 child: Divider(color: darkBlue,height: 5,thickness: 1.5, )) : SizedBox(),
          //           ],
          //         ),
          //         SizedBox(height: 3,),
          //         Text(item.value.title.toString(), style: TextStyle(),
          //           textAlign: TextAlign.justify,)
          //       ],
          //     )
          // ),).toList(),
          // SizedBox(width: 1,)

        ]
    );
  }
}
