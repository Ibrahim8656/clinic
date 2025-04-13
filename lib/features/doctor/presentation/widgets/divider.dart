import 'package:flutter/material.dart';

class divider extends StatelessWidget {
  const divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * .45,
        color: Colors.grey,
        child: SizedBox(height: 1),
      ),
    );
  }
}

