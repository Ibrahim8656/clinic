import 'package:flutter/material.dart';

class Custom_text_formfild extends StatelessWidget {
  final String validatemessage,hintText;
  final FocusNode? focus;
  const Custom_text_formfild({
    super.key,
    required TextEditingController nameController, required this.validatemessage, required this.hintText,  this.focus,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value!.isEmpty){
          return validatemessage;
        }else null;
      },
      focusNode: focus,
      controller: _nameController,
      decoration: InputDecoration(
        labelText: hintText,
      ),
    );
  }
}
