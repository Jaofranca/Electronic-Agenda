import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddContactTextField extends StatelessWidget {
  final TextEditingController? textController;
  final String? hintText;
  final List<TextInputFormatter>? formatter;
  const AddContactTextField(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.formatter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: formatter ?? [],
      controller: textController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
