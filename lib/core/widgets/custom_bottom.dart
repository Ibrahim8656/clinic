import 'package:clinic/core/colos/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class custom_botton extends StatelessWidget {
  const custom_botton({
    super.key, required this.text, required this.onTap, 
  });
 final String text;
 final Function()onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(decoration: BoxDecoration(
        color: primarycolor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      )),),
    );
  }
}
