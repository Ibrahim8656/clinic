import 'package:clinic/core/colos/colors.dart';
import 'package:flutter/material.dart';

class Welcome_doc extends StatelessWidget {
  const Welcome_doc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.035,
        vertical: MediaQuery.sizeOf(context).width * 0.030,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome,',
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: primarycolor,
                ),
              ),
              Text(
                'Dr/ mohamed',
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: primarycolor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
