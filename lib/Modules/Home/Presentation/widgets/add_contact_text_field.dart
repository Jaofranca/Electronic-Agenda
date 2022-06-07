import 'package:flutter/material.dart';

class AddContactTextField extends StatelessWidget {
  final TextEditingController? textController;
  final String? hintText;
  const AddContactTextField(
      {required this.textController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
