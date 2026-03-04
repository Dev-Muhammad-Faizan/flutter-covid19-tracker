import 'package:flutter/material.dart';

class RowReuse extends StatelessWidget {
  String title, value;
   RowReuse({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          SizedBox(height: 5,),
          Divider(),
        ],
      ),
    );
  }
}
