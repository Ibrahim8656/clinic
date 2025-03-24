import 'package:flutter/material.dart';

class custom_text_fild extends StatelessWidget {
  const custom_text_fild({
    super.key,
     required this.Controller,this.obscureText, required this.labelText, required this.prefixIcon, required this.validatemessage,
  });

  final TextEditingController Controller;
  final bool? obscureText;
  final String labelText,validatemessage;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       validator: (value) {
      if (value!.isEmpty) {
        return validatemessage;
      }
      return null;
    },
      controller: Controller,
      obscureText: obscureText??false,

      decoration: InputDecoration(
        
        border:OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
      ) ,labelText: labelText,prefixIcon: Icon(prefixIcon)),
      
    );
  }
}