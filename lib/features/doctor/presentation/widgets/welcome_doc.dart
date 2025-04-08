import 'package:clinic/core/colos/colors.dart';
import 'package:flutter/material.dart';

class Welcome_doc extends StatelessWidget {
  const Welcome_doc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome,',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: primarycolor,
                ),
              ),
              Text(
                'Dr/ mohamed',
                style: TextStyle(
                  fontSize: 50,
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
