import 'package:flutter/material.dart';

class AddContactLocalDialog extends StatelessWidget {
  const AddContactLocalDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Row(children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text("manually"),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("from Contacts"),
        )
      ]),
    );
  }
}
