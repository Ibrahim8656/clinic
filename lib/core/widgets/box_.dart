
import 'package:clinic/core/colos/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class box extends StatelessWidget {
  const box({
    super.key, required this.first_text, required this.color,
  });
final String first_text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      color: color,
      border: Border.all(width: .5,color: Colors.grey),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child:   Text(first_text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
    ),);
  }
}