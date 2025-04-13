import 'package:clinic/core/colos/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class custom_botton extends StatelessWidget {
  const custom_botton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });
  final String text;
  final Color? color;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? primarycolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.006),
            child: Text(
              text,
              style: TextStyle(
                color: color != null ? primarycolor : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.sizeOf(context).width * .015,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
