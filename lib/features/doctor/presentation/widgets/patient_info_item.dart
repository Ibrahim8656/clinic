import 'package:flutter/material.dart';

class patient_info_item extends StatelessWidget {
  const patient_info_item({super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 131, 131, 131),
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            data,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 44, 44, 44),
            ),
          ),
        ],
      ),
    );
  }
}
