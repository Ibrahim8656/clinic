
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class row_box extends StatelessWidget {
  const row_box({
    super.key, required this.first_text, required this.second_text,
  });
final String first_text,second_text;
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      color: const Color.fromARGB(255, 226, 226, 226),
      border: Border.all(width: .5,color: Colors.grey),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(first_text,style: TextStyle(color: const Color.fromARGB(255, 129, 129, 129))),
        Text(second_text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      ],),
    ),);
  }
}